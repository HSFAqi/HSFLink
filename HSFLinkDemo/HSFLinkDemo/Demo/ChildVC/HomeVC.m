//
//  HomeVC.m
//  HSFLinkDemo
//
//  Created by 黄山锋 on 2018/3/30.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import "HomeVC.h"

//cell
#import "HomeCell.h"

@interface HomeVC ()

@end

@implementation HomeVC

#pragma mark -viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    //配置tableView
    [self setUpTableView];
}
//配置tableView
-(void)setUpTableView{
    //注册cell
    [self registerCellWithCellClassArray:@[NSStringFromClass([HomeCell class])]];
}

#pragma mark -UITableViewDelegate,UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HomeCell class])];
    cell.contentView.backgroundColor = [UIColor whiteColor];
    
    return cell;
}
#pragma mark -点击事件
//点击cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
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
