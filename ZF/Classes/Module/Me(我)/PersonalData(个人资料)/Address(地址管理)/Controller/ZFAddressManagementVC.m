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
#import "ZFSpikeFooterView.h"
#import "ZFEditorialConsigneeVC.h"
#import "http_address.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "RefreshGifHeader.h"
#import "ZFAddressEditModel.h"

@interface ZFAddressManagementVC ()<UITableViewDelegate,UITableViewDataSource,ZFAddressManagementTableCellDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) ZFSpikeFooterView *footerView;

@property (nonatomic, strong)  NSMutableArray * datas;

@end

@implementation ZFAddressManagementVC

static NSString *const ZFAddressManagementTableCellID = @"ZFAddressManagementTableCellID";
//static NSString *const ZFSubmissionTableCellID = @"ZFSubmissionTableCellID";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [ZFTool isHiddenNavigationBarSeparatorLine:YES vc:self];
    self.title = @"地址管理";
    self.view.backgroundColor = TableViewBGColor;
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
    [self.view addSubview:self.footerView];
    [_footerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.bottom.mas_equalTo(-25);
        make.height.mas_equalTo(50);
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.bottom.equalTo(self->_footerView.mas_top);
    }];
    
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.backgroundColor = RGBColorHex(0xf3f5f7);
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.alwaysBounceVertical=NO;
    
    [self.tableView registerClass:[ZFAddressManagementTableCell class] forCellReuseIdentifier:ZFAddressManagementTableCellID];
    
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
    [http_address address_list:^(id responseObject)
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
    
    self.datas = [ZFAddressEditModel mj_objectArrayWithKeyValuesArray:responseObject];
    
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
        ZFAddressManagementTableCell* scell = [tableView dequeueReusableCellWithIdentifier:ZFAddressManagementTableCellID];
        scell = [[ZFAddressManagementTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFAddressManagementTableCellID];
        ZFAddressEditModel *addressModel = [self.datas objectAtIndex:indexPath.section-1];
        scell.addressEditModel = addressModel;
        scell.delegate = self;
        
        cell = scell;
    }
    
    return cell;
}


//每行的高度是多少
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 66;
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

- (void)handleSingleTap:(UITouch *)touch
{
    
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        //设置数据源，注意必须实现对应的UITableViewDataSource协议
        _tableView.dataSource=self;
        //设置代理
        _tableView.delegate=self;
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        [self.view addSubview:_tableView];
        
    }
    return _tableView;
}


-(ZFSpikeFooterView *)footerView
{
    if (_footerView==nil)
    {
        _footerView = [[ZFSpikeFooterView alloc]init];
        _footerView.name = @"新建收货地址";
        _footerView.layer.cornerRadius = 5;
        _footerView.clipsToBounds = YES;
        
        //UIView增加点击事件
        _footerView.userInteractionEnabled = YES;
        UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        [_footerView addGestureRecognizer:singleTap];
    }
    
    return _footerView;
}


- (void)ZFAddressManagementTableCellDidClick
{
    //跳转编辑收货人
    ZFEditorialConsigneeVC* vc = [[ZFEditorialConsigneeVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(NSMutableArray * )datas
{
    if (_datas==nil) {
        _datas = [[NSMutableArray alloc]init];
    }
    
    return _datas;
}

@end
