package com.example.flutter_pag_plugin;

/**
 * @author: comori
 * @DateTime: 2024/10/24
 */
public class Constant {

    interface ViewTypes{
        String PAG_VIEW = "yay.pagview";
        String PAG_IMAGE_VIEW = "yay.pagimgview";
    }

    interface Methods{

        String Init = "initPag";
        String Release = "release";
        String Start = "start";
        String Stop = "stop";
        String Pause = "pause";
        String Resume = "resume";
        String SetProgress = "setProgress";
        String GetPointLayer = "getLayersUnderPoint";
        String NumTexts = "numTexts";
        String NumImages = "numImages";
        String GetPath = "getPath";
        String GetTextData = "getTextData";

    }

    interface Params{
        String TextureId = "textureId";
        String AssetName = "assetName";
        String Package = "package";
        String Url = "url";
        String Bytes = "bytesData";
        String RepeatCount = "repeatCount";
        String InitProgress = "initProgress";
        String AutoPlay = "autoPlay";
        String Width = "width";
        String Height = "height";
        String PointX = "x";
        String PointY = "y";
        String Progress = "progress";
        String Event = "PAGEvent";
        String Index = "index";
        String Texts = "texts";
        String TextColors = "textColors";
        String TextStyles = "textStyles";
        String Imgs = "imgs";
    }

    interface Event{
        String Callback = "PAGCallback";
        String Start = "onAnimationStart";
        String End = "onAnimationEnd";
        String Cancel = "onAnimationCancel";
        String Repeat = "onAnimationRepeat";
        String Update = "onAnimationUpdate";
    }

}
