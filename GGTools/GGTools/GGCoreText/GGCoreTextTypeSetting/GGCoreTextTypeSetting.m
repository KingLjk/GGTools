//
//  GGCoreTextTypeSetting.m
//  GGTools
//
//  Created by GG on 2018/3/17.
//  Copyright © 2018年 GG. All rights reserved.
//

#import "GGCoreTextTypeSetting.h"

@implementation GGCoreTextTypeSetting

+ (GGCoreTextData *)parseAttributedString:(NSAttributedString *)content viewSize:(CGSize)viewSize{
    return [self parseAttributedString:content viewSize:viewSize viewEdgeInsets:UIEdgeInsetsZero];
}

+ (GGCoreTextData *)parseAttributedString:(NSAttributedString *)content viewSize:(CGSize)viewSize viewEdgeInsets:(UIEdgeInsets)edgeInsets{
    
    
    // 创建 CTFramesetterRef 实例
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)content);
    
    
    CGFloat drawSizeWidthWithoutEdge = viewSize.width - (edgeInsets.left + edgeInsets.right);
    CGSize restrictSize = CGSizeMake(drawSizeWidthWithoutEdge, CGFLOAT_MAX);
    
    CGSize coreTextSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0,0), nil, restrictSize, nil);
    // 获得绘制内容所需要区域的高度
    CGFloat textHeight = coreTextSize.height;
    
    // 生成 CTFrameRef 实例
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathAddRect(path, NULL, CGRectMake(edgeInsets.left, -edgeInsets.top, drawSizeWidthWithoutEdge, textHeight ));
    
    CTFrameRef ctFrame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, NULL);
    CFRelease(path);
    
    // 将生成好的 CTFrameRef 实例和计算好的缓制高度保存到 CoreTextData 实例中，最后返回 CoreTextData 实例
    GGCoreTextData *coreTextData = [GGCoreTextData new];
    coreTextData.ctFrame = ctFrame;
    coreTextData.height = textHeight;
    coreTextData.edgeInsets = edgeInsets;
    
    return coreTextData;
}


@end
