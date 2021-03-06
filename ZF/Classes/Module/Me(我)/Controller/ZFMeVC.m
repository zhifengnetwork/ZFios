//
//  ZFMeVC.m
//  ZF
//
//  Created by apple on 27/02/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFMeVC.h"
#import "RefreshGifHeader.h"
#import "ZFMyHeadView.h"
#import "ZFMyOrderTableCell.h"
#import "ZFPersonalVC.h"
#import "ZFFootprintVC.h"
#import "ZFCommodityInforVC.h"
#import "ZFCommodityWMVC.h"
#import "ZFSignInView.h"
#import "TYShowAlertView.h"
#import "ZFCumulativeVC.h"
#import "ZFOfflinePickupVC.h"
#import "ZFWithdrawDepositVC.h"
#import "ZFFundAccountControllerCell.h"
#import "ZFMyIntegralVC.h"
#import "ZFMyTeamVC.h"
#import "ZFPublicWelfareVC.h"
#import "ZFMyWalletTableCell.h"
#import "ZFMyColumnTableCell.h"
#import "ZFMyOrderEmptyVC.h"
#import "ZFDistributionVC.h"
#import "ZFWalletVC.h"
#import "ZFCouponCenterVC.h"
#import "ZFStationNewsVC.h"
//#import "ZFMyShareVC.h"
#import "ZFZFMyOrderVC.h"
#import "http_user.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "UserInfoModel.h"
#import "http_mine.h"
#import "ZFAuctionWMVC.h"
#import "ZFCheckTimesVC.h"
#import "ZFDetailBalanceWMVC.h"

@interface ZFMeVC()<UITableViewDataSource,UITableViewDelegate,ZFMyHeadViewDelegate,ZFMyOrderTableCellDelegate,ZFMyWalletTableCellDelegate,ZFMyColumnTableCellDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ZFMyHeadView *headView;

@property (nonatomic, strong) UserInfoModel *userInfo;
@property (nonatomic, strong) UserInfoModel *userInfo2;

@end


@implementation ZFMeVC

static NSString *const ZFMyOrderTableCellID = @"ZFMyOrderTableCellID";
static NSString *const ZFMyWalletTableCellID = @"ZFMyWalletTableCellID";
static NSString *const ZFFundAccountControllerCellID = @"ZFFundAccountControllerCellID";
static NSString *const ZFMyColumnTableCellID = @"ZFMyColumnTableCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
    //用户信息
    [self loadData];
    [self loadData2];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)setupUI
{
    self.tableView.backgroundColor = TableViewBGColor;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //自动计算高度
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 50;
    
    [self.tableView registerClass:[ZFMyOrderTableCell class] forCellReuseIdentifier:ZFMyOrderTableCellID];
    [self.tableView registerClass:[ZFMyWalletTableCell class] forCellReuseIdentifier:ZFMyWalletTableCellID];
    [self.tableView registerClass:[ZFFundAccountControllerCell class] forCellReuseIdentifier:ZFFundAccountControllerCellID];
    [self.tableView registerClass:[ZFMyColumnTableCell class] forCellReuseIdentifier:ZFMyColumnTableCellID];
    
    self.headView = [[ZFMyHeadView alloc] initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, 138)];
    _headView.delegate = self;
    self.tableView.tableHeaderView = self.headView;
}

//加载数据
-(void)loadData
{
    ZWeakSelf
    [http_mine myIndex:^(id responseObject)
     {
         [weakSelf loadData_ok:responseObject];
         
     } failure:^(NSError *error) {
         
         [SVProgressHUD showInfoWithStatus:error.domain];
     }];
}

//加载数据完成
-(void)loadData_ok:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    
    //jsonToModel
    self.userInfo = [UserInfoModel mj_objectWithKeyValues:responseObject];
    //刷新数据
    self.headView.userInfo = self.userInfo;
    
    [self.tableView reloadData];
    
}

-(void)loadData2
{
    ZWeakSelf
    [http_user userinfo:^(id responseObject)
     {
         [weakSelf loadData2_ok:responseObject];
         
     } failure:^(NSError *error) {
         
         [SVProgressHUD showInfoWithStatus:error.domain];
     }];
}

