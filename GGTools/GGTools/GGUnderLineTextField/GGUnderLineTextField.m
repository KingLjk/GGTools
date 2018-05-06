//
//  GGUnderLineTextField.m
//  口袋阅读
//
//  Created by GG on 2018/4/17.
//  Copyright © 2018年 GG. All rights reserved.
//

#import "GGUnderLineTextField.h"

@interface GGUnderLineTextField()

@property (nonatomic, strong)UIColor *lineColor;
@property (nonatomic, assign)CGFloat  lineWidth;

@end
@implementation GGUnderLineTextField

- (CGFloat)lineWidth{
    if (!_lineWidth) {
        _lineWidth = 1;
    }
    return _lineWidth;
}
- (UIColor *)lineColor{
    if (!_lineColor) {
        _lineColor = [UIColor blackColor];
    }
    return _lineColor;
}

 - (void)drawRect:(CGRect)rect {
     [super drawRect:rect];
     
     UIBezierPath *path = [[UIBezierPath alloc] init];
     path.lineWidth = self.lineWidth;
     CGFloat y = rect.size.height - self.lineWidth * 0.5;
     CGPoint point = CGPointMake(0, y);
     [path moveToPoint:point];
     point = CGPointMake(rect.size.width, y);
     [path addLineToPoint:point];
     [self.lineColor setStroke];
     
     [path stroke];
}



- (void)setUnderLineWithLineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor{
    self.lineColor = lineColor;
    self.lineWidth = lineWidth;
    [self setNeedsDisplay];
}
@end
