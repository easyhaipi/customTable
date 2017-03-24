//
//  CustomModel.h
//  customTable
//
//  Created by hulinEasy on 2017/3/24.
//  Copyright © 2017年 easy. All rights reserved.
// 显示数据的模型

#import <Foundation/Foundation.h>

@interface CustomModel : NSObject
//列数
@property(nonatomic,assign)int columNum;
//列的名称
@property(nonatomic,copy)NSString *columName;
//这一列显示的数据数组
@property(nonatomic,strong)NSArray *columArray;
@end
