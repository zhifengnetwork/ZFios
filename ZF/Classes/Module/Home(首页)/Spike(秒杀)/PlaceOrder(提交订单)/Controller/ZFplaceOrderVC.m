//
//  ZFplaceOrderVC.m
//  ZF
//
//  Created by apple on 2019/3/5.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFplaceOrderVC.h"
#import "ZFSubmittedHeadTableCell.h"
#import "ZFSubmittedTitleTableCell.h"
#import "ZFAmountPayableTableCell.h"
#import "ZFPaymentMethodTableCell.h"
#import "ZFSubmissionTableCell.h"
#import "MJExtension.h"
#import "SVProgressHUD.h"
#import "ZFTool.h"

@interface ZFplaceOrderVC ()<ZFPaymentMethodTableCellDelegate>

@property (nonatomic, strong) NSIndexPath *lastIndexPath;

@end

@implementation ZFplaceOrderVC

static NSString *const ZFSubmittedHeadTableCellID = @"ZFSubmittedHeadTableCellID";
static NSString *const ZFSubmittedTitleTableCellID = @"ZFSubmittedTitleTableCellID";
static NSString *const ZFAmountPayableTableCellID = @"ZFAmountPayableTableCellID";
static NSString *const ZFPaymentMethodTableCellID = @"ZFPaymentMethodTableCellID";
static NSString *const ZFSubmissionTableCellID = @"ZFSubmissionTableCellID";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [ZFTool isHiddenNavigationBarSeparatorLine:YES vc:self];
    self.title = @"提交订单";
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
    self.tableView.backgroundColor = RGBTableViewBGColor;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.alwaysBounceVertical=NO;
    
    [self.tableView registerClass:[ZFSubmittedHeadTableCell class] forCellReuseIdentifier:ZFSubmittedHeadTableCellID];
    [self.tableView registerClass:[ZFSubmittedTitleTableCell class] forCellReuseIdentifier:ZFSubmittedTitleTableCellID];
    [self.tableView registerClass:[ZFAmountPayableTableCell class] forCellReuseIdentifier:ZFAmountPayableTableCellID];
    [self.tableView registerClass:[ZFPaymentMethodTableCell class] forCellReuseIdentifier:ZFPaymentMethodTableCellID];
    [self.tableView registerClass:[ZFSubmissionTableCell class] forCellReuseIdentifier:ZFSubmissionTableCellID];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==3)
    {
       return 4;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    if (indexPath.section==0)
    {
        ZFSubmittedHeadTableCell* scell = [tableView dequeueReusableCellWithIdentifier:ZFSubmittedHeadTableCellID];
        scell = [[ZFSubmittedHeadTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFSubmittedHeadTableCellID];
        
        cell = scell;
    }
    else if (indexPath.section==1)
    {
        ZFSubmittedTitleTableCell* pcell = [tableView dequeueReusableCellWithIdentifier:ZFSubmittedTitleTableCellID];
        pcell = [[ZFSubmittedTitleTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFSubmittedTitleTableCellID];
        
        cell = pcell;
    }
    else if (indexPath.section==2)
    {
        ZFAmountPayableTableCell* acell = [tableView dequeueReusableCellWithIdentifier:ZFAmountPayableTableCellID];
        acell = [[ZFAmountPayableTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFAmountPayableTableCellID];
        
        cell = acell;
    }
    else if (indexPath.section==3)
    {
        ZFPaymentMethodTableCell* kcell = [tableView dequeueReusableCellWithIdentifier:ZFPaymentMethodTableCellID];
        kcell = [[ZFPaymentMethodTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFPaymentMethodTableCellID];
        if (indexPath.row==0) {
            kcell.iconName = @"yunshanfu";
            kcell.title = @"云闪付";
        }
        else if (indexPath.row==1) {
            kcell.iconName = @"zhifubao";
            kcell.title = @"支付宝";
        }
        else if (indexPath.row==2) {
            kcell.iconName = @"weixin";
            kcell.title = @"微信支付";
        }
        else if (indexPath.row==3) {
            kcell.iconName = @"yue";
            kcell.title = @"余额:¥ 8000.52";
        }
        kcell.delegate = self;
        kcell.isSelected = indexPath==self.lastIndexPath ? YES : NO;
        
        cell = kcell;
    }
    else if (indexPath.section==4)
    {
        ZFSubmissionTableCell* xcell = [tableView dequeueReusableCellWithIdentifier:ZFSubmissionTableCellID];
        xcell = [[ZFSubmissionTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFSubmissionTableCellID];
        
        cell = xcell;
    }
    
    return cell;
}


//每行的高度是多少
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        return 100;
    }
    else if (indexPath.section==1)
    {
        return 28;
    }
    else if (indexPath.section==3)
    {
        return 42;
    }
    
    return 40.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0)
    {
        return 10;
    }
    if (section==3)
    {
        return 10;
    }
    return 0;
}

#pragma mark - TableViewDelegate
//点击了哪个cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==3)
    {
        self.lastIndexPath = indexPath;
        [tableView reloadData];
    }
}


@end
