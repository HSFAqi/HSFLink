//
//  HSFLinkContentTableVC.m
//  IPZhua
//
//  Created by 黄山锋 on 2018/3/30.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import "HSFLinkContentTableVC.h"

@interface HSFLinkContentTableVC ()

@end

@implementation HSFLinkContentTableVC

- (void)viewDidLoad {
    self.isMulGesture = YES;
    [super viewDidLoad];
}




#pragma mark UIScrollView
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.tableView) {
        if (!self.vcCanScroll) {
            if (self.isRefreshSelf) {
                
            }else{
                scrollView.contentOffset = CGPointZero;
            }
        }
        if (scrollView.contentOffset.y <= 0) {
            self.vcCanScroll = NO;
            if (self.isRefreshSelf) {
                
            }else{
                scrollView.contentOffset = CGPointZero;
            }
            [[NSNotificationCenter defaultCenter] postNotificationName:@"changeVCScrollState" object:nil userInfo:nil];//到顶通知父视图改变状态
        }
        self.tableView.showsVerticalScrollIndicator = _vcCanScroll?YES:NO;
    }    
}


- (BOOL)shouldAutomaticallyForwardAppearanceMethods {
    return NO;
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
