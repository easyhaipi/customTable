//
//  CustomeCellFrame.m
//  customTable
//
//  Created by hulinEasy on 2017/3/24.
//  Copyright © 2017年 easy. All rights reserved.
//

#import "CustomCellFrame.h"
#import "CustomModel.h"

@implementation CustomCellFrame

-(void)setModel:(CustomModel *)model
{
    _model = model;
    
    model.columNum = (int)model.columArray.count;

    // cell的宽度
    CGFloat cellW = [UIScreen mainScreen].bounds.size.width;
    
    /** 列头的frame */
    CGFloat ColoumNameW = cellW/(model.columNum+1);
    CGFloat ColoumNameX = 0;
    CGFloat ColoumNameY = 0;
    CGFloat ColoumNameH = 40;
    self.columNameViewF = CGRectMake(ColoumNameX, ColoumNameY, ColoumNameW, ColoumNameH);
    
    
    self.columNameLabelF = self.columNameViewF;

    NSMutableArray *childViewFArray = [[NSMutableArray alloc] init];
    for (int i = 0; i<model.columNum; i++) {
        CGFloat ColoumNameW = cellW/(model.columNum+1);
        CGFloat ColoumNameX = (i+1)*ColoumNameW;
        CGFloat ColoumNameY = 0;
        CGFloat ColoumNameH = 40;
        CGRect rect = CGRectMake(ColoumNameX, ColoumNameY, ColoumNameW, ColoumNameH);
        [childViewFArray addObject:NSStringFromCGRect(rect)];
    }
    
    self.childViewFArray = childViewFArray;
}

@end
