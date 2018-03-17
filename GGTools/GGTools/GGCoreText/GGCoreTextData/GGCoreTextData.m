//
//  GGCoreTextData.m
//  GGTools
//
//  Created by GG on 2018/3/17.
//  Copyright © 2018年 GG. All rights reserved.
//

#import "GGCoreTextData.h"

@implementation GGCoreTextData


- (void)setCtFrame:(CTFrameRef)ctFrame {
    if (_ctFrame != ctFrame) {
        if (_ctFrame != nil) {
            CFRelease(_ctFrame);
        }
        CFRetain(ctFrame);
        _ctFrame = ctFrame;
    }
}
- (void)dealloc {
    if (_ctFrame != nil) {
        CFRelease(_ctFrame);
        _ctFrame = nil;
    }
}


@end
