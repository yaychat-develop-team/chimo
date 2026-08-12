package com.example.flutter_pag_plugin;

import android.content.res.AssetManager;
import android.graphics.Color;
import android.text.TextUtils;
import android.view.View;

import org.libpag.PAGComposition;
import org.libpag.PAGFile;
import org.libpag.PAGImage;
import org.libpag.PAGImageView;
import org.libpag.PAGLayer;
import org.libpag.PAGText;
import org.libpag.PAGView;

import java.util.ArrayList;
import java.util.List;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

/**
 * @author: comori
 * @DateTime: 2024/10/24
 */
public class PagDelegate {

    private PAGView pagView;

    private PAGImageView pagImageView;

    private PagDelegate() {
    }

    public static PagDelegate fromPagView(PAGView pagView) {
        PagDelegate delegate = new PagDelegate();
        delegate.pagView = pagView;
        return delegate;
    }

    public static PagDelegate fromPagImageView(PAGImageView pagImageView) {
        PagDelegate delegate = new PagDelegate();
        delegate.pagImageView = pagImageView;
        return delegate;
    }

    public void init(MethodCall call, MethodChannel.Result result, FlutterPlugin.FlutterAssets flutterAssets, PAGFile.LoadListener loadListener) {

        PAGFile.LoadListener innerListener = new PAGFile.LoadListener() {
            @Override
            public void onLoad(PAGFile pagFile) {
                if (pagFile == null) {
                    loadListener.onLoad(null);
                    return;
                }

                final Integer repeatCount = call.argument(Constant.Params.RepeatCount);
                final Double initProgress = call.argument(Constant.Params.Progress);
                final Boolean autoPlay = call.argument(Constant.Params.AutoPlay);
                final List<String> replaceTexts = call.argument(Constant.Params.Texts);
                final List<String> replaceTextColors = call.argument(Constant.Params.TextColors);
                final List<String> replaceTextStyles = call.argument(Constant.Params.TextStyles);
                final List<String> replaceImgs = call.argument(Constant.Params.Imgs);
                if (replaceTexts != null && !replaceTexts.isEmpty()) {
                    int numTexts = pagFile.numTexts();
                    int loopSize = Math.min(replaceTexts.size(), numTexts);
                    for (int i = 0; i < loopSize; i++) {
                        String text = replaceTexts.get(i);
                        if (text == null || text.isEmpty()) continue;
                        PAGText pagText = pagFile.getTextData(i);
                        pagText.text = text;
                        String color = safeGet(replaceTextColors, i);
                        String style = safeGet(replaceTextStyles, i);
                        if (!TextUtils.isEmpty(color)) {
                            try {
                                pagText.fillColor = Color.parseColor(color);
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }
                        if (!TextUtils.isEmpty(style)) {
                            try {
                                pagText.fontStyle = style;
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }
                        pagFile.replaceText(i, pagText);
                    }
                }

                if (replaceImgs != null && !replaceImgs.isEmpty()) {
                    int numImgs = pagFile.numImages();
                    int loopSize = Math.min(replaceImgs.size(), numImgs);
                    for (int i = 0; i < loopSize; i++) {
                        String localPath = replaceImgs.get(i);
                        if (localPath == null || localPath.isEmpty()) continue;
                        PAGImage pagImage = PAGImage.FromPath(localPath);
                        if (pagImage == null) continue;
                        pagFile.replaceImage(i, pagImage);
                    }
                }

                if (initProgress != null && initProgress >= 0) {
                    setProgress(initProgress);
                }

                if (repeatCount != null) {
                    setRepeatCount(repeatCount);
                }

                setComposition(pagFile);

                if (autoPlay != null && autoPlay) {
                    play();
                }

                loadListener.onLoad(pagFile);
            }
        };

        String assetName = call.argument(Constant.Params.AssetName);
        byte[] bytes = call.argument(Constant.Params.Bytes);
        String url = call.argument(Constant.Params.Url);
        String flutterPackage = call.argument(Constant.Params.Package);
        PAGFile pagFile = null;
        if (bytes != null) {
            pagFile = PAGFile.Load(bytes);
            innerListener.onLoad(pagFile);
        } else if (!TextUtils.isEmpty(assetName)) {
            String assetKey = null;
            if (flutterPackage == null || flutterPackage.isEmpty()) {
                assetKey = flutterAssets.getAssetFilePathByName(assetName);
            } else {
                assetKey = flutterAssets.getAssetFilePathByName(assetName, flutterPackage);
            }
            if (assetKey == null) {
                result.error("-1100", "asset资源加载错误", null);
                return;
            }
            pagFile = PAGFile.Load(getAssets(), assetKey);
            innerListener.onLoad(pagFile);
        } else if (!TextUtils.isEmpty(url)) {
            if(url.startsWith("http")){
                DataLoadHelper.INSTANCE.loadPag(url, diskBytes -> {
                    if (diskBytes == null) {
                        PAGFile.LoadAsync(url, innerListener);
                    } else {
                        innerListener.onLoad(PAGFile.Load(diskBytes));
                    }
                    return null;
                }, DataLoadHelper.FROM_PLUGIN, true);
            }else{
                innerListener.onLoad(PAGFile.Load(url));
            }
            
        }
    }

    public void setPath(String pathOrUrl) {
        if (pagView != null) {
            pagView.setPath(pathOrUrl);
        } else if (pagImageView != null) {
            pagImageView.setPath(pathOrUrl);
        }
    }

    public void setRepeatCount(int count) {
        if (pagView != null) {
            pagView.setRepeatCount(count);
        } else if (pagImageView != null) {
            pagImageView.setRepeatCount(count);
        }
    }

    public void setComposition(PAGComposition composition) {
        if (pagView != null) {
            pagView.setComposition(composition);
        } else if (pagImageView != null) {
            pagImageView.setComposition(composition);
        }
    }

    public void play() {
        if (pagView != null) {
            pagView.play();
        } else if (pagImageView != null) {
            pagImageView.play();
        }
    }

    public void pause() {
        if (pagView != null) {
            pagView.pause();
        } else if (pagImageView != null) {
            pagImageView.pause();
        }
    }

    public void stop() {
        if (pagView != null) {
            pagView.stop();
        } else if (pagImageView != null) {
            pagImageView.pause();
        }
    }

    public void setProgress(double progress) {
        if (pagView != null) {
            pagView.setProgress(progress);
        } else if (pagImageView != null) {
            pagImageView.getComposition().setProgress(progress);
        }
    }

    private AssetManager getAssets() {
        if (pagView != null) {
            return pagView.getContext().getAssets();
        } else if (pagImageView != null) {
            return pagImageView.getContext().getAssets();
        }
        return null;
    }

    private String safeGet(List<String> array, int index) {
        if (array == null || array.size() <= index) {
            return null;
        }
        return array.get(index);
    }

    public View getView() {
        if (pagView != null) {
            return pagView;
        } else if (pagImageView != null) {
            return pagImageView;
        }
        return null;
    }

    public void dispose() {
        if (pagView != null) {
            pagView.stop();
            pagView.freeCache();
            pagView = null;
        } else if (pagImageView != null) {
            pagImageView.pause();
            pagImageView = null;
        }
    }

    public void resume() {
        if (pagView != null) {
            pagView.play();
        } else if (pagImageView != null) {
            pagImageView.play();
        }
    }

    public List<String> getLayersUnderPoint(Float x, Float y) {
        if (x == null || y == null) return List.of();
        List<String> layerNames = new ArrayList<>();
        PAGLayer[] layers = null;
        if (pagView != null) {
            layers = pagView.getLayersUnderPoint(x, y);
        } else if (pagImageView != null && pagImageView.getComposition() != null) {
            layers = pagImageView.getComposition().getLayersUnderPoint(x, y);
        }
        if (layers != null) {
            for (PAGLayer layer : layers) {
                layerNames.add(layer.layerName());
            }
        }
        return layerNames;
    }

    public int getTextNum() {
        if (pagView != null) {
            return ((PAGFile) pagView.getComposition()).numTexts();
        } else if (pagImageView != null) {
            return ((PAGFile) pagImageView.getComposition()).numTexts();
        }
        return 0;
    }

    public int getImageNum() {
        if (pagView != null) {
            return ((PAGFile) pagView.getComposition()).numImages();
        } else if (pagImageView != null) {
            return ((PAGFile) pagImageView.getComposition()).numImages();
        }
        return 0;
    }

    public String getPath() {
        if (pagView != null) {
            return ((PAGFile) pagView.getComposition()).path();
        } else if (pagImageView != null) {
            return ((PAGFile) pagImageView.getComposition()).path();
        }
        return "";
    }

    public String getTextData(int index) {
        PAGFile pagFile = null;
        if (pagView != null) {
            pagFile = (PAGFile) pagView.getComposition();
        } else if (pagImageView != null) {
            pagFile = (PAGFile) pagImageView.getComposition();
        }

        if (pagFile != null) {
            PAGText pagText = pagFile.getTextData(index);
            if (pagText != null) {
                return pagText.text;
            }
        }
        return "";
    }
}
