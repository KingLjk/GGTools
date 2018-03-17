//
//  GGCoreTextView.m
//  GGTools
//
//  Created by GG on 2018/3/17.
//  Copyright © 2018年 GG. All rights reserved.
//


#import "GGCoreTextView.h"


#import "GGCoreTextData.h"

@implementation GGCoreTextView


- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    if (self.coreTextData) {
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetTextMatrix(context, CGAffineTransformIdentity);
        
        
//        BOOL drawAreaCloseToTheTop = YES;
//        if (drawAreaCloseToTheTop) {
//            CGContextTranslateCTM(context, 0, self.coreTextData.height);
//        }else{
//            CGContextTranslateCTM(context, 0, self.bounds.size.height);
//        }
        CGFloat temp;
        switch (self.coreTextData.textAlignment) {
            case GGTextAlignmentCenter:
                 temp = (rect.size.height - (self.coreTextData.edgeInsets.top + self.coreTextData.edgeInsets.bottom) + self.coreTextData.height) * 0.5;
                CGContextTranslateCTM(context, 0, temp);
                break;
            case GGTextAlignmentTop:
                CGContextTranslateCTM(context, 0, self.coreTextData.height);
                break;
            case GGTextAlignmentBottom:
                CGContextTranslateCTM(context, 0, self.bounds.size.height);
                break;
                
            default:
                break;
        }
        
        
        CGContextScaleCTM(context, 1.0, -1.0);
        CTFrameDraw(self.coreTextData.ctFrame, context);
    }

}

- (void)setCoreTextData:(GGCoreTextData *)coreTextData{
    _coreTextData = coreTextData;
    
    if (_coreTextData) {
        [self setNeedsDisplay];
    }
}




@end







