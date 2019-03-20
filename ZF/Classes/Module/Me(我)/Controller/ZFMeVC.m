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


@interface ZFMeVC()<UITableViewDataSource,UITableViewDelegate,ZFMyHeadViewDelegate,ZFMyOrderTableCellDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ZFMyHeadView *headView;

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
    
    self.headView = [[ZFMyHeadView alloc] initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, 130)];
    _headView.delegate = self;
    self.tableView.tableHeaderView = self.headView;
}

-(void)loadData
{
    
}



#pragma mark - Table view data source
//有多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
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
        ZFMyOrderTableCell* cell = [tableView dequeueReusableCellWithIdentifier:ZFMyOrderTableCellID];
        if (cell == nil)
        {
            cell = [[ZFMyOrderTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFMyOrderTableCellID];
        }
        cell.delegate = self;
        return cell;
    }
    else if (indexPath.section==1)
    {
        ZFMyWalletTableCell* cell = [tableView dequeueReusableCellWithIdentifier:ZFMyWalletTableCellID];
        if (cell == nil)
        {
            cell = [[ZFMyWalletTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFMyWalletTableCellID];
        }
        return cell;
    }
    else if (indexPath.section==2)
    {
        ZFFundAccountControllerCell* cell = [tableView dequeueReusableCellWithIdentifier:ZFFundAccountControllerCellID];
        if (cell == nil)
        {
            cell = [[ZFFundAccountControllerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFFundAccountControllerCellID];
        }
        return cell;
    }
    else if (indexPath.section==3)
    {
        ZFMyColumnTableCell* cell = [tableView dequeueReusableCellWithIdentifier:ZFMyColumnTableCellID];
        if (cell == nil)
        {
            cell = [[ZFMyColumnTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFMyColumnTableCellID];
        }
        return cell;
    }
    
    return nil;
}

//每行的高度是多少
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        return 88;
    }
    else if (indexPath.section==1)
    {
        return 100.0f;
    }
    else if (indexPath.section==2)
    {
        return 40.0f;
    }

    return 180.0f;
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
        //跳转到个人资料
        ZFPersonalVC* vc = [[ZFPersonalVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (type==2)
    {
        //跳转到商品关注
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
        //跳转到签到成功
//            ZFSignInView* windowView = [[ZFSignInView alloc]initWithFrame:CGRectMake(0, 0, 300, 400)];
//            [TYShowAlertView showAlertViewWithView:windowView backgoundTapDismissEnable:YES];
        
        //签到天数
        ZFCumulativeVC* vc = [[ZFCumulativeVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
        //我的积分
//        ZFMyIntegralVC* vc = [[ZFMyIntegralVC alloc]init];
//        [self.navigationController pushViewController:vc animated:YES];
        
        //我的团队
//        ZFMyTeamVC* vc = [[ZFMyTeamVC alloc]init];
//        [self.navigationController pushViewController:vc  animated:YES];
    }
    
}


/**
 我的订单cell被点击
 */
- (void)ZFMyOrderTableCellDidClick:(NSIndexPath*)indexPath
{
    if (indexPath.item==0)
    {
        //待付款
    }
    else if (indexPath.item==1)
    {
        //待发货
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
