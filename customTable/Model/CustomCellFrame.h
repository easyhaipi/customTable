//
//  CustomCellFrame.h
//  customTable
//
//  Created by hulinEasy on 2017/3/24.
//  Copyright © 2017年 easy. All rights reserved.
// 显示cell的frame

#import <Foundation/Foundation.h>



@class CustomModel;
@interface CustomCellFrame : NSObject
@property(nonatomic,strong)CustomModel *model;
/** 整体 */
@property (nonatomic, assign) CGRect originalViewF;
/** 列的头所在的view */
@property (nonatomic, assign) CGRect columNameViewF;
/** 列的头所在的Label */
@property (nonatomic, assign) CGRect columNameLabelF;
/** 列的头所有的view的Frame */
@property(nonatomic,strong)NSMutableArray *childViewFArray;


/** cell的高度 */
@property (nonatomic, assign) CGFloat cellHeight;

@end
