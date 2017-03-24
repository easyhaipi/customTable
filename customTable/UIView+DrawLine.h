//
//  UIView+DrawLine.h
//  customTable
//
//  Created by hulinEasy on 2017/3/24.
//  Copyright © 2017年 easy. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, WZBLineType) {
    WZBLineVertical,  // 垂直
    WZBLineHorizontal // 水平
};
@interface UIView (DrawLine)
- (void)drawLineWithFrame:(CGRect)frame lineType:(WZBLineType)lineType color:(UIColor *)color lineWidth:(CGFloat)lineWidth;
- (void)drawRectWithRect:(CGRect)rect;
@end
