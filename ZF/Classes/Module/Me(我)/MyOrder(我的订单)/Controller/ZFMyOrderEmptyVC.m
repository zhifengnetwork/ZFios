//
//  ZFMyOrderEmptyVC.m
//  ZF
//
//  Created by admin on 2019/3/15.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFMyOrderEmptyVC.h"
#import "ZFOrderEmptyTableCell.h"
#import "ZFGoShoppingTableCell.h"
#import "ZFTool.h"

@interface ZFMyOrderEmptyVC ()

@end

@implementation ZFMyOrderEmptyVC

static NSString *const ZFOrderEmptyTableCellID = @"ZFOrderEmptyTableCellID";
static NSString *const ZFGoShoppingTableCellID = @"ZFGoShoppingTableCellID";


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [ZFTool isHiddenNavigationBarSeparatorLine:YES vc:self];
    self.title = @"我的订单";
    [self setupTableView];
    
    UIImage *imgRight = [UIImage imageNamed:@"All"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[imgRight imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(deleteButtonDidClick)];
}

- (void)deleteButtonDidClick
{
    
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
    self.tableView.estimatedRowHeight = 100;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.backgroundColor = RGBTableViewBGColor;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    [self.tableView registerClass:[ZFOrderEmptyTableCell class] forCellReuseIdentifier:ZFOrderEmptyTableCellID];
    [self.tableView registerClass:[ZFGoShoppingTableCell class] forCellReuseIdentifier:ZFGoShoppingTableCellID];
    
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
        ZFOrderEmptyTableCell* scell = [tableView dequeueReusableCellWithIdentifier:ZFOrderEmptyTableCellID];
        scell = [[ZFOrderEmptyTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFOrderEmptyTableCellID];
        
        cell = scell;
    }
    else if (indexPath.section==1)
    {
        ZFGoShoppingTableCell* pcell = [tableView dequeueReusableCellWithIdentifier:ZFGoShoppingTableCellID];
        pcell = [[ZFGoShoppingTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFGoShoppingTableCellID];
        
        cell = pcell;
    }
    
    return cell;
}


//每行的高度是多少
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
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
    if (indexPath.section==0)
    {
        //        ZFPersonalDataVC* vc = [[ZFPersonalDataVC alloc]init];
        //        [self.navigationController pushViewController:vc animated:YES];
    }
}




@end
