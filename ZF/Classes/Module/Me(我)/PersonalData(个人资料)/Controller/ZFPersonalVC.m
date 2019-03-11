//
//  ZFPersonalVC.m
//  ZF
//
//  Created by apple on 2019/3/11.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFPersonalVC.h"
#import "ZFPersonalHeadTableCell.h"
#import "ZFPersonalCentralTableCell.h"
#import "ZFSubmissionTableCell.h"
#import "ZFPersonalDataVC.h"

@interface ZFPersonalVC ()

@end

@implementation ZFPersonalVC

static NSString *const ZFPersonalHeadTableCellID = @"ZFPersonalHeadTableCellID";
static NSString *const ZFPersonalCentralTableCellID = @"ZFPersonalCentralTableCellID";
static NSString *const ZFSubmissionTableCellID = @"ZFSubmissionTableCellID";


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [ZFTool isHiddenNavigationBarSeparatorLine:YES vc:self];
    self.title = @"个人资料";
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
    
    [self.tableView registerClass:[ZFPersonalHeadTableCell class] forCellReuseIdentifier:ZFPersonalHeadTableCellID];
    [self.tableView registerClass:[ZFPersonalCentralTableCell class] forCellReuseIdentifier:ZFPersonalCentralTableCellID];
    [self.tableView registerClass:[ZFSubmissionTableCell class] forCellReuseIdentifier:ZFSubmissionTableCellID];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==1)
    {
        return 6;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    if (indexPath.section==0)
    {
        ZFPersonalHeadTableCell* scell = [tableView dequeueReusableCellWithIdentifier:ZFPersonalHeadTableCellID];
        scell = [[ZFPersonalHeadTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFPersonalHeadTableCellID];
        
        cell = scell;
    }
    else if (indexPath.section==1)
    {
        ZFPersonalCentralTableCell* pcell = [tableView dequeueReusableCellWithIdentifier:ZFPersonalCentralTableCellID];
        pcell = [[ZFPersonalCentralTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFPersonalCentralTableCellID];
        if (indexPath.row==0) {
            pcell.title = @"地址管理";
            pcell.roundTop = YES;
        }
        else if (indexPath.row==1) {
            pcell.title = @"账号与安全";
        }
        else if (indexPath.row==2) {
            pcell.title = @"支付设置";
        }
        else if (indexPath.row==3) {
            pcell.title = @"通用";
        }
        else if (indexPath.row==4) {
            pcell.title = @"操作流程";
        }
        else if (indexPath.row==5) {
            pcell.title = @"关于APP";
            pcell.roundBottom = YES;
        }
        
        cell = pcell;
    }
    else if (indexPath.section==2)
    {
        ZFSubmissionTableCell* scell = [tableView dequeueReusableCellWithIdentifier:ZFSubmissionTableCellID];
        scell = [[ZFSubmissionTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFSubmissionTableCellID];
        scell.title = @"退出登录";
        
        cell = scell;
    }
    
    return cell;
}


//每行的高度是多少
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        return 80;
    }
    else if (indexPath.section==2)
    {
        return 60;
    }
    
    return 45;
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
        ZFPersonalDataVC* vc = [[ZFPersonalDataVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}



@end
