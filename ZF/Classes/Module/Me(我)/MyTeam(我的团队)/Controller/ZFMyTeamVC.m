//
//  ZFMyTeamVC.m
//  ZF
//
//  Created by admin on 2019/3/19.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFMyTeamVC.h"
#import "ZFMyTeamTableCell.h"
#import "ZFCityAgentTableCell.h"
#import "ZFTool.h"

@interface ZFMyTeamVC ()

@end

@implementation ZFMyTeamVC

static NSString *const ZFMyTeamTableCellID = @"ZFMyTeamTableCellID";
static NSString *const ZFCityAgentTableCellID = @"ZFCityAgentTableCellID";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [ZFTool isHiddenNavigationBarSeparatorLine:YES vc:self];
    self.title = @"商场我的团队业绩";
    [self setupTableView];
    
    UISegmentedControl* segment = [[UISegmentedControl alloc]initWithFrame:CGRectMake(10, 30, 200, 30)];
    //在索引值为0的位置上插入一个标题为red的按钮，第三个参数为是否开启动画
    [segment insertSegmentWithTitle:@"用户" atIndex:0 animated:YES];
    [segment insertSegmentWithTitle:@"累计业绩" atIndex:1 animated:YES];
    [segment insertSegmentWithTitle:@"详细业绩" atIndex:2 animated:YES];
    
    //设置背景颜色
    segment.backgroundColor = RGBColorHex(0xffffff);
    //设置标题和边框的颜色
    segment.tintColor = RGBColorHex(0x0060fe);
    //设置初始选中值，默认是没有选中
    segment.selectedSegmentIndex = 1;
//    self.view.backgroundColor = [UIColor magentaColor];
    //绑定事件
    [segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segment];
    
    
    NSArray* array = @[@"用户",@"累计业绩",@"详细业绩"];
    UISegmentedControl* segment1 = [[UISegmentedControl alloc]initWithItems:array];
    //设置位置和大小
    segment1.frame = CGRectMake(0, 0, LL_ScreenWidth, 30);
    [self.view addSubview:segment1];
    
    self.tableView.tableHeaderView = segment;
    
    //删除索引为0的按钮
    [segment1 removeSegmentAtIndex:0 animated:YES];
    
    //删除所有按钮
    [segment1 removeAllSegments];
    
}

-(void)segmentAction:(UISegmentedControl*)sender
{
    //titleForSegmentAtIndex通过索引值获取被选中的分段控制器的按钮标题，selectedSegmentIndex 是获取被选中按钮的索引值
    NSLog(@"----%@",[sender titleForSegmentAtIndex:sender.selectedSegmentIndex]);
  
//    switch (sender.selectedSegmentIndex) {
//        case 0:
//            NSLog(@"我是red,下标0！！！");
//            self.view.backgroundColor = [UIColor yellowColor];
//            break;
//        case 1:
//            NSLog(@"我是green,下标1！！！");
//            self.view.backgroundColor = [UIColor magentaColor];
//            break;
//        case 2:
//            NSLog(@"我是black,下标2！！！");
//            self.view.backgroundColor = [UIColor lightGrayColor];
//            break;
//        default:
//            break;
//    }
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
    
    [self.tableView registerClass:[ZFMyTeamTableCell class] forCellReuseIdentifier:ZFMyTeamTableCellID];
    [self.tableView registerClass:[ZFCityAgentTableCell class] forCellReuseIdentifier:ZFCityAgentTableCellID];
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
        ZFMyTeamTableCell* pcell = [tableView dequeueReusableCellWithIdentifier:ZFMyTeamTableCellID];
        pcell = [[ZFMyTeamTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFMyTeamTableCellID];
        
        cell = pcell;
    }
    else if (indexPath.section==1)
    {
        ZFCityAgentTableCell* scell = [tableView dequeueReusableCellWithIdentifier:ZFCityAgentTableCellID];
        scell = [[ZFCityAgentTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFCityAgentTableCellID];
        
        cell = scell;
    }
    
    return cell;
}


//每行的高度是多少
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 10;
    }
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
