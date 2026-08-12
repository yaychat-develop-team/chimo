//
//  FlutterPagImageView.m
//  pag
//
//  Created by 梁杰 on 2024/11/5.
//

#import "FlutterPagImageView.h"
#import <Foundation/Foundation.h>
#include <libpag/PAGView.h>
#include <libpag/PAGImageView.h>
#import "TGFlutterPagDownloadManager.h"
#import "FlutterPagPlugin.h"
#import "TGFlutterPagRender.h"


@interface FlutterPagImageView()

@property (nonatomic, strong) PAGImageView  *pagImageView;
@property(nonatomic, strong)PAGFile* pagFile;
@property(nonatomic, assign)double initProgress;
@property (nonatomic, strong)NSCache<NSString*, NSData *> *cache;

@end


@implementation FlutterPagImageView {
    int64_t _viewId;
    FlutterMethodChannel* _channel;
}

- (NSObject<FlutterMessageCodec>*)createArgsCodec {
  return [FlutterStandardMessageCodec sharedInstance];
}

- (instancetype)initWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args binaryMessenger:(NSObject<FlutterBinaryMessenger> *)messenger {
    _viewId = viewId;
    self.pagImageView = [[PAGImageView alloc] initWithFrame:self.view.bounds];
    [self.pagImageView addListener:self];
    NSString* channelName = [NSString stringWithFormat:@"plugins/flutter_pag_yay.pagimgview_%lld", viewId];
    _channel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:messenger];
    __weak __typeof__(self) weakSelf = self;
    [_channel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
      [weakSelf onMethodCall:call result:result];
    }];
    
    return self;
}

- (nonnull UIView *)view {
    return self.pagImageView;
}

- (void)getLayersUnderPoint:(id)arguments result:(FlutterResult _Nonnull)result {
    NSNumber* x = arguments[@"x"];
    NSNumber* y = arguments[@"y"];
    NSArray<NSString *> *names = [self getLayersUnderPoint:CGPointMake(x.doubleValue, y.doubleValue)];
    result(names);
}

- (void)release:(id)arguments result:(FlutterResult _Nonnull)result {
    [self.pagImageView pause];
    self.pagImageView = nil;
    self.pagFile = nil;
    _channel = nil;
    result(@"");
}

- (void)setProgress:(id)arguments result:(FlutterResult _Nonnull)result {

    double progress = 0.0;
    if (arguments[@"progress"]) {
        progress = [arguments[@"progress"] doubleValue];
    }
    [self.pagImageView.getComposition setProgress:progress];
    result(@"");
}

- (void)pause:(id)arguments result:(FlutterResult _Nonnull)result {
    [self.pagImageView pause];
    result(@"");
}

- (void)stop:(id)arguments result:(FlutterResult _Nonnull)result {
    [self.pagImageView pause];
    result(@"");
}

- (void)start:(id)arguments result:(FlutterResult _Nonnull)result {
    [self.pagImageView play];
    result(@"");
}

- (void)resume:(id)arguments result:(FlutterResult _Nonnull)result {
    [self.pagImageView play];
    result(@"");
}

