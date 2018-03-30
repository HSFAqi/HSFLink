//
//  PushDemoVC.m
//  HSFLinkDemo
//
//  Created by 黄山锋 on 2018/3/30.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import "PushDemoVC.h"

//vc
#import "HomeVC.h"
#import "HotVC.h"
#import "NewVC.h"

#define kRGBColor(r, g, b)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@interface PushDemoVC ()

@end

@implementation PushDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"阿七的店";
    self.contentHeight = [UIScreen mainScreen].bounds.size.height-64;
    self.titles = @[@"首页",@"热销", @"新品"];
    HomeVC *vc1 = [[HomeVC alloc]init];
    HotVC *vc2 = [[HotVC alloc]init];
    NewVC *vc3 = [[NewVC alloc]init];
    self.childVcs =@[vc1, vc2, vc3];
    //bar的样式
    ZJSegmentStyle *style = [[ZJSegmentStyle alloc] init];
    style.autoAdjustTitlesWidth = YES;
    style.adjustCoverOrLineWidth = YES;
    style.contentViewBounces = NO;
    style.showCover = YES;//显示遮盖
    style.coverBackgroundColor = [UIColor orangeColor];
    style.coverCornerRadius = 6;
    style.titleFont = [UIFont systemFontOfSize:15];
    style.normalTitleColor = kRGBColor(51, 204, 102);
    style.selectedTitleColor = kRGBColor(255, 255, 255);
    style.gradualChangeTitleColor = YES;//颜色渐变
    self.style = style;
    
    self.isHaveNav = YES;
    self.isRefreshTop = YES;
    //默认设置seg---必须最后设置
    [self setUpCustomSeg];
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
