//
//  ZFStationNewsVC.m
//  ZF
//
//  Created by apple on 2019/3/6.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFStationNewsVC.h"
#import "ZFStationNewsTableCell.h"
#import "MJExtension.h"
#import "SVProgressHUD.h"
#import "ZFStationNewsHeadView.h"


@interface ZFStationNewsVC ()<ZFStationNewsHeadViewDelegate>

@property (nonatomic, strong) ZFStationNewsHeadView *headerView;

@end

@implementation ZFStationNewsVC

static NSString *const ZFStationNewsTableCellID = @"ZFStationNewsTableCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"站内信息";
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
    self.tableView.backgroundColor = RGBColorHex(0xf3f5f7);
    _headerView = [[ZFStationNewsHeadView alloc] initWithFrame:CGRectMake(0, 0,LL_ScreenWidth, 40)];
    _headerView.delegate = self;
    self.tableView.tableHeaderView = _headerView;
    
    self.tableView.estimatedRowHeight = 44;
    self.tableView.estimatedSectionHeaderHeight = 10;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.alwaysBounceVertical=NO;
    
    [self.tableView registerClass:[ZFStationNewsTableCell class] forCellReuseIdentifier:ZFStationNewsTableCellID];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    ZFStationNewsTableCell* scell = [tableView dequeueReusableCellWithIdentifier:ZFStationNewsTableCellID];
    scell = [[ZFStationNewsTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFStationNewsTableCellID];
    
    cell = scell;
    
    return cell;
}


//每行的高度是多少
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

#pragma mark - TableViewDelegate
//点击了哪个cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        
    }
}

/**
 *  站内消息HeadView被点击
 *
 *  @param type 信息 or 公告
 */
- (void)ZFStationNewsHeadViewDidClick:(NSString*)type
{
    
}


@end
