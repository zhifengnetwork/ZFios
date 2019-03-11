//
//  ZFFillOrderVC.m
//  ZF
//
//  Created by apple on 2019/3/6.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFFillOrderVC.h"
#import "ZFAddressTableCell.h"
#import "ZFOrderInformationTableCell.h"
#import "ZFTotalCommodityTableCell.h"
#import "ZFSubmissionTableCell.h"
#import "MJExtension.h"
#import "SVProgressHUD.h"
#import "ZFTool.h"


@interface ZFFillOrderVC ()

@end

@implementation ZFFillOrderVC

static NSString *const ZFAddressTableCellID = @"ZFAddressTableCellID";
static NSString *const ZFOrderInformationTableCellID = @"ZFOrderInformationTableCellID";
static NSString *const ZFTotalCommodityTableCellID = @"ZFTotalCommodityTableCellID";
static NSString *const ZFSubmissionTableCellID = @"ZFSubmissionTableCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"填写订单";
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
    
    [self.tableView registerClass:[ZFAddressTableCell class] forCellReuseIdentifier:ZFAddressTableCellID];
    [self.tableView registerClass:[ZFOrderInformationTableCell class] forCellReuseIdentifier:ZFOrderInformationTableCellID];
    [self.tableView registerClass:[ZFTotalCommodityTableCell class] forCellReuseIdentifier:ZFTotalCommodityTableCellID];
    [self.tableView registerClass:[ZFSubmissionTableCell class] forCellReuseIdentifier:ZFSubmissionTableCellID];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==2)
    {
        return 2;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    if (indexPath.section==0)
    {
        ZFAddressTableCell* scell = [tableView dequeueReusableCellWithIdentifier:ZFAddressTableCellID];
        scell = [[ZFAddressTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFAddressTableCellID];
        
        cell = scell;
    }
    else if (indexPath.section==1)
    {
        ZFOrderInformationTableCell* pcell = [tableView dequeueReusableCellWithIdentifier:ZFOrderInformationTableCellID];
        pcell = [[ZFOrderInformationTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFOrderInformationTableCellID];
        
        cell = pcell;
    }
    else if (indexPath.section==2)
    {
        ZFTotalCommodityTableCell* acell = [tableView dequeueReusableCellWithIdentifier:ZFTotalCommodityTableCellID];
        acell = [[ZFTotalCommodityTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFTotalCommodityTableCellID];
        if (indexPath.row==0) {
            acell.title = @"商品合计";
            acell.money = @"¥ 128";
        }
        else if (indexPath.row==1) {
            acell.title = @"运费合计";
            acell.money = @"¥ 138";
        }
        
        cell = acell;
    }
    else if (indexPath.section==3)
    {
        ZFSubmissionTableCell* xcell = [tableView dequeueReusableCellWithIdentifier:ZFSubmissionTableCellID];
        xcell = [[ZFSubmissionTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFSubmissionTableCellID];
        xcell.title = @"立即支付（143.00）";
        
        cell = xcell;
    }
    
    return cell;
}


//每行的高度是多少
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        return 75;
    }
    else if (indexPath.section==1)
    {
        return 125;
    }
    else if (indexPath.section==3)
    {
        return 60;
    }
    
    return 40.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==1)
    {
        return 15;
    }
    if (section==2)
    {
        return 15;
    }
    return 0;
}

#pragma mark - TableViewDelegate
//点击了哪个cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==3)
    {
        
    }
}


@end
