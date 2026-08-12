class ViewTypes {
  static const PAG_VIEW = "yay.pagview";
  static const PAG_IMAGE_VIEW = "yay.pagimgview";
}

class Methods {
  static const Init = "initPag";
  static const Release = "release";
  static const Start = "start";
  static const Stop = "stop";
  static const Pause = "pause";
  static const Resume = "resume";
  static const SetProgress = "setProgress";
  static const GetPointLayer = "getLayersUnderPoint";
  static const NumTexts = "numTexts";
  static const NumImages = "numImages";
  static const GetPath = "getPath";
  static const GetTextData = "getTextData";
}

class Params {
  static const TextureId = "textureId";
  static const AssetName = "assetName";
  static const Package = "package";
  static const Url = "url";
  static const Bytes = "bytesData";
  static const RepeatCount = "repeatCount";
  static const InitProgress = "initProgress";
  static const AutoPlay = "autoPlay";
  static const Width = "width";
  static const Height = "height";
  static const PointX = "x";
  static const PointY = "y";
  static const Progress = "progress";
  static const Event = "PAGEvent";
  static const Index = "index";
  static const Texts = "texts";
  static const TextColors = "textColors";
  static const TextStyles = "textStyles";
  static const Imgs = "imgs";
}

class Event {
  static const Callback = "PAGCallback";
  static const Start = "onAnimationStart";
  static const End = "onAnimationEnd";
  static const Cancel = "onAnimationCancel";
  static const Repeat = "onAnimationRepeat";
  static const Update = "onAnimationUpdate";
}
typedef PAGCallback = void Function();
