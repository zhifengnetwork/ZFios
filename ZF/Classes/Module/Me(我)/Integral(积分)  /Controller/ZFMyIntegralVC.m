//
//  ZFMyIntegralVC.m
//  ZF
//
//  Created by admin on 2019/3/19.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFMyIntegralVC.h"
#import "ZFMyIntegralHeadTableCell.h"
#import "ZFMyIntegralTableCell.h"

@interface ZFMyIntegralVC ()

@end

@implementation ZFMyIntegralVC

static NSString *const ZFMyIntegralHeadTableCellID = @"ZFMyIntegralHeadTableCellID";
static NSString *const ZFMyIntegralTableCellID = @"ZFMyIntegralTableCellID";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    [ZFTool isHiddenNavigationBarSeparatorLine:YES vc:self];
    self.title = @"累计积分";
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
    
    [self.tableView registerClass:[ZFMyIntegralHeadTableCell class] forCellReuseIdentifier:ZFMyIntegralHeadTableCellID];
    [self.tableView registerClass:[ZFMyIntegralTableCell class] forCellReuseIdentifier:ZFMyIntegralTableCellID];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    ZFMyIntegralTableCell* pcell = [tableView dequeueReusableCellWithIdentifier:ZFMyIntegralTableCellID];
    pcell = [[ZFMyIntegralTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFMyIntegralTableCellID];
    
    if (indexPath.section==0)
    {
        ZFMyIntegralHeadTableCell* scell = [tableView dequeueReusableCellWithIdentifier:ZFMyIntegralHeadTableCellID];
        scell = [[ZFMyIntegralHeadTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFMyIntegralHeadTableCellID];
        
        cell = scell;
    }
    else if (indexPath.section==1)
    {
        cell = pcell;
    }
    else if (indexPath.section==2)
    {
        pcell.title = @"分享积分";
        
        cell = pcell;
    }
    
    return cell;
}


//每行的高度是多少
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        return 180;
    }
    
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==2) {
        return 15;
    }
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
