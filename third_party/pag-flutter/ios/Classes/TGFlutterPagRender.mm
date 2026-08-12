//
//  TGFlutterPageRender.m
//  Tgclub
//
//  Created by 黎敬茂 on 2021/11/25.
//  Copyright © 2021 Tencent. All rights reserved.
//

#import "TGFlutterPagRender.h"
#import <OpenGLES/EAGL.h>
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>
#import <CoreVideo/CoreVideo.h>
#import <UIKit/UIKit.h>
#include <libpag/PAGPlayer.h>
#include <chrono>
#include <mutex>

@interface TGFlutterPagRender()

@property(nonatomic, strong)PAGSurface *surface;

@property(nonatomic, strong)PAGPlayer* player;

@property(nonatomic, strong)PAGFile* pagFile;

@property(nonatomic, assign)double initProgress;

@property(nonatomic, assign)BOOL endEvent;


@end

static int64_t GetCurrentTimeUS() {
  static auto START_TIME = std::chrono::high_resolution_clock::now();
  auto now = std::chrono::high_resolution_clock::now();
  auto ns = std::chrono::duration_cast<std::chrono::nanoseconds>(now - START_TIME);
  return static_cast<int64_t>(ns.count() * 1e-3);
}

@implementation TGFlutterPagRender
{
    FrameUpdateCallback _frameUpdateCallback;
    PAGEventCallback _eventCallback;
    CADisplayLink *_displayLink;
    int _lastUpdateTs;
    int _repeatCount;
    int64_t start;
    int64_t _currRepeatCount;
}

- (CVPixelBufferRef)copyPixelBuffer {
    
    int64_t duration = [_player duration];
    if(duration <= 0){
        duration = 1;
    }

    int64_t timestamp = GetCurrentTimeUS();
    if(start <= 0){
        start = timestamp;
    }
    auto count = (timestamp - start) / duration;
    double value = 0;
    if (_repeatCount >= 0 && count >= _repeatCount) {
        value = 1;
        if(!_endEvent){
            _endEvent = YES;
            _eventCallback(EventEnd);
        }
    } else {
        _endEvent = NO;
        double playTime = (timestamp - start) % duration;
        value = static_cast<double>(playTime) / duration;
        if (_currRepeatCount < count) {
            _currRepeatCount = count;
            _eventCallback(EventRepeat);
        }
    }
    [_player setProgress:value];
    [_player flush];
    CVPixelBufferRef target = [_surface getCVPixelBuffer];
    CVBufferRetain(target);
    return target;
}

- (void)changeText:(NSArray *) texts result:(FlutterResult _Nonnull)result {
    if (texts) {
        int loopSize = fmin(texts.count, [self getNumTexts]);
        for (int i=0; i < loopSize; i++) {
            NSString* text = texts[i];
            if(text){
                PAGText* textData = [_pagFile getTextData:i];
                textData.text = text;
                [_pagFile replaceText:i data:textData];
            }
        }

    }
    result(@"");
}

- (instancetype)initWithPagData:(NSData*)pagData
                            url:(NSString *)url
                       progress:(double)initProgress
                       texts:(NSArray<NSString *>*)texts
                       textColors:(NSArray<NSString *>*)textColors
                       imgs:(NSArray<NSString *>*)imgs
            frameUpdateCallback:(FrameUpdateCallback)frameUpdateCallback
                  eventCallback:(PAGEventCallback)eventCallback
{
    if (self = [super init]) {
        _frameUpdateCallback = frameUpdateCallback;
        _eventCallback = eventCallback;
        _initProgress = initProgress;
        if (pagData) {
            _pagFile = [PAGFile Load:pagData.bytes size:pagData.length];
        }
        if (url && url.length > 0) {
            _pagFile = [PAGFile Load:url];
            
        }
        if(_pagFile){
            if (texts) {
                int loopSize = fmin(texts.count, [self getNumTexts]);
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
                        [_pagFile replaceText:i data:textData];
                    }
                }

            }

            if (imgs) {
                int loopSize = fmin(imgs.count, [self getNumImages]);
                for (int i=0; i < loopSize; i++) {
                    NSString* localPath = imgs[i];
                    if(localPath){
                        PAGImage* pagImage = [PAGImage FromPath:localPath];
                        if(pagImage){
                            [_pagFile replaceImage:i data:pagImage];
                        }
                    }
                }
            }

            _player = [[PAGPlayer alloc] init];
            [_player setComposition:_pagFile];
            _surface = [PAGSurface MakeFromGPU:CGSizeMake(_pagFile.width, _pagFile.height)];
            [_player setSurface:_surface];
            [_player setProgress:initProgress];
            [_player flush];
            _frameUpdateCallback();
        }
    }
    return self;
}

- (void)startRender
{
    if (!_displayLink) {
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
        [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
    if(start <= 0){
       start = GetCurrentTimeUS();
    }
    _eventCallback(EventStart);
}

- (void)stopRender
{
    if (_displayLink) {
        [_displayLink invalidate];
        _displayLink = nil;
    }
    [_player setProgress:_initProgress];
    [_player flush];
    _frameUpdateCallback();
    if(!_endEvent){
        _endEvent = YES;
        _eventCallback(EventEnd);
    }
    _eventCallback(EventCancel);
}

- (void)pauseRender{
    if (_displayLink) {
        [_displayLink invalidate];
        _displayLink = nil;
    }
}
- (void)setRepeatCount:(int)repeatCount{
    _repeatCount = repeatCount;
}

- (void)setProgress:(double)progress{
    [_player setProgress:progress];
    [_player flush];
    _frameUpdateCallback();
}

- (NSArray<NSString *> *)getLayersUnderPoint:(CGPoint)point{
    NSArray<PAGLayer*>* layers = [_player getLayersUnderPoint:point];
    NSMutableArray<NSString *> *layerNames = [[NSMutableArray alloc] init];
    for (PAGLayer *layer in layers) {
        [layerNames addObject:layer.layerName];
    }
    return layerNames;
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

- (void)update
{
    _frameUpdateCallback();
}

- (void)releaseRender{
    if (_displayLink) {
        [_displayLink invalidate];
        _displayLink = nil;
    }
}

- (void)dealloc {
    _frameUpdateCallback = nil;
    _eventCallback = nil;
    _surface = nil;
    self.pagFile = nil;
    self.player = nil;
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

@end
