//
//  ZFAddressManagementVC.m
//  ZF
//
//  Created by apple on 2019/3/12.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFAddressManagementVC.h"
#import "ZFAddressManagementTableCell.h"
#import "ZFSubmissionTableCell.h"
#import "ZFTool.h"

@interface ZFAddressManagementVC ()

@end

@implementation ZFAddressManagementVC

static NSString *const ZFAddressManagementTableCellID = @"ZFAddressManagementTableCellID";
static NSString *const ZFSubmissionTableCellID = @"ZFSubmissionTableCellID";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [ZFTool isHiddenNavigationBarSeparatorLine:YES vc:self];
    self.title = @"地址管理";
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
    
    [self.tableView registerClass:[ZFAddressManagementTableCell class] forCellReuseIdentifier:ZFAddressManagementTableCellID];
    [self.tableView registerClass:[ZFSubmissionTableCell class] forCellReuseIdentifier:ZFSubmissionTableCellID];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
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
        ZFAddressManagementTableCell* scell = [tableView dequeueReusableCellWithIdentifier:ZFAddressManagementTableCellID];
        scell = [[ZFAddressManagementTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFAddressManagementTableCellID];
        
        cell = scell;
    }
    else if (indexPath.section==1)
    {
        ZFSubmissionTableCell* scell = [tableView dequeueReusableCellWithIdentifier:ZFSubmissionTableCellID];
        scell = [[ZFSubmissionTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFSubmissionTableCellID];
        scell.title = @"新建收货地址";
        
        cell = scell;
    }
    
    return cell;
}


//每行的高度是多少
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        return 66;
    }
    
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
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
    if (indexPath.section==0)
    {
//        ZFPersonalDataVC* vc = [[ZFPersonalDataVC alloc]init];
//        [self.navigationController pushViewController:vc animated:YES];
    }
}



@end
