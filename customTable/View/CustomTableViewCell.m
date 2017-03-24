//
//  CustomTableViewCell.m
//  customTable
//
//  Created by hulinEasy on 2017/3/24.
//  Copyright © 2017年 easy. All rights reserved.
// 根据列表 创建cell

#import "CustomTableViewCell.h"
#import "CustomCellFrame.h"
#import "CustomModel.h"
#import "UIView+DrawLine.h"
@implementation CustomTableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView WithTotalColum:(int)colum
{
    static NSString *ID = @"CustomTableViewCell";
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID withColum:colum];
    }
    cell.colum = colum;

    return cell;
}

/**
 *  cell的初始化方法，一个cell只会调用一次
 *  一般在这里添加所有可能显示的子控件，以及子控件的一次性设置
 */
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withColum:(int)coloum
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        // 点击cell的时候不要变色
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.colum = coloum;
//        // 初始化
        [self setupOriginal];
        
    }
    return self;
}
#pragma --建立视图
-(void)setupOriginal
{
    UIView *columNameView = [[UIView alloc] init];
    columNameView.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:columNameView];
    self.columNameView = columNameView;
    
    UILabel *columNameLabel = [[UILabel alloc] init];
    columNameLabel.textColor = [UIColor blackColor];
    columNameLabel.textAlignment = NSTextAlignmentCenter;
    [columNameView addSubview:columNameLabel];
    self.columNameLabel =columNameLabel;
   
    
 
    NSMutableArray *coloumLableArray = [[NSMutableArray alloc] init];
    NSMutableArray *coloumViewArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i<self.colum; i++) {
        UIView *view = [[UIView alloc] init];
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor orangeColor];
        [view addSubview:label];
        label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:view];
        [coloumLableArray addObject:label];
        [coloumViewArray addObject:view];
    }
    
    self.coloumLableArray = coloumLableArray;
    self.coloumViewArray = coloumViewArray;
    
    
}
-(void)setCustomFrame:(CustomCellFrame *)customFrame
{
    _customFrame = customFrame;
    CustomModel *model = customFrame.model;
    self.columNameView.frame = customFrame.columNameViewF;
    self.columNameLabel.frame = customFrame.columNameLabelF;
    self.columNameLabel.text = model.columName;
    [self.columNameView drawRectWithRect:self.columNameView.frame];
    
    for (int i =0; i <self.coloumViewArray.count; i++) {
        UIView *view = self.coloumViewArray[i];
        UILabel *label = self.coloumLableArray[i];
        CGRect rect = CGRectFromString(customFrame.childViewFArray[i]);
        label.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
        view.frame = rect;
        NSString *string = model.columArray[i];
        label.text = [NSString stringWithFormat:@"--text%@",string];
        [view drawRectWithRect:label.frame];
    }
    
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
