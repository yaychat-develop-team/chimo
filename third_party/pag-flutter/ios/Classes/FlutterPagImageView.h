//
//  FlutterPagImageView.h
//  pag
//
//  Created by 梁杰 on 2024/11/5.
//

#import <Flutter/Flutter.h>
#include <libpag/PAGImageView.h>

NS_ASSUME_NONNULL_BEGIN

@interface FlutterPagImageView : NSObject <FlutterPlatformView,PAGImageViewListener>

- (instancetype)initWithFrame:(CGRect)frame
               viewIdentifier:(int64_t)viewId
                    arguments:(id _Nullable)args
              binaryMessenger:(NSObject<FlutterBinaryMessenger>*)messenger;

@end

NS_ASSUME_NONNULL_END
