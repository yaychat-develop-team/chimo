//
//  FlutterPagViewFactory.m
//  pag
//
//  Created by 梁杰 on 2024/11/5.
//

#import "FlutterPagViewFactory.h"

#import <Foundation/Foundation.h>
#import <FlutterPagView.h>

@implementation FlutterPagViewFactory {
    NSObject<FlutterBinaryMessenger>* _messenger;
}

- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger>*)messenger {
    self = [super init];
    if (self) {
        _messenger = messenger;
    }
    return self;
}

- (NSObject<FlutterMessageCodec>*)createArgsCodec {
    return [FlutterStandardMessageCodec sharedInstance];
}

- (NSObject<FlutterPlatformView>*)createWithFrame:(CGRect)frame
                                   viewIdentifier:(int64_t)viewId
                                        arguments:(id _Nullable)args {
    FlutterPagView *vapView = [[FlutterPagView alloc] initWithFrame:frame viewIdentifier:viewId arguments:args binaryMessenger:_messenger];
    
    return vapView;
}
@end
