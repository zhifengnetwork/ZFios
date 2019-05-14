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
#import "http_activity.h"
#import "SVProgressHUD.h"
#import "RefreshGifHeader.h"
#import "ZFHomeModel.h"
#import "ZFAuctionModel.h"
#import "ZFStartAuctionVC.h"
#import "ZFTool.h"
#import "ZFAuctionEndVC.h"


@interface ZFAuctionVC ()<ZFAuctionTableCellDelegate>

@property(nonatomic, strong) ZFAuctionListModel *listModel;

@end

@implementation ZFAuctionVC

static NSString *const ZFAuctionTableCellID = @"ZFAuctionTableCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]  initWithTitle:@"竞拍"
//                                                               style:UIBarButtonItemStylePlain target:self action:@selector(auctionButtonDidClick)];
//    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@"拼团"
//                                                              style:UIBarButtonItemStylePlain target:self action:@selector(assembleButtonDidClick)];
//    UIBarButtonItem *item3 = [[UIBarButtonItem alloc] initWithTitle:@"秒杀"
//                                                              style:UIBarButtonItemStylePlain target:self action:@selector(spikeButtonDidClick)];
//
//    //设置图片与按钮间距
//    [item2 setImageInsets:UIEdgeInsetsMake(0, 15, 0, -15)];
//    self.navigationItem.rightBarButtonItems = @[item1,item2,item3];
    
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
    ZWeakSelf
    self.tableView.mj_header = [RefreshGifHeader headerWithRefreshingBlock:^{
        
        [weakSelf loadData];
    }];
    [self.tableView.mj_header beginRefreshing];

    // 上拉刷新
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{

//        [weakSelf.demanList setNextPage];
//        [weakSelf get_supply_info];
    }];
    
}

-(void)loadData
{
    ZWeakSelf
    [http_activity auction_list:1 num:6 success:^(id responseObject)
     {
         [self.tableView.mj_header endRefreshing];
         [weakSelf showData:responseObject];
     } failure:^(NSError *error) {
         [self.tableView.mj_header endRefreshing];
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
}

-(void)showData:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    
    self.listModel = [ZFAuctionListModel mj_objectWithKeyValues:responseObject];
    
    [self.tableView reloadData];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.listModel.list.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZFAuctionTableCell* cell = [tableView dequeueReusableCellWithIdentifier:ZFAuctionTableCellID];
    //取数据
    ZFAuctionModel* model = [self.listModel.list objectAtIndex:indexPath.section];
    
    cell.auctionModel = model;
    cell.delegate = self;
    
    return cell;
}

//每行的高度是多少
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 300;
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

/**
 参与竞拍
 */
- (void)ZFAuctionTableCellDidClick:(ZFAuctionModel *)auctionModel
{
    //如果当前时间超过了结束时间，结束了
    NSString* str = [ZFTool UnixTimeString];
    //1556532674
    //1556589600
    if (str.longLongValue > auctionModel.end_time.longLongValue)
    {
        ZFAuctionEndVC* vc = [[ZFAuctionEndVC alloc]init];
        vc.ID = auctionModel.ID;
        [self.navigationController pushViewController:vc animated:YES];
    }
    else
    {
        ZFStartAuctionVC* vc = [[ZFStartAuctionVC alloc]init];
        vc.ID = auctionModel.ID;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}


@end