- (void)initPag:(id)arguments result:(FlutterResult _Nonnull)result {
    if (arguments == nil || (arguments[@"assetName"] == NSNull.null && arguments[@"url"] == NSNull.null && arguments[@"bytesData"] == NSNull.null)) {
        result(@-1);
        NSLog(@"showPag arguments is nil");
        return;
    }
    double initProgress = 0.0;
    if (arguments[@"initProgress"]) {
        initProgress = [arguments[@"initProgress"] doubleValue];
    }
    int repeatCount = -1;
    if(arguments[@"repeatCount"]){
        repeatCount = [[arguments objectForKey:@"repeatCount"] intValue];
    }
    
    BOOL autoPlay = NO;
    if(arguments[@"autoPlay"]){
        autoPlay = [[arguments objectForKey:@"autoPlay"] boolValue];
    }

    NSArray<NSString *> *replaceTexts = nil;
    if([arguments[@"texts"] isKindOfClass:[NSArray class]]){
        replaceTexts = arguments[@"texts"];
    }

    NSArray<NSString *> *replaceTextColors = nil;
    if([arguments[@"textColors"] isKindOfClass:[NSArray class]]){
        replaceTextColors = arguments[@"textColors"];
    }

    NSArray<NSString *> *replaceImages = nil;
    if([arguments[@"imgs"] isKindOfClass:[NSArray class]]){
        replaceImages = arguments[@"imgs"];
    }

    NSString* assetName = arguments[@"assetName"];
    NSData *pagData = nil;
    if ([assetName isKindOfClass:NSString.class] && assetName.length > 0) {
        NSString *key = assetName;
        pagData = [self getCacheData:key];
        if (!pagData) {
            NSString* package = arguments[@"package"];
            NSString* resourcePath;
            if(package && [package isKindOfClass:NSString.class] && package.length > 0){
                resourcePath = [FlutterDartProject lookupKeyForAsset:assetName fromPackage:package];
            }else{
                resourcePath = [FlutterDartProject lookupKeyForAsset:assetName];
            }

            resourcePath = [[NSBundle mainBundle] pathForResource:resourcePath ofType:nil];

            pagData = [NSData dataWithContentsOfFile:resourcePath];
            [self setCacheData:key data:pagData];

        }
        [self pagRenderWithPagData:pagData
                               url:nil
                          progress:initProgress repeatCount:repeatCount autoPlay:autoPlay result:result texts:replaceTexts textColors:replaceTextColors imgs:replaceImages];
    }
    NSString* url = arguments[@"url"];
    if ([url isKindOfClass:NSString.class] && url.length > 0) {
        if ([url hasPrefix:@"http"]) {
            NSURLSessionDownloadTask *task;
            [task resume];
            NSString *key = url;
            pagData = [self getCacheData:key];
            if (!pagData) {
                __weak typeof(self) weak_self = self;
                [TGFlutterPagDownloadManager download:url completionHandler:^(NSData * _Nonnull data, NSError * _Nonnull error) {
                    if (data) {
                        [weak_self setCacheData:key data:pagData];
                        [weak_self pagRenderWithPagData:data
                                                    url:nil
                                               progress:initProgress repeatCount:repeatCount autoPlay:autoPlay result:result texts:replaceTexts textColors:replaceTextColors imgs:replaceImages];
                    }else{
                        result(@-1);
                    }
                }];
            }else{
                [self pagRenderWithPagData:pagData
                                       url:nil
                                  progress:initProgress repeatCount:repeatCount autoPlay:autoPlay result:result texts:replaceTexts textColors:replaceTextColors imgs:replaceImages];
            }
        }else{
            [self pagRenderWithPagData:nil
                                   url:url
                              progress:initProgress repeatCount:repeatCount autoPlay:autoPlay result:result texts:replaceTexts textColors:replaceTextColors imgs:replaceImages];
        }
   
    }

    id bytesData = arguments[@"bytesData"];
    if(bytesData != nil && [bytesData isKindOfClass:FlutterStandardTypedData.class]){
        FlutterStandardTypedData *typedData = bytesData;
        if(typedData.type == FlutterStandardDataTypeUInt8 && typedData.data != nil){
            [self pagRenderWithPagData:typedData.data
                                   url:nil
                              progress:initProgress repeatCount:repeatCount autoPlay:autoPlay result:result texts:replaceTexts textColors:replaceTextColors imgs:replaceImages];
        }else{
            result(@-1);
        }
    }
}

