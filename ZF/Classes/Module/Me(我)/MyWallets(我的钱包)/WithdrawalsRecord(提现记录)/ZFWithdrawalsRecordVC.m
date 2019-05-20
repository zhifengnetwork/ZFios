//
//  ZFWithdrawalsRecordVC.m
//  ZF
//
//  Created by admin on 2019/5/20.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFWithdrawalsRecordVC.h"
#import "ZFRechargeHeadTableCell.h"
#import "ZFWithdrawalsRecordTableCell.h"
#import "http_mine.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "RefreshGifHeader.h"
#import "ZFWithRecordModel.h"

@interface ZFWithdrawalsRecordVC ()

@property (nonatomic , strong)ZFWithRecordListModel *withRecordListModel;

@end

@implementation ZFWithdrawalsRecordVC

static NSString *const ZFRechargeHeadTableCellID = @"ZFRechargeHeadTableCellID";
static NSString *const ZFWithdrawalsRecordTableCellID = @"ZFWithdrawalsRecordTableCellID";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    [ZFTool isHiddenNavigationBarSeparatorLine:YES vc:self];
    self.title = @"提现申请记录";
    [self setupTableView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAippear:(BOOL)animated{
    
    [super viewWillAppear:animated];
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

- (void)setupTableView
{
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.backgroundColor = RGBColorHex(0xffffff);
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.alwaysBounceVertical=NO;
    
    [self.tableView registerClass:[ZFRechargeHeadTableCell class] forCellReuseIdentifier:ZFRechargeHeadTableCellID];
    [self.tableView registerClass:[ZFWithdrawalsRecordTableCell class] forCellReuseIdentifier:ZFWithdrawalsRecordTableCellID];
    
    //自定义刷新动画
    ZWeakSelf
    self.tableView.mj_header = [RefreshGifHeader headerWithRefreshingBlock:^{
        
        [weakSelf loadData];
    }];
    [self.tableView.mj_header beginRefreshing];
    
}

-(void)loadData
{
    ZWeakSelf
    [http_mine withdrawals_list:^(id responseObject)
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
    
    self.withRecordListModel = [ZFWithRecordListModel mj_objectWithKeyValues:responseObject];
    
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1+self.withRecordListModel.list.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    if (indexPath.section==0)
    {
        ZFRechargeHeadTableCell* scell = [tableView dequeueReusableCellWithIdentifier:ZFRechargeHeadTableCellID];
        scell = [[ZFRechargeHeadTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFRechargeHeadTableCellID];
        scell.time = @"申请日期";
        scell.money = @"金额";
        scell.service = @"手续费";
        cell = scell;
    }
    else
    {
        ZFWithdrawalsRecordTableCell* pcell = [tableView dequeueReusableCellWithIdentifier:ZFWithdrawalsRecordTableCellID];
        pcell = [[ZFWithdrawalsRecordTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFWithdrawalsRecordTableCellID];
        
        ZFWithRecordModel *withRecordModel = [self.withRecordListModel.list objectAtIndex:indexPath.section-1];
        pcell.withRecordModel = withRecordModel;
        
        cell = pcell;
    }
    
    return cell;
}


//每行的高度是多少
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* view = [[UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

#pragma mark - TableViewDelegate
//点击了哪个cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    if (indexPath.section==0)
    //    {
    //        ZFPersonalDataVC* vc = [[ZFPersonalDataVC alloc]init];
    //        [self.navigationController pushViewController:vc animated:YES];
    //    }
    //    else if (indexPath.section==1)
    //    {
    //        if (indexPath.row==0)
    //        {
    //            ZFAddressManagementVC* vc = [[ZFAddressManagementVC alloc]init];
    //            [self.navigationController pushViewController:vc animated:YES];
    //        }
    //
    //    }
}


@end
