//
//  FlutterPagPlugin.m
//  FlutterPagPlugin
//
//  Created by 黎敬茂 on 2022/3/14.
//  Copyright © 2022 Tencent. All rights reserved.
//
#import "FlutterPagPlugin.h"
#import "TGFlutterPagRender.h"
#import "TGFlutterPagDownloadManager.h"
#import "FlutterPagViewFactory.h"
#import "FlutterPagImageViewFactory.h"


/**
 FlutterPagPlugin，处理flutter MethodChannel约定的方法
 */


@interface FlutterPagPlugin()

/// flutter引擎注册的textures对象
@property(nonatomic, weak) NSObject<FlutterTextureRegistry>* textures;

/// flutter引擎注册的registrar对象
@property(nonatomic, weak) NSObject<FlutterPluginRegistrar>* registrar;

/// 保存textureId跟render对象的对应关系
@property (nonatomic, strong) NSMutableDictionary *renderMap;

/// pag对象的缓存
@property (nonatomic, strong)NSCache<NSString*, NSData *> *cache;

/// 用于通信的channel
@property (nonatomic, strong)FlutterMethodChannel* channel;

@end

@implementation FlutterPagPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_pag_plugin"
            binaryMessenger:[registrar messenger]];
  FlutterPagPlugin* instance = [[FlutterPagPlugin alloc] init];
    instance.textures = registrar.textures;
    instance.registrar = registrar;
    instance.channel = channel;
  [registrar addMethodCallDelegate:instance channel:channel];
    
    FlutterPagViewFactory* vapViewFactory =
        [[FlutterPagViewFactory alloc] initWithMessenger:registrar.messenger];
    [registrar registerViewFactory:vapViewFactory withId:@"plugins.yay.chat/pag_view"];

    FlutterPagImageViewFactory* vapImageViewFactory =
        [[FlutterPagImageViewFactory alloc] initWithMessenger:registrar.messenger];
    [registrar registerViewFactory:vapImageViewFactory withId:@"plugins.yay.chat/pag_img_view"];
    
}

- (void)getLayersUnderPoint:(id)arguments result:(FlutterResult _Nonnull)result {
    NSNumber* textureId = arguments[@"textureId"];
    NSNumber* x = arguments[@"x"];
    NSNumber* y = arguments[@"y"];
    TGFlutterPagRender *render = [_renderMap objectForKey:textureId];
    NSArray<NSString *> *names = [render getLayersUnderPoint:CGPointMake(x.doubleValue, y.doubleValue)];
    result(names);
}

- (void)release:(id)arguments result:(FlutterResult _Nonnull)result {
    NSNumber* textureId = arguments[@"textureId"];
    if(textureId == nil){
        result(@"");
        return;
    }
    [self.textures unregisterTexture:textureId.intValue];
    TGFlutterPagRender *render = [_renderMap objectForKey:textureId];
    [render releaseRender];
    [_renderMap removeObjectForKey:textureId];
    result(@"");
}

- (void)setProgress:(id)arguments result:(FlutterResult _Nonnull)result {
    NSNumber* textureId = arguments[@"textureId"];
    if(textureId == nil){
        result(@"");
        return;
    }
    double progress = 0.0;
    if (arguments[@"progress"]) {
        progress = [arguments[@"progress"] doubleValue];
    }
    TGFlutterPagRender *render = [_renderMap objectForKey:textureId];
    [render setProgress:progress];
    result(@"");
}

- (void)pause:(id)arguments result:(FlutterResult _Nonnull)result {
    NSNumber* textureId = arguments[@"textureId"];
    if(textureId == nil){
        result(@"");
        return;
    }
    TGFlutterPagRender *render = [_renderMap objectForKey:textureId];
    [render pauseRender];
    result(@"");
}

- (void)stop:(id)arguments result:(FlutterResult _Nonnull)result {
    NSNumber* textureId = arguments[@"textureId"];
    if(textureId == nil){
        result(@"");
        return;
    }
    TGFlutterPagRender *render = [_renderMap objectForKey:textureId];
    [render stopRender];
    result(@"");
}

