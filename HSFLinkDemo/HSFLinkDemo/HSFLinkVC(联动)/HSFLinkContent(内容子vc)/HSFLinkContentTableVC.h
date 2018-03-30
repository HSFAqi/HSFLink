//
//  HSFLinkContentTableVC.h
//  IPZhua
//
//  Created by 黄山锋 on 2018/3/30.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import "HSFBaseTableVC.h"

//类似新闻
#import "ZJScrollPageView.h"
#import "ZJScrollPageViewDelegate.h"

@interface HSFLinkContentTableVC : HSFBaseTableVC<ZJScrollPageViewChildVcDelegate>

@property (nonatomic, assign) BOOL vcCanScroll;
@property (nonatomic,assign) BOOL isRefreshSelf;

@end
