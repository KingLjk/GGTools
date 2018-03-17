//
//  GGCoreTextData.h
//  GGTools
//
//  Created by GG on 2018/3/17.
//  Copyright © 2018年 GG. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreText/CoreText.h>


typedef enum : NSUInteger {
    GGTextAlignmentCenter,
    GGTextAlignmentTop,
    GGTextAlignmentBottom,
} GGTextAlignment;


@interface GGCoreTextData : NSObject


@property (assign, nonatomic)CTFrameRef ctFrame;

/**
 注意此为文本实际绘制高度，不包含页边距
 */
@property (nonatomic, assign)CGFloat  height;

@property (nonatomic, assign)UIEdgeInsets  edgeInsets;

/**
 在绘制区域（页边距之内）的绘制布局
 eg. GGTextAlignmentTop：    内容紧贴上内边距
 */
@property (nonatomic, assign)GGTextAlignment  textAlignment;

@end
