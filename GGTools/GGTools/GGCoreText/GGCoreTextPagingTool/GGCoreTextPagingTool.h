//
//  GGCoreTextPagingTool.h
//  GGTools
//
//  Created by GG on 2018/3/17.
//  Copyright © 2018年 GG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGCoreTextPagingTool : NSObject

+ (NSArray <NSAttributedString *>*)coreTextPaging:(NSAttributedString *)attributedString maxPageSize:(CGSize)maxPageSize;

@end
