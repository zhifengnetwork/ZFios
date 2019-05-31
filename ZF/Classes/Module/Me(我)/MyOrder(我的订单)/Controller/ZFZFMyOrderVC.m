//
//  ZFZFMyOrderVC.m
//  ZF
//
//  Created by admin on 2019/3/22.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFZFMyOrderVC.h"
#import "ZFMyOrderHeadTableCell.h"
#import "ZFOrderDetailsTableCell.h"
#import "ZFBottomOrderTableCell.h"
#import "SVProgressHUD.h"
#import "http_user.h"
#import "ZFOrderModel.h"
#import "ZFOrdersModel.h"
#import "MJExtension.h"
#import "RefreshGifHeader.h"
#import "ZFDetailOrderVC.h"

@interface ZFZFMyOrderVC ()<ZFBottomOrderTableCellDelegate>
@property (nonatomic, strong)NSMutableArray *datas;

@end

@implementation ZFZFMyOrderVC

static NSString *const ZFMyOrderHeadTableCellID = @"ZFMyOrderHeadTableCellID";
static NSString *const ZFOrderDetailsTableCellID = @"ZFOrderDetailsTableCellID";
static NSString *const ZFBottomOrderTableCellID = @"ZFBottomOrderTableCellID";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    [ZFTool isHiddenNavigationBarSeparatorLine:YES vc:self];
    self.title = @"我的订单";
    [self setupTableView];
    
    UIImage *imgRight = [UIImage imageNamed:@"All"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[imgRight imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(moreButtonDidClick)];
    self.tableView.mj_header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    [self.tableView.mj_header beginRefreshing];
    
}


- (void)loadData{
    ZWeakSelf
    [http_user order_list:_type success:^(id responseObject)
     {
         [weakSelf showData:responseObject];
         
     } failure:^(NSError *error)
     {
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
    
}
-(void)showData:(id)responseObject
{
    [self.tableView.mj_header endRefreshing];
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    self.datas = [ZFOrderModel mj_objectArrayWithKeyValuesArray:responseObject];
    [self.tableView reloadData];
    
}

- (void)moreButtonDidClick
{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAippear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    // 注册加载完成高度的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(noti:) name:@"del_collect_goods2" object:nil];
    
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"del_collect_goods2" object:nil];
}

- (void)noti:(NSNotification *)sender
{
    [self loadData];
}

- (void)setupTableView
{
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.backgroundColor = RGBTableViewBGColor;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.alwaysBounceVertical=NO;

    
    [self.tableView registerClass:[ZFMyOrderHeadTableCell class] forCellReuseIdentifier:ZFMyOrderHeadTableCellID];
    [self.tableView registerClass:[ZFOrderDetailsTableCell class] forCellReuseIdentifier:ZFOrderDetailsTableCellID];
    [self.tableView registerClass:[ZFBottomOrderTableCell class] forCellReuseIdentifier:ZFBottomOrderTableCellID];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.datas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    ZFOrderModel *orderModel = [self.datas objectAtIndex:indexPath.section];
        if (indexPath.row==0)
        {
            ZFMyOrderHeadTableCell* scell = [tableView dequeueReusableCellWithIdentifier:ZFMyOrderHeadTableCellID];
            scell = [[ZFMyOrderHeadTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFMyOrderHeadTableCellID];
            scell.orderModel = orderModel;

            cell = scell;
        }
        else if (indexPath.row==1)
        {
            ZFOrderDetailsTableCell* pcell = [tableView dequeueReusableCellWithIdentifier:ZFOrderDetailsTableCellID];
            pcell = [[ZFOrderDetailsTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFOrderDetailsTableCellID];
            ZFOrdersModel *goodModel = [orderModel.goods objectAtIndex:0];
            pcell.orderModel = goodModel;
            cell = pcell;
        }
        else if (indexPath.row==2)
        {
            ZFBottomOrderTableCell* scell = [tableView dequeueReusableCellWithIdentifier:ZFBottomOrderTableCellID];
            scell = [[ZFBottomOrderTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFBottomOrderTableCellID];
            scell.orderModel = orderModel;
            scell.type = _type;
            scell.delegate = self;
            cell = scell;
        }
    
    
    return cell;
}

- (void)updateCell{
    [self.tableView.mj_header beginRefreshing];
}


//每行的高度是多少
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row==0)
    {
        return 25;
    }
    else if (indexPath.row==1)
    {
        return 105;
    }
    
    
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
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
    if (indexPath.row==1) {
        ZFDetailOrderVC *vc = [[ZFDetailOrderVC alloc]init];
        ZFOrderModel *orderModel = [self.datas objectAtIndex:indexPath.section];
        vc.order_id = orderModel.order_id;
        [self.navigationController pushViewController:vc animated:YES];
    }
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
