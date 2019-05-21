
//
//  ZFSeeOrderVC.m
//  ZF
//
//  Created by weiming zhang on 2019/5/21.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFSeeOrderVC.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "http_user.h"
#import "RefreshGifHeader.h"
#import "ZFSeeOrderCell.h"
#import "ZFDetailDistModel.h"

@interface ZFSeeOrderVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UILabel *mineIDLabel;
@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, strong)ZFDetailDistListModel *listModel;
@end

@implementation ZFSeeOrderVC

static NSString *const ZFSeeOrderCellID = @"ZFSeeOrderCellID";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"查看订单";
    [self setupUI];
}

- (void)setName:(NSString *)name{
    _name = name;
    _mineIDLabel.text = [NSString stringWithFormat:@"%@  ID: %ld 的下级",self.name,(long)self.user_id];
}

- (void)setupUI{
    [self.view addSubview:self.mineIDLabel];
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = RGBColorHex(0xcccccc);
    [self.view addSubview:lineView];
    [self.view addSubview:self.tableView];
    
    [_mineIDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(35);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mineIDLabel.mas_bottom).with.offset(12);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(1);
    }];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom);
        make.left.right.bottom.equalTo(self.view);
    }];
    
    self.tableView.mj_header = [RefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    
    [self.tableView.mj_header beginRefreshing];
}

- (void)loadData{
    [http_user order_list:self.user_id type:nil success:^(id responseObject) {
        [self showData:responseObject];
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.domain];
    }];
}

- (void)showData: (id)responseObject{
    [self.tableView.mj_header endRefreshing];
    if (kObjectIsEmpty(responseObject)) {
        return;
    }
    self.listModel = [ZFDetailDistListModel mj_objectWithKeyValues:responseObject];
    [self.tableView reloadData];
     self.mineIDLabel.text = [NSString stringWithFormat:@"%@  ID: %ld 的下级",self.name,self.user_id];
}

- (UILabel *)mineIDLabel{
    if (_mineIDLabel == nil) {
        _mineIDLabel = [[UILabel alloc]init];
        _mineIDLabel.font = [UIFont systemFontOfSize:15];
        _mineIDLabel.textColor = [UIColor blackColor];
        _mineIDLabel.text = @"精  ID: 32322 的下级";
    }return _mineIDLabel;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 110;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[ZFSeeOrderCell class] forCellReuseIdentifier:ZFSeeOrderCellID];
    }return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listModel.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZFSeeOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:ZFSeeOrderCellID forIndexPath:indexPath];
    cell.detailModel = [self.listModel.list objectAtIndex:indexPath.row];
    return cell;
}
@end
