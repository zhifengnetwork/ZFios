//
//  ZFMaterialAreaVC.m
//  ZF
//
//  Created by admin on 2019/5/16.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFMaterialAreaVC.h"
#import "ZFMaterialAreaTableCell.h"
#import "http_home.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "RefreshGifHeader.h"
#import "ZFMaterialVC.h"

@interface ZFMaterialAreaVC ()

@property (nonatomic, strong)ZFMaterialListModel *materialListModel;

@end

@implementation ZFMaterialAreaVC

static NSString *const ZFMaterialAreaTableCellID = @"ZFMaterialAreaTableCellID";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    [ZFTool isHiddenNavigationBarSeparatorLine:YES vc:self];
    self.title = @"素材区";
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
    
    [self.tableView registerClass:[ZFMaterialAreaTableCell class] forCellReuseIdentifier:ZFMaterialAreaTableCellID];
    
    //自定义刷新动画
    ZWeakSelf
    self.tableView.mj_header = [RefreshGifHeader headerWithRefreshingBlock:^{
        
        [weakSelf loadData];
    }];
    [self.tableView.mj_header beginRefreshing];
    
}

-(void)loadData
{
    ZWeakSelf
    [http_home getMaterialList:0 page:1 success:^(id responseObject)
     {
         [self.tableView.mj_header endRefreshing];
         [weakSelf showData:responseObject];
     } failure:^(NSError *error) {
         [self.tableView.mj_header endRefreshing];
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
}

-(void)showData:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    
    self.materialListModel = [ZFMaterialListModel mj_objectWithKeyValues:responseObject];
    
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.materialListModel.list.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    ZFMaterialAreaTableCell* scell = [tableView dequeueReusableCellWithIdentifier:ZFMaterialAreaTableCellID];
    scell = [[ZFMaterialAreaTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFMaterialAreaTableCellID];
    ZFMaterialAreaModel* materialAreaModel = [self.materialListModel.list objectAtIndex:indexPath.section];
    scell.materialAreaModel = materialAreaModel;
    
    cell = scell;
    
    return cell;
}


//每行的高度是多少
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
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
    ZFMaterialAreaModel* materialAreaModel = [self.materialListModel.list objectAtIndex:indexPath.section];
    ZFMaterialVC *vc = [[ZFMaterialVC alloc]init];
    vc.materialAreaModel = materialAreaModel;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
