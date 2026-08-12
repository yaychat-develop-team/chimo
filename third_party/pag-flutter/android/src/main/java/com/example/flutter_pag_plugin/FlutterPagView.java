package com.example.flutter_pag_plugin;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.widget.FrameLayout;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import org.libpag.PAGComposition;
import org.libpag.PAGFile;
import org.libpag.PAGImageView;
import org.libpag.PAGView;

import java.util.HashMap;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.platform.PlatformView;

/**
 * @author: comori
 * @DateTime: 2024/10/24
 */
public class FlutterPagView implements PlatformView, MethodChannel.MethodCallHandler, PAGView.PAGViewListener, PAGImageView.PAGImageViewListener {

    private final Context context;

    private final int platformViewId;

    private final String platformViewType;

    private MethodChannel methodChannel;

    private FlutterPlugin.FlutterAssets flutterAssets;

    private final Handler handler = new Handler(Looper.getMainLooper());

    private final ConcurrentHashMap<String, MethodChannel.Result> resultMap = new ConcurrentHashMap<>();

    private PagDelegate pagDelegate;

    public FlutterPagView(Context context, int platformViewId, String platformViewType, BinaryMessenger messenger, FlutterPlugin.FlutterAssets flutterAssets) {
        this.context = context;
        this.platformViewId = platformViewId;
        this.platformViewType = platformViewType;
        this.flutterAssets = flutterAssets;

        this.methodChannel = new MethodChannel(messenger, String.format("plugins/flutter_pag_%s_%s", platformViewType, platformViewId));
        this.methodChannel.setMethodCallHandler(this);

        if (Objects.equals(platformViewType, Constant.ViewTypes.PAG_VIEW)) {
            PAGView pagView = new PAGView(context);
            pagView.addListener(this);
            pagDelegate = PagDelegate.fromPagView(pagView);
        } else if (Objects.equals(platformViewType, Constant.ViewTypes.PAG_IMAGE_VIEW)) {
            PAGImageView pagImageView = new PAGImageView(context);
            pagImageView.addListener(this);
            pagDelegate = PagDelegate.fromPagImageView(pagImageView);
        }
    }


    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        String method = call.method;
        resultMap.put(method, result);
        switch (method) {
            case Constant.Methods.Init -> {
                pagDelegate.init(call, result, flutterAssets, loadPagFileListener);
            }
            case Constant.Methods.Start -> pagDelegate.play();
            case Constant.Methods.Pause -> pagDelegate.pause();
            case Constant.Methods.Resume -> pagDelegate.resume();
            case Constant.Methods.Release -> pagDelegate.dispose();
            case Constant.Methods.Stop -> pagDelegate.stop();
            case Constant.Methods.SetProgress -> {
                Double progress = call.argument(Constant.Params.Progress);
                if (progress != null && progress > 0) {
                    pagDelegate.setProgress(progress);
                }
            }
            case Constant.Methods.GetPointLayer -> {
                Float x = call.argument(Constant.Params.PointX);
                Float y = call.argument(Constant.Params.PointY);
                List<String> layers = pagDelegate.getLayersUnderPoint(x, y);
                successResult(result, layers);
            }
            case Constant.Methods.NumTexts -> successResult(result, pagDelegate.getTextNum());
            case Constant.Methods.NumImages -> successResult(result, pagDelegate.getImageNum());
            case Constant.Methods.GetPath -> successResult(result, pagDelegate.getPath());
            case Constant.Methods.GetTextData -> {
                Integer index = call.argument(Constant.Params.Index);
                successResult(result, pagDelegate.getTextData(index == null ? 0 : index));
            }
        }
    }

    private final PAGFile.LoadListener loadPagFileListener = new PAGFile.LoadListener() {
        @Override
        public void onLoad(PAGFile pagFile) {
            MethodChannel.Result result = resultMap.get(Constant.Methods.Init);
            if (result == null) {
                return;
            }
            if (pagFile == null) {
                errorResult(result, "-1100", "load composition is null! ", null);
                return;
            }

            final HashMap<String, Object> callback = new HashMap<String, Object>();
            callback.put(Constant.Params.TextureId, platformViewId);
            callback.put(Constant.Params.Width, (double) pagFile.width());
            callback.put(Constant.Params.Height, (double) pagFile.height());
            successResult(result, callback);
        }
    };

    @Nullable
    @Override
    public View getView() {
        return pagDelegate.getView();
    }

    @Override
    public void dispose() {
        methodChannel.setMethodCallHandler(null);
        if (pagDelegate != null) {
            pagDelegate.dispose();
        }
    }

    @Override
    public void onAnimationStart(PAGView pagView) {
        notifyEvent(Constant.Event.Start);
    }

    @Override
    public void onAnimationEnd(PAGView pagView) {
        notifyEvent(Constant.Event.End);
    }

    @Override
    public void onAnimationCancel(PAGView pagView) {
        notifyEvent(Constant.Event.Cancel);
    }

    @Override
    public void onAnimationRepeat(PAGView pagView) {
        notifyEvent(Constant.Event.Repeat);
    }

    @Override
    public void onAnimationUpdate(PAGView pagView) {
        notifyEvent(Constant.Event.Update);
    }

    @Override
    public void onAnimationStart(PAGImageView pagImageView) {
        notifyEvent(Constant.Event.Start);
    }

    @Override
    public void onAnimationEnd(PAGImageView pagImageView) {
        notifyEvent(Constant.Event.End);
    }

    @Override
    public void onAnimationCancel(PAGImageView pagImageView) {
        notifyEvent(Constant.Event.Cancel);
    }

    @Override
    public void onAnimationRepeat(PAGImageView pagImageView) {
        notifyEvent(Constant.Event.Repeat);
    }

    @Override
    public void onAnimationUpdate(PAGImageView pagImageView) {
        notifyEvent(Constant.Event.Update);
    }

    void notifyEvent(String event) {
        handler.post(() -> {
            final HashMap<String, Object> arguments = new HashMap<>();
            arguments.put(Constant.Params.TextureId, platformViewId);
            arguments.put(Constant.Params.Event, event);
            methodChannel.invokeMethod(Constant.Event.Callback, arguments);
        });
    }

    void successResult(MethodChannel.Result result, Object data) {
        handler.post(() -> {
            result.success(data);
        });
    }

    void errorResult(MethodChannel.Result result, @NonNull String errorCode, @Nullable String errorMessage, @Nullable Object errorDetails) {
        handler.post(() -> {
            result.error(errorCode, errorMessage, errorDetails);
        });
    }
}
