//
//  HSFBaseTableVC.h
//  NovelDemo
//
//  Created by 黄山锋 on 2017/12/30.
//  Copyright © 2017年 黄山锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSFBaseTableVC : UIViewController

@property (nonatomic,strong) UITableView *tableView;
/* table的样式 */
@property (nonatomic,assign) BOOL isGroupTable;//默认：NO
/* 是否支持多手势 */
@property (nonatomic,assign) BOOL isMulGesture;//默认：NO

//注册cell
-(void)registerCellWithCellClassArray:(NSArray *)cellClassArr;

@end
