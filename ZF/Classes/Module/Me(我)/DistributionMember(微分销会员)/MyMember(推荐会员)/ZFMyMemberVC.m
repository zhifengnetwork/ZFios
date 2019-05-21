//
//  ZFMyMemberVC.m
//  ZF
//
//  Created by admin on 2019/5/11.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFMyMemberVC.h"
#import "ZFMyMemberTableCell.h"
#import "ZFUserMemberTableCell.h"
#import "http_mine.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "RefreshGifHeader.h"
#import "ZFMyMemberModel.h"

@interface ZFMyMemberVC ()

@property (nonatomic, strong)  NSMutableArray * datas;

@end

@implementation ZFMyMemberVC

static NSString *const ZFMyMemberTableCellID = @"ZFMyMemberTableCellID";
static NSString *const ZFUserMemberTableCellID = @"ZFUserMemberTableCellID";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    [ZFTool isHiddenNavigationBarSeparatorLine:YES vc:self];
    self.title = @"我的会员";
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
    
    [self.tableView registerClass:[ZFMyMemberTableCell class] forCellReuseIdentifier:ZFMyMemberTableCellID];
    
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
    [http_mine team_list:nil success:^(id responseObject)
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
    
    self.datas = [ZFMyMemberModel mj_objectArrayWithKeyValuesArray:responseObject];
    
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1+self.datas.count;
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
        ZFMyMemberTableCell* scell = [tableView dequeueReusableCellWithIdentifier:ZFMyMemberTableCellID];
        scell = [[ZFMyMemberTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFMyMemberTableCellID];
        
        cell = scell;
    }
    else
    {
        ZFUserMemberTableCell* pcell = [tableView dequeueReusableCellWithIdentifier:ZFUserMemberTableCellID];
        pcell = [[ZFUserMemberTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFUserMemberTableCellID];
        ZFMyMemberModel *memberModel = [self.datas objectAtIndex:indexPath.section-1];
        pcell.myMemberModel = memberModel;
        
        cell = pcell;
    }
    
    return cell;
}


//每行的高度是多少
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
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

-(NSMutableArray *)datas
{
    if (_datas==nil) {
        _datas = [[NSMutableArray alloc]init];
    }
    return _datas;
}


@end
