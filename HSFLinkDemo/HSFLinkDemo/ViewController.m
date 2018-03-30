//
//  ViewController.m
//  HSFLinkDemo
//
//  Created by 黄山锋 on 2018/3/30.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import "ViewController.h"

//demo
#import "PushDemoVC.h"
#import "PresentDemoVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"嵌套联动DEMO";
    
}



/* PUSH */
- (IBAction)pushDemoACTION:(UIButton *)sender {
    PushDemoVC *vc = [[PushDemoVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}



/* PRESENT */
- (IBAction)presentDemoACTION:(UIButton *)sender {
    PresentDemoVC *vc = [[PresentDemoVC alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
