//
//  HSFBaseTableVC.m
//  NovelDemo
//
//  Created by 黄山锋 on 2017/12/30.
//  Copyright © 2017年 黄山锋. All rights reserved.
//

#import "HSFBaseTableVC.h"


//view
#import "HSFGestureTableView.h"

@interface HSFBaseTableVC ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation HSFBaseTableVC

#pragma mark viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    //创建tableView
    [self.view addSubview:self.tableView];
}

//下拉刷新
//self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//
//}];
//[self.tableView.mj_header endRefreshing];
//上啦加载更多
//self.tableView.mj_footer  = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
//
//}];
//[self.tableView.mj_footer endRefreshing];


#pragma mark 注册cell
-(void)registerCellWithCellClassArray:(NSArray *)cellClassArr{
    for (int i = 0; i < cellClassArr.count; i++) {
        NSString *cellClassName = cellClassArr[i];
        [self.tableView registerNib:[UINib nibWithNibName:cellClassName bundle:nil] forCellReuseIdentifier:cellClassName];
    }
}




#pragma mark 懒加载
-(UITableView *)tableView{
    if (!_tableView) {
        if (self.isMulGesture) {
            if (self.isGroupTable) {
                _tableView = [[HSFGestureTableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
            }else{
                _tableView = [[HSFGestureTableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
            }
        }else{
            if (self.isGroupTable) {
                _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
            }else{
                _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
            }
        }
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 44;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.sectionHeaderHeight = 0.1;
        _tableView.sectionFooterHeight = 0.1;
    }
    return _tableView;
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
