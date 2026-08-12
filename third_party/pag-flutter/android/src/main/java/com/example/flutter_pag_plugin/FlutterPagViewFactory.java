package com.example.flutter_pag_plugin;

import android.content.Context;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

/**
 * @author: comori
 * @DateTime: 2024/10/24
 */
public class FlutterPagViewFactory extends PlatformViewFactory {

    private final BinaryMessenger binaryMessenger;
    private final String platformViewType;
    private FlutterPlugin.FlutterAssets flutterAssets;

    public FlutterPagViewFactory(BinaryMessenger binaryMessenger,FlutterPlugin.FlutterAssets flutterAssets,String platformViewType) {
        super(StandardMessageCodec.INSTANCE);
        this.binaryMessenger = binaryMessenger;
        this.platformViewType = platformViewType;
        this.flutterAssets = flutterAssets;
    }

    @NonNull
    @Override
    public PlatformView create(Context context, int viewId, @Nullable Object args) {
        return new FlutterPagView(context,viewId,platformViewType, binaryMessenger, flutterAssets);
    }
}
