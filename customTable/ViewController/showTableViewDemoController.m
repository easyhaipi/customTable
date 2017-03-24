//
//  showTableViewDemoController.m
//  customTable
//
//  Created by hulinEasy on 2017/3/24.
//  Copyright © 2017年 easy. All rights reserved.
//

#import "showTableViewDemoController.h"
#import "CustomTableViewCell.h"
#import "CustomModel.h"
#import "CustomCellFrame.h"
@interface showTableViewDemoController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation showTableViewDemoController
-(NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *array  = @[[self modelWithColumName:@"参数1" andColumArray:@[@"1",@"2"]],
                        [self modelWithColumName:@"参数2" andColumArray:@[@"1",@"2"]],
                        [self modelWithColumName:@"参数3" andColumArray:@[@"1",@"2"]],
                        [self modelWithColumName:@"参数4" andColumArray:@[@"1",@"2"]],
                        [self modelWithColumName:@"参数5" andColumArray:@[@"1",@"2"]],
                        [self modelWithColumName:@"参数6" andColumArray:@[@"1",@"2"]],
                        [self modelWithColumName:@"参数7" andColumArray:@[@"1",@"2"]],
                        [self modelWithColumName:@"参数8" andColumArray:@[@"1",@"2"]],
                        [self modelWithColumName:@"参数9" andColumArray:@[@"1",@"2"]],
                        [self modelWithColumName:@"参数10" andColumArray:@[@"1",@"2"]],
                        [self modelWithColumName:@"参数11" andColumArray:@[@"1",@"2"]]
                       ];
    
    
   
    
    NSArray *newFrames = [self customFramesWithArray:array];
    [ self.dataArray addObjectsFromArray:newFrames];
    
    [self.tableView reloadData];
}
-(CustomModel *)modelWithColumName:(NSString *)name andColumArray:(NSArray *)array
{
    CustomModel *model = [[CustomModel alloc] init];
    model.columName = name;
    model.columArray = array;
    return model;
    
}
/**
 *  将模型转为Frame模型
 */
- (NSMutableArray *)customFramesWithArray:(NSArray *)array
{
    NSMutableArray *frames = [NSMutableArray array];
    for (CustomModel *model in array) {
        CustomCellFrame *t = [[CustomCellFrame alloc] init];
        t.model = model;
        [frames addObject:t];
    }
    return frames;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ----delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    CustomCellFrame *cellFrame = self.dataArray[indexPath.row];
    
    CustomTableViewCell *myCell = [CustomTableViewCell cellWithTableView:tableView WithTotalColum:2];
        // 给cell传递模型数据
    myCell.customFrame = cellFrame;

    return myCell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CGFloat height = 40;
    
    
    return height;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}




@end
