//
//  ZFTeamListVC.m
//  ZF
//
//  Created by weiming zhang on 2019/5/20.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFTeamListVC.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "http_mine.h"
#import "http_user.h"
#import "RefreshGifHeader.h"
#import "ZFDetailDistModel.h"
#import "UserInfoModel.h"
#import "ZFTeamListCell.h"

@interface ZFTeamListVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UILabel *mineIDLabel;
@property (nonatomic, strong)UIView *titleView;
@property (nonatomic, strong)UILabel *orderIDLabel;
@property (nonatomic, strong)UILabel *priceLabel;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *promptLabel;

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong) UserInfoModel *userInfo;
@property (nonatomic, strong)NSArray *teamArray;
@end

@implementation ZFTeamListVC
static NSString *const ZFTeamListCellID = @"ZFTeamListCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"团队列表";
    [self setupUI];
}
- (void)setupUI{
    [self.view addSubview:self.mineIDLabel];
    [self.view addSubview:self.titleView];
    [self.titleView addSubview:self.orderIDLabel];
    [self.titleView addSubview:self.nameLabel];
    [self.titleView addSubview:self.priceLabel];
    [self.titleView addSubview:self.promptLabel];
    [self.view addSubview:self.tableView];
    
    [_mineIDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(35);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    
    
    [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mineIDLabel.mas_bottom).with.offset(17);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(25);
    }];
    
    [_orderIDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleView.mas_centerY);
        make.left.equalTo(self.titleView).with.offset(LL_ScreenWidth/8);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleView).with.offset(LL_ScreenWidth/3);
        make.centerY.equalTo(self.titleView.mas_centerY);
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.titleView).with.offset(-LL_ScreenWidth/3-20);
        make.centerY.equalTo(self.titleView.mas_centerY);
    }];
    
    [_promptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleView.mas_centerY);
        make.right.equalTo(self.titleView).with.offset(-LL_ScreenWidth/8);
    }];
    
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleView.mas_bottom);
        make.left.right.bottom.equalTo(self.view);
    }];
    
    
    self.tableView.mj_header = [RefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    
    [self.tableView.mj_header beginRefreshing];
}

- (void)loadData{
    [http_user userinfo:^(id responseObject) {
        if (kObjectIsEmpty(responseObject)) {
            return;
        }
        self.userInfo = [UserInfoModel mj_objectWithKeyValues:responseObject];
        self.mineIDLabel.text = [NSString stringWithFormat:@"%@  ID: %@ 的下级",self.userInfo.nickname,self.userInfo.user_id];
        if (self.user_id!=0) {
            self.mineIDLabel.text = [NSString stringWithFormat:@"%@  ID: %ld 的下级",self.nickname,self.user_id];
        }
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.domain];
    }];
    [http_mine team_list:self.next_user_id success:^(id responseObject) {
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
    self.teamArray = [ZFDetailDistModel mj_objectArrayWithKeyValuesArray:responseObject];
    [self.tableView reloadData];
}

- (UILabel *)mineIDLabel{
    if (_mineIDLabel == nil) {
        _mineIDLabel = [[UILabel alloc]init];
        _mineIDLabel.font = [UIFont systemFontOfSize:15];
        _mineIDLabel.textColor = RGBColorHex(0x151515);
        _mineIDLabel.text = @"精  ID: 32322 的下级";
    }return _mineIDLabel;
}

- (UIView *)titleView{
    if (_titleView == nil) {
        _titleView = [[UIView alloc]init];
        _titleView.backgroundColor = RGBColorHex(0xecf4fa);
    }return _titleView;
}


- (UILabel *)orderIDLabel{
    if (_orderIDLabel == nil) {
        _orderIDLabel = [[UILabel alloc]init];
        _orderIDLabel.font = [UIFont systemFontOfSize:15];
        _orderIDLabel.textColor = RGBColorHex(0x151515);
        _orderIDLabel.text = @"用户ID";
    }return _orderIDLabel;
}

- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = [UIFont systemFontOfSize:15];
        _nameLabel.textColor = RGBColorHex(0x151515);
        _nameLabel.text = @"名称";
    }return _nameLabel;
}

- (UILabel *)priceLabel{
    if (_priceLabel == nil) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.font = [UIFont systemFontOfSize:15];
        _priceLabel.textColor = RGBColorHex(0x151515);
        _priceLabel.text = @"手机";
    }return _priceLabel;
}

- (UILabel *)promptLabel{
    if (_promptLabel == nil) {
        _promptLabel = [[UILabel alloc]init];
        _promptLabel.font = [UIFont systemFontOfSize:15];
        _promptLabel.textColor = RGBColorHex(0x151515);
        _promptLabel.text = @"订单";
    }return _promptLabel;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[ZFTeamListCell class] forCellReuseIdentifier:ZFTeamListCellID];
    }return _tableView;
}

#pragma mark --协议
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.teamArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ZFDetailDistModel *model = [self.teamArray objectAtIndex:indexPath.row];
    ZFTeamListVC *vc = [[ZFTeamListVC alloc]init];
    vc.nickname = model.nickname;
    vc.user_id = model.user_id;
    vc.next_user_id = model.user_id;
    [self.navigationController pushViewController:vc animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZFTeamListCell *cell = [tableView dequeueReusableCellWithIdentifier:ZFTeamListCellID forIndexPath:indexPath];
        cell.orderModel = [self.teamArray objectAtIndex:indexPath.row];
    return cell;
}

@end