- (void)onMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSLog(@"FlutterPagImageView:%@",call.method);
    id arguments = call.arguments;
    if ([@"getPlatformVersion" isEqualToString:call.method]) {
        result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
    } else if([@"initPag" isEqualToString:call.method]){
        [self initPag:arguments result:result];
    } else if([@"start" isEqualToString:call.method]){
        [self start:arguments result:result];
    } else if([@"stop" isEqualToString:call.method]){
        [self stop:arguments result:result];
    } else if([@"pause" isEqualToString:call.method]){
        [self pause:arguments result:result];
    } else if([@"resume" isEqualToString:call.method]){
        [self resume:arguments result:result];
    } else if([@"setProgress" isEqual:call.method]){
        [self setProgress:arguments result:result];
    } else if([@"release" isEqualToString:call.method]){
        [self release:arguments result:result];
    } else if([@"getLayersUnderPoint" isEqualToString:call.method]){
        [self getLayersUnderPoint:arguments result:result];
    } else if([@"getPath" isEqualToString:call.method]){
        [self getPath:arguments result:result];
    } else if([@"numTexts" isEqualToString:call.method]){
        [self getNumTexts:arguments result:result];
    } else if([@"numImages" isEqualToString:call.method]){
        [self getNumImages:arguments result:result];
    } else if([@"getTextData" isEqualToString:call.method]){
        [self getTextData:arguments result:result];
    } else {
        result(FlutterMethodNotImplemented);
    }
}

-(void)getPath:(id)arguments result:(FlutterResult _Nonnull)result {
    NSNumber* textureId = arguments[@"textureId"];
    result([self getPath]);
}

-(void)getNumTexts:(id)arguments result:(FlutterResult _Nonnull)result {
    result(@([self getNumTexts]));
}

-(void)getNumImages:(id)arguments result:(FlutterResult _Nonnull)result {
    result(@([self getNumImages]));

}

-(void)getTextData:(id)arguments result:(FlutterResult _Nonnull)result {
    NSNumber* index = arguments[@"index"];
    result([self getTextData:index.intValue]);
}

-(void)pagRenderWithPagData:(NSData *)pagData 
                        url:(NSString *)url
                   progress:(double)progress repeatCount:(int)repeatCount autoPlay:(BOOL)autoPlay result:(FlutterResult)result texts:(NSArray<NSString *>*)texts textColors:(NSArray<NSString *>*)textColors imgs:(NSArray<NSString *>*)imgs{
    __weak typeof(self) weakSelf = self;
    if(pagData){
        self.pagFile = [PAGFile Load:pagData.bytes size:pagData.length];
    }
    if(url && url.length > 0){
        self.pagFile = [PAGFile Load:url];
    }
    
    if (self.pagFile) {
        self.initProgress = progress;
        if (texts) {
            int loopSize = MIN(texts.count,[self getNumTexts]);
            for (int i=0; i < loopSize; i++) {
                NSString* text = texts[i];
                if(text){
                    PAGText* textData = [_pagFile getTextData:i];
                    textData.text = text;
                    if(textColors && textColors.count > i){
                        NSString* textColor = textColors[i];
                        if(textColor && textColor.length > 0){
                            UIColor* color = [self colorWithHexString:textColor];
                            textData.fillColor = color;
                        }
                    }
                    [self.pagFile replaceText:i data:textData];
                }
            }
        }
        if (imgs) {
            int loopSize = MIN(imgs.count, [self getNumImages]);
            for (int i=0; i < loopSize; i++) {
                NSString* localPath = imgs[i];
                if(localPath){
                    PAGImage* pagImage = [PAGImage FromPath:localPath];
                    if(pagImage){
                        [self.pagFile replaceImage:i data:pagImage];
                    }
                }
            }
        }
        [self.pagFile setProgress:progress];
        [self.pagImageView setComposition:self.pagFile];
        [self.pagImageView flush];
        [self.pagImageView setRepeatCount:repeatCount];
        if (autoPlay) {
            [self.pagImageView play];
        }
        result(@{@"textureId":@(_viewId), @"width":@(self.pagFile.width), @"height":@(self.pagFile.height)});
    }
    result(@{@"textureId":@(_viewId), @"width":@(0), @"height":@(0)});
    
}

-(NSData *)getCacheData:(NSString *)key{
    return [self.cache objectForKey:key];
}

-(void)setCacheData:(NSString *)key data:(NSData *)data{
    if (data == nil || key == nil) {
        return;
    }
    [self.cache setObject:data forKey:key cost:data.length];
}

