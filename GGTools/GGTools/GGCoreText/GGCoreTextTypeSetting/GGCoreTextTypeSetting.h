//
//  GGCoreTextTypeSetting.h
//  GGTools
//
//  Created by GG on 2018/3/17.
//  Copyright © 2018年 GG. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GGCoreTextData.h"

@interface GGCoreTextTypeSetting : NSObject



/**
 创建GGCoreTextData实例

 @param content 绘制的文本信息
 @param viewSize 绘制视图的尺寸
 @param edgeInsets 绘制视图的页边距
 @return GGCoreTextData实例
 */
+ (GGCoreTextData *)parseAttributedString:(NSAttributedString *)content viewSize:(CGSize)viewSize viewEdgeInsets:(UIEdgeInsets)edgeInsets;


/**
 创建GGCoreTextData实例，不计算页边距

 @param content 绘制的文本信息
 @param viewSize 绘制视图的尺寸
 @return GGCoreTextData实例
 */
+ (GGCoreTextData *)parseAttributedString:(NSAttributedString *)content viewSize:(CGSize)viewSize;
@end
