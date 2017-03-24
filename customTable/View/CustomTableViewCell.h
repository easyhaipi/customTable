//
//  CustomTableViewCell.h
//  customTable
//
//  Created by hulinEasy on 2017/3/24.
//  Copyright © 2017年 easy. All rights reserved.
//

#import <UIKit/UIKit.h>


@class CustomCellFrame;
@interface CustomTableViewCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView WithTotalColum:(int)colum;

@property(nonatomic,assign)int colum;

@property(nonatomic,strong)CustomCellFrame *customFrame;
//列表头的视图
@property(nonatomic,strong)UIView *columNameView;
//列表头的视图
@property(nonatomic,strong)UILabel *columNameLabel;

@property(nonatomic,strong)NSMutableArray *coloumViewArray;
@property(nonatomic,strong)NSMutableArray *coloumLableArray;
@end
