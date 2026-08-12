package com.example.flutter_pag_plugin;

import android.content.Context;
import android.graphics.Color;
import android.graphics.SurfaceTexture;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.Surface;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleObserver;
import androidx.lifecycle.OnLifecycleEvent;

import org.libpag.PAGFile;
import org.libpag.PAGImage;
import org.libpag.PAGLayer;
import org.libpag.PAGSurface;
import org.libpag.PAGText;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.embedding.engine.plugins.lifecycle.HiddenLifecycleReference;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.view.TextureRegistry;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import android.util.Log;

/**
 * FlutterPagPlugin
 */
public class FlutterPagPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware, LifecycleObserver {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private MethodChannel channel;
    TextureRegistry textureRegistry;
    Context context;
    FlutterPlugin.FlutterAssets flutterAssets;
    private final Handler handler = new Handler(Looper.getMainLooper());

    public Map<String, FlutterPagPlayer> layerMap = new ConcurrentHashMap<>();
//    public Map<String, TextureRegistry.SurfaceTextureEntry> entryMap = new ConcurrentHashMap<String, TextureRegistry.SurfaceTextureEntry>();

    // 原生接口
    final static String _nativeInit = "initPag";
    final static String _nativeRelease = "release";
    final static String _nativeStart = "start";
    final static String _nativeStop = "stop";
    final static String _nativePause = "pause";
    final static String _nativeSetProgress = "setProgress";
    final static String _nativeGetPointLayer = "getLayersUnderPoint";
    final static String _nativeNumTexts = "numTexts";
    final static String _nativeNumImages = "numImages";
    final static String _nativeGetPath = "getPath";
    final static String _nativeGetTextData = "getTextData";
    final static String _nativeChangeText = "changeText";


    // 参数
    final static String _argumentTextureId = "textureId";
    final static String _argumentAssetName = "assetName";
    final static String _argumentPackage = "package";
    final static String _argumentUrl = "url";
    final static String _argumentBytes = "bytesData";
    final static String _argumentRepeatCount = "repeatCount";
    final static String _argumentInitProgress = "initProgress";
    final static String _argumentAutoPlay = "autoPlay";
    final static String _argumentWidth = "width";
    final static String _argumentHeight = "height";
    final static String _argumentPointX = "x";
    final static String _argumentPointY = "y";
    final static String _argumentProgress = "progress";
    final static String _argumentEvent = "PAGEvent";
    final static String _argumentIndex = "index";
    final static String _argumentTexts = "texts";

    final static String _argumentTextColors = "textColors";
    final static String _argumentImgs = "imgs";

    // 回调
    final static String _playCallback = "PAGCallback";
    final static String _eventStart = "onAnimationStart";
    final static String _eventEnd = "onAnimationEnd";
    final static String _eventCancel = "onAnimationCancel";
    final static String _eventRepeat = "onAnimationRepeat";
    final static String _eventUpdate = "onAnimationUpdate";


    public FlutterPagPlugin() {
    }


    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        flutterAssets = binding.getFlutterAssets();
        channel = new MethodChannel(binding.getBinaryMessenger(), "flutter_pag_plugin");
        channel.setMethodCallHandler(this);
        context = binding.getApplicationContext();
        textureRegistry = binding.getTextureRegistry();
        DataLoadHelper.INSTANCE.initDiskCache(context, DataLoadHelper.DEFAULT_DIS_SIZE);

        binding.getPlatformViewRegistry().registerViewFactory(
                "plugins.yay.chat/pag_view",
                new FlutterPagViewFactory(
                        binding.getBinaryMessenger(),
                        flutterAssets,
                        Constant.ViewTypes.PAG_VIEW));

