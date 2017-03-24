//
//  UIView+DrawLine.m
//  customTable
//
//  Created by hulinEasy on 2017/3/24.
//  Copyright © 2017年 easy. All rights reserved.
//

#import "UIView+DrawLine.h"
#define SINGLE_LINE_WIDTH           (1 / [UIScreen mainScreen].scale)
#define SINGLE_LINE_ADJUST_OFFSET   ((1 / [UIScreen mainScreen].scale) / 2)

@implementation UIView (DrawLine)

- (void)drawLineWithFrame:(CGRect)frame lineType:(WZBLineType)lineType color:(UIColor *)color lineWidth:(CGFloat)lineWidth {
    
    // 创建贝塞尔曲线
    UIBezierPath *linePath = [[UIBezierPath alloc] init];
    
    // 线宽
    linePath.lineWidth = lineWidth;
    
    // 起点
    [linePath moveToPoint:CGPointMake(0, 0)];
    
    // 重点：判断是水平方向还是垂直方向
    [linePath addLineToPoint: lineType == WZBLineHorizontal ? CGPointMake(frame.size.width, 0) : CGPointMake(0, frame.size.height)];
    
    // 创建CAShapeLayer
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    
    // 颜色
    lineLayer.strokeColor = color.CGColor;
    // 宽度
    lineLayer.lineWidth = lineWidth;
    
    // frame
    lineLayer.frame = frame;
    
    // 路径
    lineLayer.path = linePath.CGPath;
    
    // 添加到layer上
    [self.layer addSublayer:lineLayer];
}
- (void)drawLineWithFrame:(CGRect)frame type:(NSInteger)type color:(UIColor *)color {
    [self drawLineWithFrame:frame lineType:type color:color lineWidth:0.7];
}
- (void)drawLineWithFrame:(CGRect)frame type:(NSInteger)type {
    [self drawLineWithFrame:frame type:type color:[UIColor blackColor]];
}



- (void)drawRectWithRect:(CGRect)rect {
    CGFloat x = rect.origin.x;
    CGFloat y = rect.origin.y;
    CGFloat w = (1.0) * rect.size.width;
    CGFloat h = (1.0) * rect.size.height;
    
    if (((int)(y * [UIScreen mainScreen].scale) + 1) % 2 == 0) {
        y += SINGLE_LINE_ADJUST_OFFSET;
    }
    if (((int)(x * [UIScreen mainScreen].scale) + 1) % 2 == 0) {
        x += SINGLE_LINE_ADJUST_OFFSET;
    }
    
    [self drawLineWithFrame:(CGRect){x, y, w, 1} type:1];
    [self drawLineWithFrame:(CGRect){x + w, y, 1, h} type:2];
    [self drawLineWithFrame:(CGRect){x, y + h, w, 1} type:1];
    [self drawLineWithFrame:(CGRect){x, y, 1, h} type:2];
}

@end
