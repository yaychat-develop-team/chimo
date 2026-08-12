//
//  TGFlutterPageRender.h
//  Tgclub
//
//  Created by 黎敬茂 on 2021/11/25.
//  Copyright © 2021 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

#define EventStart @"onAnimationStart"
#define EventEnd @"onAnimationEnd"
#define EventCancel @"onAnimationCancel"
#define EventRepeat @"onAnimationRepeat"

typedef void(^FrameUpdateCallback)(void);

typedef void(^PAGEventCallback)(NSString *);

/**
 Pag纹理渲染类
 */
@interface TGFlutterPagRender : NSObject<FlutterTexture>

///当前pag的size
@property(nonatomic, readonly) CGSize size;

- (instancetype)initWithPagData:(NSData*)pagData
                        url:(NSString *)url
                       progress:(double)initProgress
                       texts:(NSArray<NSString *>*)texts
                       textColors:(NSArray<NSString *>*)textColors
                       imgs:(NSArray<NSString *>*)imgs
            frameUpdateCallback:(FrameUpdateCallback)frameUpdateCallback
                  eventCallback:(PAGEventCallback)eventCallback;

- (void)startRender;

- (void)stopRender;

- (void)pauseRender;

- (void)releaseRender;

- (void)setProgress:(double)progress;

- (void)setRepeatCount:(int)repeatCount;

- (NSArray<NSString *> *)getLayersUnderPoint:(CGPoint)point;

- (int)getNumTexts;

- (int)getNumImages;

- (NSString *)getPath;

- (NSString *)getTextData:(int)index;

- (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length;

- (UIColor *) colorWithHexString: (NSString *) hexString;

- (void)changeText:(NSArray *) texts result:(FlutterResult _Nonnull)result;

@end

NS_ASSUME_NONNULL_END
