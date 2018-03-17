//
//  GGCoreTextPagingTool.m
//  GGTools
//
//  Created by GG on 2018/3/17.
//  Copyright © 2018年 GG. All rights reserved.
//

#import "GGCoreTextPagingTool.h"

#import <CoreText/CoreText.h>

@implementation GGCoreTextPagingTool


+ (NSArray <NSAttributedString *>*)coreTextPaging:(NSAttributedString *)attributedString maxPageSize:(CGSize)maxPageSize{
    NSMutableArray *pagingResult = [NSMutableArray array];
    CFAttributedStringRef cfAttStr = (__bridge CFAttributedStringRef)attributedString;
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString(cfAttStr);
    
    CGPathRef path = CGPathCreateWithRect(CGRectMake(0, 0, maxPageSize.width, maxPageSize.height), NULL);
    
    int textPos = 0;
    NSUInteger strLength = [attributedString length];
    while (textPos < strLength)  {
        //设置路径
        CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(textPos, 0), path, NULL);
        //生成frame
        CFRange frameRange = CTFrameGetVisibleStringRange(frame);
        NSRange range = NSMakeRange(frameRange.location, frameRange.length);
        
        //获取范围并转换为NSRange，然后以NSAttributedString形式保存
        [pagingResult addObject:[attributedString attributedSubstringFromRange:range]];
        
        //移动当前文本位置
        textPos += frameRange.length;
        
        CFRelease(frame);
    }
    CGPathRelease(path);
    CFRelease(framesetter);
    return pagingResult;
}


@end
