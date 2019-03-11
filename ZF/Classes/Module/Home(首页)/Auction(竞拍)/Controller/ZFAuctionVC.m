//
//  ZFAuctionVC.m
//  ZF
//
//  Created by apple on 2019/3/4.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFAuctionVC.h"
#import "ZFAuctionTableCell.h"
#import "MJExtension.h"

@interface ZFAuctionVC ()

@end

@implementation ZFAuctionVC

static NSString *const ZFAuctionTableCellID = @"ZFAuctionTableCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]  initWithTitle:@"竞拍"
                                                               style:UIBarButtonItemStylePlain target:self action:@selector(auctionButtonDidClick)];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@"拼团"
                                                              style:UIBarButtonItemStylePlain target:self action:@selector(assembleButtonDidClick)];
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc] initWithTitle:@"秒杀"
                                                              style:UIBarButtonItemStylePlain target:self action:@selector(spikeButtonDidClick)];
    
    //设置图片与按钮间距
    [item2 setImageInsets:UIEdgeInsetsMake(0, 15, 0, -15)];
    self.navigationItem.rightBarButtonItems = @[item1,item2,item3];
    
    [self setupTableView];
    
}

- (void)auctionButtonDidClick
{
    
}

- (void)assembleButtonDidClick
{
    
}

- (void)spikeButtonDidClick
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setupTableView
{
    self.tableView.backgroundColor = RGBColorHex(0xffffff);
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.estimatedSectionHeaderHeight = 10.0f;
    self.tableView.estimatedRowHeight = 44.0f;
    
    [self.tableView registerClass:[ZFAuctionTableCell class] forCellReuseIdentifier:ZFAuctionTableCellID];
    
    //自定义刷新动画
//    ZWeakSelf
//    self.tableView.mj_header = [LKRefreshGifHeader headerWithRefreshingBlock:^{
//
//        [weakSelf get_supply_info];
//    }];
//    [self.tableView.mj_header beginRefreshing];
//
//    // 上拉刷新
//    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
//
//        [weakSelf.demanList setNextPage];
//        [weakSelf get_supply_info];
//    }];
    
}


#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return self.demanList.resultList.count;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
//    LKSupplyDemandModel* model = [self.demanList.resultList objectAtIndex:indexPath.section];
    ZFAuctionTableCell* dcell = [tableView dequeueReusableCellWithIdentifier:ZFAuctionTableCellID];
    
    cell = dcell;
    
    return cell;
}

//每行的高度是多少
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15.0f;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* view = [[UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

@end
