//
//  ZFDetailDistributeVC.m
//  ZF
//
//  Created by weiming zhang on 2019/5/20.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFDetailDistributeVC.h"
#import "ZFDetailDistributeCell.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "http_mine.h"
#import "RefreshGifHeader.h"
#import "ZFDetailDistModel.h"

@interface ZFDetailDistributeVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UIView *titleView;
@property (nonatomic, strong)UILabel *orderIDLabel;
@property (nonatomic, strong)UILabel *priceLabel;
@property (nonatomic, strong)UILabel *promptLabel;

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)ZFDetailDistListModel *listModel;
@end

@implementation ZFDetailDistributeVC

static NSString *const ZFDetailDistributeCellID = @"ZFDetailDistributeCellID";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"业绩明细";
    [self setupUI];
}

- (void)setupUI{
    [self.view addSubview:self.titleView];
    [self.titleView addSubview:self.orderIDLabel];
    [self.titleView addSubview:self.priceLabel];
    [self.titleView addSubview:self.promptLabel];
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = RGBColorHex(0xcccccc);
    [self.view addSubview:lineView];
    [self.view addSubview:self.tableView];
    
    [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(40);
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.titleView.mas_centerX);
        make.centerY.equalTo(self.titleView.mas_centerY);
    }];
    
    [_orderIDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.priceLabel.mas_centerY);
        make.left.equalTo(self.titleView).with.offset(LL_ScreenWidth/6);
    }];
    
    [_promptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.priceLabel.mas_centerY);
        make.right.equalTo(self.titleView).with.offset(-LL_ScreenWidth/6);
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.titleView.mas_bottom);
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
    [http_mine performance_log:^(id responseObject) {
        [self showData:responseObject];
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.domain];
    }];
}

- (void)showData: (id)responseObject{
    if (kObjectIsEmpty(responseObject)) {
        return;
    }
    self.listModel = [ZFDetailDistListModel mj_objectWithKeyValues:responseObject];
    [self.tableView.mj_header endRefreshing];
}

- (UIView *)titleView{
    if (_titleView == nil) {
        _titleView = [[UIView alloc]init];
    }return _titleView;
}

- (UILabel *)orderIDLabel{
    if (_orderIDLabel == nil) {
        _orderIDLabel = [[UILabel alloc]init];
        _orderIDLabel.font = [UIFont systemFontOfSize:15];
        _orderIDLabel.textColor = [UIColor blackColor];
        _orderIDLabel.text = @"订单号";
    }return _orderIDLabel;
}

- (UILabel *)priceLabel{
    if (_priceLabel == nil) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.font = [UIFont systemFontOfSize:15];
        _priceLabel.textColor = [UIColor blackColor];
        _priceLabel.text = @"金额";
    }return _priceLabel;
}

- (UILabel *)promptLabel{
    if (_promptLabel == nil) {
        _promptLabel = [[UILabel alloc]init];
        _promptLabel.font = [UIFont systemFontOfSize:15];
        _promptLabel.textColor = [UIColor blackColor];
        _promptLabel.text = @"备注";
    }return _promptLabel;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[ZFDetailDistributeCell class] forCellReuseIdentifier:ZFDetailDistributeCellID];
    }return _tableView;
}

#pragma mark --协议
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZFDetailDistributeCell *cell = [tableView dequeueReusableCellWithIdentifier:ZFDetailDistributeCellID forIndexPath:indexPath];
    return cell;
}
@end
