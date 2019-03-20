//
//  ZFPublicWelfareVC.m
//  ZF
//
//  Created by admin on 2019/3/19.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFPublicWelfareVC.h"
#import "ZFPublicHeadTableCell.h"
#import "ZFPublicTitleTableCell.h"
#import "ZFDynamicsITableCell.h"
#import "ZFMyDynamicsTableCell.h"
#import "ZFTool.h"
#import "ZFDonationButtonTableCell.h"

@interface ZFPublicWelfareVC ()<ZFDonationButtonTableCellDelegate>

@end

@implementation ZFPublicWelfareVC

static NSString *const ZFPublicHeadTableCellID = @"ZFPublicHeadTableCellID";
static NSString *const ZFPublicTitleTableCellID = @"ZFPublicTitleTableCellID";
static NSString *const ZFDonationButtonTableCellID = @"ZFDonationButtonTableCellID";
static NSString *const ZFDynamicsITableCellID = @"ZFDynamicsITableCellID";
static NSString *const ZFMyDynamicsTableCellID = @"ZFMyDynamicsTableCellID";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [ZFTool isHiddenNavigationBarSeparatorLine:YES vc:self];
    self.title = @"公益基金账户";
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
    self.tableView.backgroundColor = RGBColorHex(0xf3f5f7);
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.alwaysBounceVertical=NO;
    
    [self.tableView registerClass:[ZFPublicHeadTableCell class] forCellReuseIdentifier:ZFPublicHeadTableCellID];
    [self.tableView registerClass:[ZFPublicTitleTableCell class] forCellReuseIdentifier:ZFPublicTitleTableCellID];
    [self.tableView registerClass:[ZFDonationButtonTableCell class] forCellReuseIdentifier:ZFDonationButtonTableCellID];
    [self.tableView registerClass:[ZFDynamicsITableCell class] forCellReuseIdentifier:ZFDynamicsITableCellID];
    [self.tableView registerClass:[ZFMyDynamicsTableCell class] forCellReuseIdentifier:ZFMyDynamicsTableCellID];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==4) {
        return 2;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    if (indexPath.section==0)
    {
        ZFPublicHeadTableCell* pcell = [tableView dequeueReusableCellWithIdentifier:ZFPublicHeadTableCellID];
        pcell = [[ZFPublicHeadTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFPublicHeadTableCellID];
        
        cell = pcell;
    }
    else if (indexPath.section==1)
    {
        ZFPublicTitleTableCell* scell = [tableView dequeueReusableCellWithIdentifier:ZFPublicTitleTableCellID];
        scell = [[ZFPublicTitleTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFPublicTitleTableCellID];
        
        cell = scell;
    }
    else if (indexPath.section==2)
    {
        ZFDonationButtonTableCell* ocell = [tableView dequeueReusableCellWithIdentifier:ZFDonationButtonTableCellID];
        ocell = [[ZFDonationButtonTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFDonationButtonTableCellID];
        
        cell = ocell;
    }
    else if (indexPath.section==3)
    {
        ZFDynamicsITableCell* ocell = [tableView dequeueReusableCellWithIdentifier:ZFDynamicsITableCellID];
        ocell = [[ZFDynamicsITableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFDynamicsITableCellID];
        
        cell = ocell;
    }
    else if (indexPath.section==4)
    {
        ZFMyDynamicsTableCell* xcell = [tableView dequeueReusableCellWithIdentifier:ZFMyDynamicsTableCellID];
        xcell = [[ZFMyDynamicsTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFMyDynamicsTableCellID];
        
        cell = xcell;
    }
    
    return cell;
}


//每行的高度是多少
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 212;
    }
    else  if (indexPath.section==1) {
        return 37;
    }
    else  if (indexPath.section==2) {
        return 60;
    }
    else  if (indexPath.section==3) {
        return 30;
    }
    return 115;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==3) {
        return 10;
    }
    return 0;
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* view = [[UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    return view;
}


//公益基金账户被点击 1:捐赠金额 2:睡前故事 3:爱心次数
- (void)ZFDonationButtonTableCellDidClick:(int)type
{
     
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