        binding.getPlatformViewRegistry().registerViewFactory(
                "plugins.yay.chat/pag_img_view",
                new FlutterPagViewFactory(
                        binding.getBinaryMessenger(),
                        flutterAssets,
                        Constant.ViewTypes.PAG_IMAGE_VIEW));

    }


    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        switch (call.method) {
            case _nativeInit:
                initPag(call, result);
                break;
            case _nativeStart:
                start(call);
                result.success("");
                break;
            case _nativeStop:
                stop(call);
                result.success("");
                break;
            case _nativePause:
                pause(call);
                result.success("");
                break;
            case Constant.Methods.Resume:
                resume(call);
                result.success("");
                break;
            case _nativeSetProgress:
                setProgress(call);
                result.success("");
                break;
            case _nativeRelease:
                release(call);
                result.success("");
                break;
            case _nativeGetPointLayer:
                result.success(getLayersUnderPoint(call));
                break;
            case _nativeGetPath:
                result.success(getPath(call));
                break;
            case _nativeNumTexts:
                result.success(numTexts(call));
                break;
            case _nativeNumImages:
                result.success(numImages(call));
                break;
            case _nativeGetTextData:
                result.success(getTextData(call));
                break;
            case _nativeChangeText:
                changeText(call);
                result.success("");
                break;
            default:
                result.notImplemented();
                break;
        }
    }

    private void initPag(final MethodCall call, final Result result) {
        String assetName = call.argument(_argumentAssetName);
        byte[] bytes = call.argument(_argumentBytes);
        String url = call.argument(_argumentUrl);
        String flutterPackage = call.argument(_argumentPackage);

        if (bytes != null) {
            initPagPlayerAndCallback(PAGFile.Load(bytes), call, result);
        } else if (assetName != null) {
            String assetKey = "";

            if (flutterAssets != null) {
                if (flutterPackage == null || flutterPackage.isEmpty()) {
                    assetKey = flutterAssets.getAssetFilePathByName(assetName);
                } else {
                    assetKey = flutterAssets.getAssetFilePathByName(assetName, flutterPackage);
                }
            }

            if (assetKey == null) {
                result.error("-1100", "asset资源加载错误", null);
                return;
            }

            PAGFile composition = PAGFile.Load(context.getAssets(), assetKey);
            initPagPlayerAndCallback(composition, call, result);
        } else if (url != null) {
            if(url.startsWith("http")){
                DataLoadHelper.INSTANCE.loadPag(url, new Function1<byte[], Unit>() {
                    @Override
                    public Unit invoke(final byte[] bytes) {
                        handler.post(new Runnable() {
                            @Override
                            public void run() {
                                if (bytes == null) {
                                    result.error("-1100", "url资源加载错误", null);
                                    return;
                                }
    
                                initPagPlayerAndCallback(PAGFile.Load(bytes), call, result);
                            }
                        });
    
                        return null;
                    }
                }, DataLoadHelper.FROM_PLUGIN, false);
            }else {
                initPagPlayerAndCallback(PAGFile.Load(url), call, result);
            }
            
        } else {
            result.error("-1100", "未添加资源", null);
        }
    }

    private void initPagPlayerAndCallback(PAGFile composition, MethodCall call, final Result result) {
        if (composition == null) {
            result.error("-1100", "load composition is null! ", null);
            return;
        }

        final int repeatCount = call.argument(_argumentRepeatCount);
        final double initProgress = call.argument(_argumentInitProgress);
        final boolean autoPlay = call.argument(_argumentAutoPlay);
        final List<String> replaceTexts = call.argument(_argumentTexts);
        final List<String> replaceTextColors = call.argument(_argumentTextColors);
        final List<String> replaceImgs = call.argument(_argumentImgs);

        if(replaceTexts != null && replaceTexts.size() > 0){
            int numTexts = composition.numTexts();
            int loopSize = Math.min(replaceTexts.size(),numTexts);
            for(int i=0;i<loopSize;i++){
                String text = replaceTexts.get(i);
                if(text == null || text.isEmpty()) continue;
                PAGText pagText = composition.getTextData(i);
                pagText.text = text;
                String color = safeGet(replaceTextColors,i);
                if(!TextUtils.isEmpty(color)){
                    try{
                        pagText.fillColor = Color.parseColor(color);
                    }catch (Exception e){
                        e.printStackTrace();
                    }
                }
                composition.replaceText(i, pagText);
            }
        }

        if(replaceImgs != null && replaceImgs.size() > 0){
            int numImgs = composition.numImages();
            int loopSize = Math.min(replaceImgs.size(),numImgs);
            for(int i=0;i<loopSize;i++){
                String localPath = replaceImgs.get(i);
                if(localPath == null || localPath.isEmpty()) continue;
                PAGImage pagImage = PAGImage.FromPath(localPath);
                if(pagImage == null) continue;
                composition.replaceImage(i, pagImage);
            }
        }


        final FlutterPagPlayer pagPlayer = new FlutterPagPlayer();
        final TextureRegistry.SurfaceTextureEntry entry = textureRegistry.createSurfaceTexture();

        pagPlayer.init(composition, repeatCount, initProgress, channel, entry);
        SurfaceTexture surfaceTexture = entry.surfaceTexture();
        setupDefaultBufferSize(surfaceTexture,composition.width(),composition.height());
        Log.i("FlutterPagPlugin", String.format("composition width: %s,  height: %s", composition.width(), composition.height()));
        Log.i("FlutterPagPlugin", String.format("Screen width: %s,  height: %s", context.getResources().getDisplayMetrics().widthPixels, context.getResources().getDisplayMetrics().heightPixels));

        final PAGSurface pagSurface = PAGSurface.FromSurfaceTexture(surfaceTexture);
        pagPlayer.setSurface(pagSurface);

        layerMap.put(String.valueOf(entry.id()), pagPlayer);
        final HashMap<String, Object> callback = new HashMap<String, Object>();
        callback.put(_argumentTextureId, entry.id());
        callback.put(_argumentWidth, (double) composition.width());
        callback.put(_argumentHeight, (double) composition.height());
        if (autoPlay) {
            pagPlayer.start();
        }
        successResult(result,callback);
    }

    void start(MethodCall call) {
        FlutterPagPlayer flutterPagPlayer = getFlutterPagPlayer(call);
        if (flutterPagPlayer != null) {
            flutterPagPlayer.start();
        }
    }

    void stop(MethodCall call) {
        FlutterPagPlayer flutterPagPlayer = getFlutterPagPlayer(call);
        if (flutterPagPlayer != null) {
            flutterPagPlayer.stop();
        }
    }

    void pause(MethodCall call) {
        FlutterPagPlayer flutterPagPlayer = getFlutterPagPlayer(call);
        if (flutterPagPlayer != null) {
            flutterPagPlayer.pause();
        }
    }

    private void resume(MethodCall call) {
        FlutterPagPlayer flutterPagPlayer = getFlutterPagPlayer(call);
        if (flutterPagPlayer != null) {
            flutterPagPlayer.start();
        }
    }

    void setProgress(MethodCall call) {
        double progress = call.argument(_argumentProgress);
        FlutterPagPlayer flutterPagPlayer = getFlutterPagPlayer(call);
        if (flutterPagPlayer != null) {
            flutterPagPlayer.setProgressValue(progress);
        }
    }

    void release(MethodCall call) {
        FlutterPagPlayer flutterPagPlayer = layerMap.remove(getTextureId(call));
        if (flutterPagPlayer != null) {
            flutterPagPlayer.stop();
            flutterPagPlayer.release();
        }
    }

    String getPath(MethodCall call){
        FlutterPagPlayer flutterPagPlayer = getFlutterPagPlayer(call);
        if(flutterPagPlayer != null){
            return flutterPagPlayer.getPath();
        }
        return "";
    }

    int numTexts(MethodCall call){
        FlutterPagPlayer flutterPagPlayer = getFlutterPagPlayer(call);
        if(flutterPagPlayer != null){
            return flutterPagPlayer.getNumTexts();
        }
        return 0;
    }

    int numImages(MethodCall call){
        FlutterPagPlayer flutterPagPlayer = getFlutterPagPlayer(call);
        if(flutterPagPlayer != null){
            return flutterPagPlayer.getNumImages();
        }
        return 0;
    }

    void changeText(MethodCall call) {
        FlutterPagPlayer flutterPagPlayer = getFlutterPagPlayer(call);
        final List<String> replaceTexts = call.argument(_argumentTexts);
        if(flutterPagPlayer != null && replaceTexts != null && replaceTexts.size() > 0){
            int numTexts = flutterPagPlayer.getNumTexts();
            int loopSize = Math.min(replaceTexts.size(),numTexts);
            for(int i=0;i<loopSize;i++){
                String text = replaceTexts.get(i);
                if(text == null || text.isEmpty()) continue;
                PAGText pagText = flutterPagPlayer.getPagFile().getTextData(i);
                pagText.text = text;
                flutterPagPlayer.getPagFile().replaceText(i, pagText);
            }
        }
    }

    String getTextData(MethodCall call){
        FlutterPagPlayer flutterPagPlayer = getFlutterPagPlayer(call);
        if(flutterPagPlayer != null){
            int index = (Integer) call.argument(_argumentIndex);
            return flutterPagPlayer.getTextData(index);
        }
        return "";
    }

    List<String> getLayersUnderPoint(MethodCall call) {
        FlutterPagPlayer flutterPagPlayer = getFlutterPagPlayer(call);

        List<String> layerNames = new ArrayList();
        PAGLayer[] layers = null;
        if (flutterPagPlayer != null) {
            layers = flutterPagPlayer.getLayersUnderPoint(
                    ((Double) call.argument(_argumentPointX)).floatValue(), ((Double) call.argument(_argumentPointY)).floatValue());
        }

        if (layers != null) {
            for (PAGLayer layer : layers) {
                layerNames.add(layer.layerName());
            }
        }

        return layerNames;
    }

    FlutterPagPlayer getFlutterPagPlayer(MethodCall call) {
        return layerMap.get(getTextureId(call));
    }

    String getTextureId(MethodCall call) {
        return "" + call.argument(_argumentTextureId);
    }

    //插件销毁
    public void onDestroy() {
        for (FlutterPagPlayer pagPlayer : layerMap.values()) {
            pagPlayer.release();
        }
        layerMap.clear();
        channel.setMethodCallHandler(null);
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        onDestroy();
    }

    String safeGet(List<String> array, int index){
        if(array == null || array.size() <= index){
            return null;
        }
        return array.get(index);
    }

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        Object obj = binding.getLifecycle();
        if(obj instanceof HiddenLifecycleReference){
            HiddenLifecycleReference reference =
                    (HiddenLifecycleReference) binding.getLifecycle();
            reference.getLifecycle().addObserver(this);
        }
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {

    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {

    }

    @Override
    public void onDetachedFromActivity() {
        onDestroy();
    }


    @OnLifecycleEvent(Lifecycle.Event.ON_RESUME)
    public void onResume() {
        for (FlutterPagPlayer pagPlayer : layerMap.values()) {
            pagPlayer.start();
        }
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_PAUSE)
    public void onPause() {
        for (FlutterPagPlayer pagPlayer : layerMap.values()) {
            pagPlayer.pause();
        }
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_STOP)
    public void onStop() {
        for (FlutterPagPlayer pagPlayer : layerMap.values()) {
            pagPlayer.stop();
        }
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

    void setupDefaultBufferSize(SurfaceTexture texture, int pagWidth, int pagHeight){
        DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
        float sW = pagWidth*1.0f / displayMetrics.widthPixels;
        float sH = pagHeight*1.0f / displayMetrics.heightPixels;
        if(sW > 1.0 || sH > 1.0){
            float scale = 1 / Math.max(sW,sH);
            texture.setDefaultBufferSize((int) (pagWidth * scale), (int) (pagHeight*scale));
        }else{
            texture.setDefaultBufferSize(pagWidth ,pagHeight);
        }
    }
}