- (void)start:(id)arguments result:(FlutterResult _Nonnull)result {
    NSNumber* textureId = arguments[@"textureId"];
    if(textureId == nil){
        result(@"");
        return;
    }
    TGFlutterPagRender *render = [_renderMap objectForKey:textureId];
    [render startRender];
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
                resourcePath = [self.registrar lookupKeyForAsset:assetName fromPackage:package];
            }else{
                resourcePath = [self.registrar lookupKeyForAsset:assetName];
            }

            resourcePath = [[NSBundle mainBundle] pathForResource:resourcePath ofType:nil];

            pagData = [NSData dataWithContentsOfFile:resourcePath];
            [self setCacheData:key data:pagData];

        }
        [self pagRenderWithPagData:pagData url:nil progress:initProgress repeatCount:repeatCount autoPlay:autoPlay result:result texts:replaceTexts textColors:replaceTextColors imgs:replaceImages];
    }
    NSString* url = arguments[@"url"];
    if ([url isKindOfClass:NSString.class] && url.length > 0) {
        if ([url hasPrefix:@"http"]){
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
                                               progress:initProgress
                                            repeatCount:repeatCount autoPlay:autoPlay result:result texts:replaceTexts textColors:replaceTextColors imgs:replaceImages];
                    }else{
                        result(@-1);
                    }
                }];
            }else{
                [self pagRenderWithPagData:pagData
                                       url:nil
                                  progress:initProgress
                               repeatCount:repeatCount autoPlay:autoPlay result:result texts:replaceTexts textColors:replaceTextColors imgs:replaceImages];
            }
        }else{
            [self pagRenderWithPagData:nil
                                   url:url
                              progress:initProgress
                           repeatCount:repeatCount autoPlay:autoPlay result:result texts:replaceTexts textColors:replaceTextColors imgs:replaceImages];
            
        }
    
    }

    id bytesData = arguments[@"bytesData"];
    if(bytesData != nil && [bytesData isKindOfClass:FlutterStandardTypedData.class]){
        FlutterStandardTypedData *typedData = bytesData;
        if(typedData.type == FlutterStandardDataTypeUInt8 && typedData.data != nil){
            [self pagRenderWithPagData:typedData.data
                                   url:url
                              progress:initProgress repeatCount:repeatCount autoPlay:autoPlay result:result texts:replaceTexts textColors:replaceTextColors imgs:replaceImages];
        }else{
            result(@-1);
        }
    }
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSLog(@"FlutterPagPlugin: %@ %@",call.method,call.arguments);

    id arguments = call.arguments;
    if ([@"getPlatformVersion" isEqualToString:call.method]) {
        result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
    } else if([@"initPag" isEqualToString:call.method]){
        [self initPag:arguments result:result];
    } else if([@"start" isEqualToString:call.method]){
        [self start:arguments result:result];
    } else if([@"resume" isEqualToString:call.method]){
        [self start:arguments result:result];
    } else if([@"stop" isEqualToString:call.method]){
        [self stop:arguments result:result];
    } else if([@"pause" isEqualToString:call.method]){
        [self pause:arguments result:result];
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
    } else if([@"changeText" isEqualToString:call.method]){
        NSNumber* textureId = arguments[@"textureId"];
        if(textureId == nil){
            result(@"");
            return;
        }
        TGFlutterPagRender *render = [_renderMap objectForKey:textureId];
        if(render){
            [render changeText:arguments[@"texts"] result:result];
        }else{
            result(@"");
        }
    } else {
        result(FlutterMethodNotImplemented);
    }
}

-(void)getPath:(id)arguments result:(FlutterResult _Nonnull)result {
    NSNumber* textureId = arguments[@"textureId"];
    if(textureId == nil){
        result(@"");
        return;
    }
    TGFlutterPagRender *render = [_renderMap objectForKey:textureId];
    if(render){
        NSString* path = [render getPath];
        result(path);
    }else{
        result(@"");
    }
}

-(void)getNumTexts:(id)arguments result:(FlutterResult _Nonnull)result {
    NSNumber* textureId = arguments[@"textureId"];
    if(textureId == nil){
        result(@(0));
        return;
    }
    TGFlutterPagRender *render = [_renderMap objectForKey:textureId];
    if(render){
        int nums = [render getNumTexts];
        result(@(nums));
    }else{
        result(@(0));
    }
}

-(void)getNumImages:(id)arguments result:(FlutterResult _Nonnull)result {
    NSNumber* textureId = arguments[@"textureId"];
    if(textureId == nil){
        result(@(0));
        return;
    }
    TGFlutterPagRender *render = [_renderMap objectForKey:textureId];
    if(render){
        int nums = [render getNumImages];
        result(@(nums));
    }else{
        result(@(0));
    }
}

-(void)getTextData:(id)arguments result:(FlutterResult _Nonnull)result {
    NSNumber* textureId = arguments[@"textureId"];
    NSNumber* index = arguments[@"index"];
    if(textureId == nil){
        result(@"");
        return;
    }
    TGFlutterPagRender *render = [_renderMap objectForKey:textureId];
    if(render){
        NSString* path = [render getTextData:index.intValue];
        result(path);
    }else{
        result(@"");
    }
}

-(void)pagRenderWithPagData:(NSData *)pagData
                        url:(NSString *)url
                   progress:(double)progress repeatCount:(int)repeatCount autoPlay:(BOOL)autoPlay result:(FlutterResult)result texts:(NSArray<NSString *>*)texts textColors:(NSArray<NSString *>*)textColors imgs:(NSArray<NSString *>*)imgs{
    __block int64_t textureId = -1;
    __weak typeof(self) weakSelf = self;
    TGFlutterPagRender *render = [[TGFlutterPagRender alloc] initWithPagData:pagData url:url progress:progress texts:texts textColors:textColors imgs:imgs frameUpdateCallback:^{
         [weakSelf.textures textureFrameAvailable:textureId];
    } eventCallback:^(NSString * event) {
        [weakSelf.channel invokeMethod:PlayCallback arguments:@{ArgumentTextureId:@(textureId), ArgumentEvent:event}];
    }];
    [render setRepeatCount:repeatCount];
    textureId = [self.textures registerTexture:render];
    if(_renderMap == nil){
      _renderMap = [[NSMutableDictionary alloc] init];
    }
    [_renderMap setObject:render forKey:@(textureId)];
    result(@{@"textureId":@(textureId), @"width":@([render size].width), @"height":@([render size].height)});
    if(autoPlay){
        [render startRender];
    }
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
@end
