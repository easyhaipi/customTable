//
//  ViewController.m
//  customTable
//
//  Created by hulinEasy on 2017/3/24.
//  Copyright © 2017年 easy. All rights reserved.
//  自定义画表格

#import "ViewController.h"
#import "showTableViewDemoController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)threeAction:(UIButton *)sender {
    UIStoryboard *st = [UIStoryboard storyboardWithName:@"showTableViewDemoController" bundle:nil];
    showTableViewDemoController *vc = [st instantiateInitialViewController];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}


@end