//加载数据完成
-(void)loadData2_ok:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    
    //jsonToModel
    self.userInfo2 = [UserInfoModel mj_objectWithKeyValues:responseObject];
    
    [self.tableView reloadData];
    
}


#pragma mark - Table view data source
//有多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

//每个组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

//每行使用的Cell是什么
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        ZFMyWalletTableCell* cell = [tableView dequeueReusableCellWithIdentifier:ZFMyWalletTableCellID];
        if (cell == nil)
        {
            cell = [[ZFMyWalletTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFMyWalletTableCellID];
        }
        cell.delegate = self;
        cell.userInfo = self.userInfo;
        return cell;
    }
    else if (indexPath.section==1)
    {
        ZFMyOrderTableCell* cell = [tableView dequeueReusableCellWithIdentifier:ZFMyOrderTableCellID];
        if (cell == nil)
        {
            cell = [[ZFMyOrderTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFMyOrderTableCellID];
        }
        cell.delegate = self;
        return cell;
    }
//    else if (indexPath.section==2)
//    {
//        ZFFundAccountControllerCell* cell = [tableView dequeueReusableCellWithIdentifier:ZFFundAccountControllerCellID];
//        if (cell == nil)
//        {
//            cell = [[ZFFundAccountControllerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFFundAccountControllerCellID];
//        }
//        cell.userInfo = self.userInfo2;
//        return cell;
//    }
    else if (indexPath.section==2)
    {
        ZFMyColumnTableCell* cell = [tableView dequeueReusableCellWithIdentifier:ZFMyColumnTableCellID];
        if (cell == nil)
        {
            cell = [[ZFMyColumnTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFMyColumnTableCellID];
        }
        cell.delegate = self;
        return cell;
    }
    
    return nil;
}

//每行的高度是多少
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        return 100.0f;
    }
    else if (indexPath.section==1)
    {
        return 88;
    }

    return 250.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *cview = [[UIView alloc]init];
    cview.backgroundColor = [UIColor clearColor];
    return cview;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==2)
    {
        ZFPublicWelfareVC* vc = [[ZFPublicWelfareVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}


//我的头部headview被点击 1:头像 2:商品关注 3:店关注 4:足迹
- (void)ZFMyHeadViewDidClick:(int)type
{
    if (type==1)
    {
        
    }
    else if (type==2)
    {
        //跳转到商品关注
        ZFCommodityInforVC* vc = [[ZFCommodityInforVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (type==3)
    {
        //跳转到店铺关注
        ZFCommodityWMVC *cwmVC = [[ZFCommodityWMVC alloc] init];
        cwmVC.menuViewStyle = WMMenuViewStyleLine;
        cwmVC.automaticallyCalculatesItemWidths = YES;
        cwmVC.showOnNavigationBar = NO;
        cwmVC.menuViewLayoutMode = WMMenuViewLayoutModeCenter;
        cwmVC.titleColorSelected = RGBColorHex(0x151515);
        cwmVC.titleColorNormal = RGBColorHex(0x151515);
        cwmVC.progressColor = RGBColorHex(0xE51C23);
        cwmVC.titleSizeSelected = 13.0f;
        cwmVC.titleSizeNormal = 13.0f;
        cwmVC.itemMargin = 100.0f;
        [self.navigationController pushViewController:cwmVC animated:YES];
    }
    else if (type==4)
    {
        //跳转到足迹
        ZFFootprintVC* vc = [[ZFFootprintVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (type==5)
    {
        //跳转到个人资料
        ZFPersonalVC* vc = [[ZFPersonalVC alloc]init];
        vc.userInfo = self.userInfo2;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

/**
 我的订单headview被点击
 */
//订单类型，默认0所有，1:待发货,2:待支付,3:待收货,4:待评价
- (void)ZFMyOrderHeadViewDidClick
{
    ZFZFMyOrderVC* vc = [[ZFZFMyOrderVC alloc]init];
    vc.type = 0;
    [self.navigationController pushViewController:vc animated:YES];
}

/**
 我的订单cell被点击
 */
- (void)ZFMyOrderTableCellDidClick:(NSIndexPath*)indexPath
{
    if (indexPath.item==0)
    {
        //待付款
        ZFZFMyOrderVC* vc = [[ZFZFMyOrderVC alloc] init];
        vc.type = 2;
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.item==1)
    {
        //待发货
        ZFZFMyOrderVC* vc = [[ZFZFMyOrderVC alloc] init];
        vc.type = 1;
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.item==2)
    {
        //待收货
        ZFZFMyOrderVC* vc = [[ZFZFMyOrderVC alloc] init];
        vc.type = 3;
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.item==3)
    {
        //待评价
        ZFZFMyOrderVC* vc = [[ZFZFMyOrderVC alloc] init];
        vc.type = 4;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

/**
 我的钱包headview被点击
 */
- (void)ZFMyWalletHeadViewDidClick
{
    ZFWalletVC* vc = [[ZFWalletVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

/**
 我的钱包cell被点击
 */
- (void)ZFMyWalletTableCellDidClick:(NSIndexPath*)indexPath
{
    if (indexPath.item==0)
    {
        //积分
        ZFMyIntegralVC* vc = [[ZFMyIntegralVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.item==1)
    {
        //优惠券
        ZFCouponCenterVC *vc = [[ZFCouponCenterVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


/**
 我的专栏headview被点击
 */
- (void)ZFMyColumnHeadViewDidClick
{
    
}

/**
 我的专栏cell被点击
 */
- (void)ZFMyColumnTableCellDidClick:(NSIndexPath*)indexPath
{
    if (indexPath.item==0)
    {
        //账户明细
        ZFDetailBalanceWMVC*vc = [[ZFDetailBalanceWMVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.item==1)
    {
        //奖金提现
        ZFWithdrawDepositVC*vc = [[ZFWithdrawDepositVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.item==2)
    {
        //拍卖
        ZFAuctionWMVC *wmvc = [[ZFAuctionWMVC alloc] init];
        wmvc.menuViewStyle = WMMenuViewStyleLine;
        wmvc.automaticallyCalculatesItemWidths = YES;
        wmvc.showOnNavigationBar = NO;
        wmvc.menuViewLayoutMode = WMMenuViewLayoutModeCenter;
        wmvc.titleColorSelected = RGBColorHex(0x333333);
        wmvc.titleColorNormal = RGBColorHex(0x333333);
        wmvc.progressColor = RGBColorHex(0x333333);
        wmvc.titleSizeSelected = 16.0f;
        wmvc.titleSizeNormal = 16.0f;
        wmvc.itemMargin = 30.0f;
        [self.navigationController pushViewController:wmvc animated:YES];
    }
    else if (indexPath.item==3)
    {
        //拼团
        ZFAuctionWMVC *wmvc = [[ZFAuctionWMVC alloc] init];
        wmvc.menuViewStyle = WMMenuViewStyleLine;
        wmvc.automaticallyCalculatesItemWidths = YES;
        wmvc.showOnNavigationBar = NO;
        wmvc.selectIndex = 1;
        wmvc.menuViewLayoutMode = WMMenuViewLayoutModeCenter;
        wmvc.titleColorSelected = RGBColorHex(0x333333);
        wmvc.titleColorNormal = RGBColorHex(0x333333);
        wmvc.progressColor = RGBColorHex(0x333333);
        wmvc.titleSizeSelected = 16.0f;
        wmvc.titleSizeNormal = 16.0f;
        wmvc.itemMargin = 30.0f;
        [self.navigationController pushViewController:wmvc animated:YES];
    }
    else if (indexPath.item==4)
    {
        //我的团队
        ZFMyTeamVC*vc = [[ZFMyTeamVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.item==5)
    {
        //我的分享
//        ZFMyShareVC *vc = [[ZFMyShareVC alloc]init];
//        [self.navigationController pushViewController:vc animated:YES];
        
    }
    else if (indexPath.item==6)
    {
       //签到次数
        ZFCheckTimesVC* vc = [[ZFCheckTimesVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.item==7)
    {
        //我的信息
        ZFStationNewsVC *vc = [[ZFStationNewsVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.item==8)
    {
        //我的分销
        ZFDistributionVC *vc = [[ZFDistributionVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, LL_ScreenHeight) style:UITableViewStylePlain];
        //设置数据源，注意必须实现对应的UITableViewDataSource协议
        _tableView.dataSource=self;
        //设置代理
        _tableView.delegate=self;
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}




@end
