//
//  HSFLinkVC.m
//  IPZhua
//
//  Created by 黄山锋 on 2018/3/30.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import "HSFLinkVC.h"

//cell
#import "HSFLinkTopHeader.h"
#import "HSFLinkContentCell.h"
//vc
#import "HSFLinkContentTableVC.h"

@interface HSFLinkVC ()

@property (nonatomic,assign) BOOL canScroll;//默认刚开始是YES
@property (nonatomic,assign) CGFloat offset_y;

@end

@implementation HSFLinkVC


#pragma mark viewDidLoad
- (void)viewDidLoad {
    self.isGroupTable = YES;
    self.isMulGesture = YES;
    [super viewDidLoad];
    //配置tableView
    [self setUpTableView];
    //默认刚开始是YES
    self.canScroll = YES;
    //默认是含有导航栏的，如果没有导航栏需要提前设置
    self.isHaveNav = YES;
    //通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeVCScrollState:) name:@"changeVCScrollState" object:nil];
    
//    /* HSF添加 */
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(k_scrollEnableOf_baseTableACTION:) name:@"k_scrollEnableOf_baseTable" object:nil];
}


//配置tableView
-(void)setUpTableView{
    //header
    self.tableView.sectionFooterHeight = 0.1;
    self.tableView.estimatedSectionHeaderHeight = 44;
    self.tableView.sectionHeaderHeight = UITableViewAutomaticDimension;
    self.headerHeight = bgViewHeight;
    //注册cell
    [self registerCellWithCellClassArray:@[NSStringFromClass([HSFLinkContentCell class])]];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HSFLinkTopHeader class]) bundle:nil] forHeaderFooterViewReuseIdentifier:NSStringFromClass([HSFLinkTopHeader class])];
}

//默认设置seg---必须最后设置
-(void)setUpCustomSeg{
    self.scrollPageView = [[ZJScrollPageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.contentHeight) segmentStyle:self.style titles:self.titles parentViewController:self delegate:self];
    [self.tableView reloadData];
}

#pragma mark -UITableViewDelegate,UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HSFLinkContentCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HSFLinkContentCell class])];
    [cell.contentView addSubview:self.scrollPageView];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.contentHeight;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    HSFLinkTopHeader *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([HSFLinkTopHeader class])];
    if (self.isHaveNav) {
        header.backBtn.hidden = YES;
    }
    [header.backBtn addTarget:self action:@selector(backBtnACTION:) forControlEvents:UIControlEventTouchUpInside];
    return header;
}

//返回
-(void)backBtnACTION:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 代理方法
#pragma mark -UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.tableView) {
        self.offset_y = scrollView.contentOffset.y;
        NSLog(@"offset_y = %f",self.offset_y);
        
        /* 关键 */
        CGFloat baseY = -64;
        if (self.isHaveNav) {
            baseY = -64;
        }else{
            baseY = 0;
        }
        CGFloat headerOffset = self.headerHeight + baseY;
        if (self.offset_y >= headerOffset) {
            scrollView.contentOffset = CGPointMake(0, headerOffset);
            if (self.canScroll) {
                self.canScroll = NO;
                for (int i = 0; i < self.childVcs.count; i++) {
                    HSFLinkContentTableVC *vc = (HSFLinkContentTableVC *)self.childVcs[i];
                    vc.vcCanScroll = YES;
                }
            }
        }else{
            if (!self.canScroll) {
                scrollView.contentOffset = CGPointMake(0, headerOffset);
            }
        }
        
        if (self.offset_y < baseY) {
            if (self.isRefreshTop) {
                
            }else{
                scrollView.contentOffset = CGPointMake(0, baseY);
            }
        }
        
        self.tableView.showsVerticalScrollIndicator = _canScroll?YES:NO;
    }
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"k_scrollEnableOf_collectionView" object:nil userInfo:@{@"scrollEnable":@NO}];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"k_scrollEnableOf_collectionView" object:nil userInfo:@{@"scrollEnable":@YES}];
    
}

#pragma mark ZJScrollPageViewDelegate
- (NSInteger)numberOfChildViewControllers {
    return self.titles.count;
}
//设置图片
- (void)setUpTitleView:(ZJTitleView *)titleView forIndex:(NSInteger)index {
    
}
//返回子控制器
- (UIViewController<ZJScrollPageViewChildVcDelegate> *)childViewController:(UIViewController<ZJScrollPageViewChildVcDelegate> *)reuseViewController forIndex:(NSInteger)index {
    
    // 根据不同的下标或者title返回相应的控制器, 但是控制器必须要遵守ZJScrollPageViewChildVcDelegate
    // 并且可以通过实现协议中的方法来加载不同的数据
    // 注意ZJScrollPageView不会保证viewWillAppear等生命周期方法一定会调用
    // 所以建议使用ZJScrollPageViewChildVcDelegate中的方法来加载不同的数据
    
    // 注意这个效果和tableView的deque...方法一样, 会返回一个可重用的childVc
    // 请首先判断返回给你的是否是可重用的
    // 如果为nil就重新创建并返回
    // 如果不为nil 直接使用返回给你的reuseViewController并进行需要的设置 然后返回即可
    
    UIViewController<ZJScrollPageViewChildVcDelegate>  *childVc = (UIViewController<ZJScrollPageViewChildVcDelegate> *)reuseViewController;
    if (childVc == nil) {
        childVc = self.childVcs[index];
    }
    return childVc;
}
/**
 *  页面已经出现
 */
- (void)scrollPageController:(UIViewController *)scrollPageController childViewControllDidAppear:(UIViewController *)childViewController forIndex:(NSInteger)index{
    
}

#pragma mark -通知
-(void)changeVCScrollState:(NSNotification *)sender{
    self.canScroll = YES;
    for (int i = 0; i < self.childVcs.count; i++) {
        id vc = self.childVcs[i];
        if ([vc isKindOfClass:[HSFLinkContentTableVC class]]) {
            HSFLinkContentTableVC *vc_new = (HSFLinkContentTableVC *)vc;
            vc_new.vcCanScroll = NO;
            vc_new.isRefreshSelf = !self.isRefreshTop;
        }
    }
}
/* HSF添加 */
-(void)k_scrollEnableOf_baseTableACTION:(NSNotification *)sender{
    NSDictionary *userInfo = sender.userInfo;
    NSNumber *scrollEnable = userInfo[@"scrollEnable"];
    if ([scrollEnable isEqual:@NO]) {
        self.tableView.scrollEnabled = NO;
    }else{
        self.tableView.scrollEnabled = YES;
    }
}


-(void)dealloc{
    //移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"changeVCScrollState" object:nil];
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
