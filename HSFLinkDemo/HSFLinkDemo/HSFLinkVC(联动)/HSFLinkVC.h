//
//  HSFLinkVC.h
//  IPZhua
//
//  Created by 黄山锋 on 2018/3/30.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import "HSFBaseTableVC.h"

//类似新闻
#import "ZJScrollPageView.h"
#import "ZJScrollPageViewDelegate.h"

@interface HSFLinkVC : HSFBaseTableVC<ZJScrollPageViewDelegate>

//需要提前设置以下属性
@property (nonatomic,assign) CGFloat headerHeight;
@property (nonatomic,assign) CGFloat contentHeight;
@property (nonatomic,strong) NSArray *titles;
@property(strong, nonatomic) NSArray<UIViewController<ZJScrollPageViewChildVcDelegate> *> *childVcs;
@property (nonatomic,strong) ZJScrollPageView *scrollPageView;//这个可以不用设置，有默认的
@property (nonatomic,strong) ZJSegmentStyle *style;
@property (nonatomic,assign) BOOL isHaveNav;//是否含有导航栏
@property (nonatomic,assign) BOOL isRefreshTop;//刷新大的tableView（最底部）


//默认设置seg---必须最后设置
-(void)setUpCustomSeg;


@end



/* 设计思路 */
/*
    在最底部用一个支持多手势的UITableView来做容器（下面称之为baseTable），
    头部的“个人信息”部分可以是一个cell、sectionHeader、table的header，
    下面的“内容”部分是一个屏幕size大小（除去导航栏）的cell（下面称为contentCell）
    这个contentCell里面装的是普通分段控制器的一般操作（segment+content）
    做到这里，contentCell里的tableView就可以和baseTable一起滑动了
    但是，这并不是我们想要的效果（两个table同事滑动）
    所以有以下操作：
    
 
 */