-(NSCache *)cache{
    if (!_cache) {
        _cache = [[NSCache alloc] init];
        ///缓存64m
        _cache.totalCostLimit = 64*1024*1024;
        _cache.countLimit = 32;
    }
    return _cache;
}

- (int)getNumTexts {
    if(_pagFile){
        return _pagFile.numTexts;
    }
    return 0;
}

- (int)getNumImages{
    if(_pagFile){
        return _pagFile.numImages;
    }
    return 0;
}

- (NSString *)getPath{
    if(_pagFile){
        return _pagFile.path;
    }
    return @"";
}

- (NSString *)getTextData:(int)index{
    if(_pagFile){
        PAGText* textData = [_pagFile getTextData:index];
        if(textData){
            return textData.text;
        }
    }
    return @"";
}

- (CGSize)size{
    return CGSizeMake(_pagFile.width, _pagFile.height);
}

- (NSArray<NSString *> *)getLayersUnderPoint:(CGPoint)point{
    NSArray<PAGLayer*>* layers = [self.pagImageView.getComposition getLayersUnderPoint:point];
    NSMutableArray<NSString *> *layerNames = [[NSMutableArray alloc] init];
    for (PAGLayer *layer in layers) {
        [layerNames addObject:layer.layerName];
    }
    return layerNames;
}

- (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length {
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}

- (UIColor *) colorWithHexString: (NSString *) hexString {
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
    CGFloat alpha, red, blue, green;
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 1];
            green = [self colorComponentFrom: colorString start: 1 length: 1];
            blue  = [self colorComponentFrom: colorString start: 2 length: 1];
            break;
        case 4: // #ARGB
            alpha = [self colorComponentFrom: colorString start: 0 length: 1];
            red   = [self colorComponentFrom: colorString start: 1 length: 1];
            green = [self colorComponentFrom: colorString start: 2 length: 1];
            blue  = [self colorComponentFrom: colorString start: 3 length: 1];
            break;
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 2];
            green = [self colorComponentFrom: colorString start: 2 length: 2];
            blue  = [self colorComponentFrom: colorString start: 4 length: 2];
            break;
        case 8: // #AARRGGBB
            alpha = [self colorComponentFrom: colorString start: 0 length: 2];
            red   = [self colorComponentFrom: colorString start: 2 length: 2];
            green = [self colorComponentFrom: colorString start: 4 length: 2];
            blue  = [self colorComponentFrom: colorString start: 6 length: 2];
            break;
        default:
            return nil;
    }
    return [UIColor colorWithRed: red green: green blue: blue alpha: alpha];
}




- (void)onAnimationStart:(PAGImageView* _Nonnull)pagView{
    NSLog(@"FlutterPagImageView:onAnimationStart %lld",_viewId);
        [_channel invokeMethod:PlayCallback arguments:@{ArgumentTextureId:@(_viewId), ArgumentEvent:EventStart}];
    
}

- (void)onAnimationEnd:(PAGImageView* _Nonnull)pagView{
    NSLog(@"FlutterPagImageView:onAnimationEnd %lld",_viewId);
    [_channel invokeMethod:PlayCallback arguments:@{ArgumentTextureId:@(_viewId), ArgumentEvent:EventEnd}];
    
}

- (void)onAnimationCancel:(PAGImageView* _Nonnull)pagView{
    NSLog(@"FlutterPagImageView:onAnimationCancel %lld",_viewId);
    [_channel invokeMethod:PlayCallback arguments:@{ArgumentTextureId:@(_viewId), ArgumentEvent:EventCancel}];
    
}


- (void)onAnimationRepeat:(PAGImageView* _Nonnull)pagView{
//    NSLog(@"FlutterPagImageView:onAnimationRepeat %lld",_viewId);
    [_channel invokeMethod:PlayCallback arguments:@{ArgumentTextureId:@(_viewId), ArgumentEvent:EventRepeat}];
}

- (void)onAnimationUpdate:(PAGImageView* _Nonnull)pagView{
    
}


- (void)dealloc
{
    NSLog(@"FlutterPagImageView:dealloc");
}

@end

