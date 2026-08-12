package com.example.flutter_pag_plugin;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.view.animation.LinearInterpolator;

import org.libpag.PAGFile;
import org.libpag.PAGPlayer;
import org.libpag.PAGText;
import org.libpag.PAGView;

import java.util.ArrayList;
import java.util.HashMap;

import io.flutter.plugin.common.MethodChannel;
import io.flutter.view.TextureRegistry;

import android.util.Log;


public class FlutterPagPlayer extends PAGPlayer {

    private final ValueAnimator animator = ValueAnimator.ofFloat(0.0F, 1.0F);
    private boolean isRelease;
    private long currentPlayTime = 0L;
    private double progress = 0;
    private double initProgress = 0;

    private MethodChannel channel;
    private long textureId;
    private TextureRegistry.SurfaceTextureEntry textureEntry;

    private PAGFile pagFile;

    public void init(PAGFile file, int repeatCount, double initProgress, MethodChannel channel, TextureRegistry.SurfaceTextureEntry textureEntry) {
        this.pagFile = file;
        setComposition(file);
        this.channel = channel;
        this.textureEntry = textureEntry;
        this.textureId = textureEntry.id();
        progress = initProgress;
        this.initProgress = initProgress;
        initAnimator(repeatCount);
        setUseDiskCache(true);
        setCacheScale(0.8f);
        // setCacheEnabled(false);

        Log.i("FlutterPagPlayer", String.format("UseDiskCache: %s,  CacheEnabled: %s, CacheScale: %s", useDiskCache(),cacheEnabled(),cacheScale()));

    }

    private void initAnimator(int repeatCount) {
        animator.setDuration(duration() / 1000L);
        animator.setInterpolator(new LinearInterpolator());
        animator.addUpdateListener(animatorUpdateListener);
        animator.addListener(animatorListenerAdapter);
        if (repeatCount < 0) {
            repeatCount = 0;
        }
        animator.setRepeatCount(repeatCount - 1);
        setProgressValue(initProgress);
    }

    public void setProgressValue(double value) {
        this.progress = Math.max(0.0D, Math.min(value, 1.0D));
        this.currentPlayTime = (long) (progress * (double) this.animator.getDuration());
        this.animator.setCurrentPlayTime(currentPlayTime);
        setProgress(progress);
        flush();
    }

    public void start() {
        super.prepare();
        animator.start();
    }

    public void stop() {
        animator.cancel();
    }

    public void pause() {
        animator.pause();
    }

    @Override
    public void release() {
        super.release();
        animator.removeUpdateListener(animatorUpdateListener);
        animator.removeListener(animatorListenerAdapter);
        if(textureEntry != null){
            textureEntry.release();
            textureEntry = null;
        }
        if(getSurface() != null){
            getSurface().release();
        }
        pagFile = null;
        isRelease = true;
    }

    @Override
    public boolean flush() {
        if (isRelease) {
            return false;
        }
        return super.flush();
    }

    // 更新PAG渲染
    private final ValueAnimator.AnimatorUpdateListener animatorUpdateListener = new ValueAnimator.AnimatorUpdateListener() {

        @Override
        public void onAnimationUpdate(ValueAnimator animation) {
            progress = (double) (Float) animation.getAnimatedValue();
            currentPlayTime = (long) (progress * (double) animator.getDuration());
            setProgress(progress);
            flush();
        }
    };

    public interface ReleaseListener {
        void onRelease();
    }

    // 动画状态监听
    private final AnimatorListenerAdapter animatorListenerAdapter = new AnimatorListenerAdapter() {
        @Override
        public void onAnimationStart(Animator animator) {
            super.onAnimationStart(animator);
            notifyEvent(FlutterPagPlugin._eventStart);
        }

        @Override
        public void onAnimationEnd(Animator animation) {
            super.onAnimationEnd(animation);
            // Align with iOS platform, avoid triggering this method when stopping
            int repeatCount = ((ValueAnimator) animation).getRepeatCount();
            if (repeatCount >= 0 && (animation.getDuration() > 0) &&
                    (currentPlayTime / animation.getDuration() > repeatCount)) {
                notifyEvent(FlutterPagPlugin._eventEnd);
            }
        }

        @Override
        public void onAnimationCancel(Animator animator) {
            super.onAnimationCancel(animator);
            notifyEvent(FlutterPagPlugin._eventCancel);
        }

        @Override
        public void onAnimationRepeat(Animator animator) {
            super.onAnimationRepeat(animator);
            notifyEvent(FlutterPagPlugin._eventRepeat);
        }
    };

    void notifyEvent(String event) {
        final HashMap<String, Object> arguments = new HashMap<>();
        arguments.put(FlutterPagPlugin._argumentTextureId, textureId);
        arguments.put(FlutterPagPlugin._argumentEvent, event);
        channel.invokeMethod(FlutterPagPlugin._playCallback, arguments);
    }

    String getPath(){
        if(pagFile != null){
            return pagFile.path();
        }
        return "";
    }

    int getNumTexts(){
        if(pagFile != null){
            return pagFile.numTexts();
        }
        return 0;
    }

    int getNumImages(){
        if(pagFile != null){
            return pagFile.numImages();
        }
        return 0;
    }

    String getTextData(int index){
        if(pagFile != null){
            PAGText pagText = pagFile.getTextData(index);
            if(pagText != null){
                return pagText.text;
            }
        }
        return "";
    }

    PAGFile getPagFile(){
        return pagFile;
    }
}
