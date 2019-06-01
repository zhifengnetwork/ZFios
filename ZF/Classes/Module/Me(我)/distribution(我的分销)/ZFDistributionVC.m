//
//  ZFDistributionVC.m
//  ZF
//
//  Created by weiming zhang on 2019/5/18.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFDistributionVC.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "http_mine.h"
#import "ZFDetailDistributeVC.h"
#import "ZFDetailRecordVC.h"
#import "ZFDistributeOrderVC.h"
#import "ZFTeamListVC.h"
#import "ZFDistributeModel.h"

@interface ZFDistributionVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UIView *timeView;
@property (nonatomic, strong)UILabel *timeLabel;
@property (nonatomic, strong)UIView *distributeView;
@property (nonatomic, strong)UILabel *total;
@property (nonatomic, strong)UILabel *totalLabel;
@property (nonatomic, strong)UIView *distributeView1;
@property (nonatomic, strong)UILabel *max;
@property (nonatomic, strong)UILabel *maxLabel;
@property (nonatomic, strong)UIView *distributeView2;
@property (nonatomic, strong)UILabel *other;
@property (nonatomic, strong)UILabel *otherLabel;
@property (nonatomic, strong)UIView *distributeView3;
@property (nonatomic, strong)UILabel *number;
@property (nonatomic, strong)UILabel *numberLabel;
@property (nonatomic, strong)UIButton *updateButton;
@property (nonatomic, strong)UILabel *topIDLabel;
@property (nonatomic, strong)UILabel *myIDLabel;
@property (nonatomic, strong)UILabel *topNameLabel;

@property (nonatomic, strong)UITableView *tableView;
@end

@implementation ZFDistributionVC

static NSString *const ZFDistributionCellID = @"ZFDistributionCellID";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的分销";
    [self setup];
}

- (void)setup{
    UIView *headView = [[UIView alloc]init];
    [self.view addSubview:headView];
    [headView addSubview:self.timeView];
    [self.timeView addSubview:self.timeLabel];
    [headView addSubview:self.distributeView];
    [self.distributeView addSubview:self.total];
    [self.distributeView addSubview:self.totalLabel];
    [headView addSubview:self.distributeView1];
    [self.distributeView1 addSubview:self.max];
    [self.distributeView1 addSubview:self.maxLabel];
    [headView addSubview:self.distributeView2];
    [self.distributeView2 addSubview:self.other];
    [self.distributeView2 addSubview:self.otherLabel];
    [headView addSubview:self.distributeView3];
    [self.distributeView3 addSubview:self.number];
    [self.distributeView3 addSubview:self.numberLabel];
    [self.distributeView3 addSubview:self.updateButton];
    [headView addSubview:self.topIDLabel];
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = RGBColorHex(0xe6e6e6);
    [headView addSubview:lineView];
    [headView addSubview:self.myIDLabel];
    [headView addSubview:self.topNameLabel];
    UIView *lineView1 = [[UIView alloc]init];
    lineView1.backgroundColor = RGBColorHex(0xe6e6e6);
    [headView addSubview:lineView1];
    [self.view addSubview:self.tableView];
    
    
    [_timeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(5);
        make.left.equalTo(self.view).with.offset(10);
        make.right.equalTo(self.view).with.offset(-10);
        make.height.mas_equalTo(18);
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.timeView.mas_centerX);
        make.centerY.equalTo(self.timeView.mas_centerY);
    }];
    
    [_distributeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.timeView.mas_bottom).with.offset(5);
        make.left.equalTo(self.view).with.offset(10);
        make.right.equalTo(self.view).with.offset(-10);
        make.height.mas_equalTo(90);
    }];
    
    [_total mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.distributeView.mas_top).with.offset(25);
        make.centerX.equalTo(self.distributeView.mas_centerX);
    }];
    
    [_totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.total.mas_bottom).with.offset(10);
        make.centerX.equalTo(self.distributeView.mas_centerX);
    }];
    
    [_distributeView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.distributeView.mas_bottom).with.offset(5);
        make.left.equalTo(self.view).with.offset(10);
        make.right.equalTo(self.view).with.offset(-10);
        make.height.mas_equalTo(90);
    }];
    
    [_max mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.distributeView1.mas_top).with.offset(25);
        make.centerX.equalTo(self.distributeView.mas_centerX);
    }];
    
    [_maxLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.max.mas_bottom).with.offset(10);
        make.centerX.equalTo(self.distributeView.mas_centerX);
    }];
    
    [_distributeView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.distributeView1.mas_bottom).with.offset(5);
        make.left.equalTo(self.view).with.offset(10);
        make.right.equalTo(self.view).with.offset(-10);
        make.height.mas_equalTo(90);
    }];
    
    [_other mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.distributeView2.mas_top).with.offset(25);
        make.centerX.equalTo(self.distributeView.mas_centerX);
    }];
    
    [_otherLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.other.mas_bottom).with.offset(10);
        make.centerX.equalTo(self.distributeView.mas_centerX);
    }];
    
    [_distributeView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.distributeView2.mas_bottom).with.offset(5);
        make.left.equalTo(self.view).with.offset(10);
        make.right.equalTo(self.view).with.offset(-10);
        make.height.mas_equalTo(90);
    }];
    
    [_number mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.distributeView3.mas_top).with.offset(25);
        make.centerX.equalTo(self.distributeView.mas_centerX);
    }];
    
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.number.mas_bottom).with.offset(10);
        make.centerX.equalTo(self.distributeView.mas_centerX);
    }];
    
    [_updateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.distributeView3).with.offset(-10);
        make.top.equalTo(self.distributeView3).with.offset(12);
        make.width.mas_equalTo(55);
        make.height.mas_equalTo(25);
    }];
    
    [_topIDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.distributeView3.mas_bottom).with.offset(10);
        make.left.equalTo(self.view).with.offset(20);
        make.width.mas_equalTo(80);
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.topIDLabel.mas_right).with.offset(24);
        make.centerY.equalTo(self.topIDLabel.mas_centerY);
        make.width.mas_equalTo(1);
        make.height.equalTo(self.topIDLabel.mas_height);
    }];
    
    [_myIDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView.mas_right).with.offset(42);
        make.centerY.mas_equalTo(self.topIDLabel.mas_centerY);
    }];
    
    [_topNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topIDLabel.mas_bottom).with.offset(10);
        make.left.equalTo(self.view).with.offset(20);
    }];
    
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topNameLabel.mas_bottom).with.offset(9);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(1);
    }];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView1.mas_bottom);
        make.left.right.bottom.equalTo(self.view);
    }];
    
    [http_mine distribut:^(id responseObject) {
        [self showData:responseObject];
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.domain];
    }];
}

- (void)showData:(id)responseObject{
    if (kObjectIsEmpty(responseObject)) {
        return;
    }
    ZFDistributeModel *distributeModel = [ZFDistributeModel mj_objectWithKeyValues:responseObject];
    ZFMoneytotalModel *totalModel = distributeModel.money_total;
    ZFLeaderModel *leaderModel = distributeModel.leader;
    _timeLabel.text = @"统计时间：2019-05-11  02：55：30";
    _totalLabel.text = [NSString stringWithFormat:@"￥ %@",[totalModel valueForKey:@"money_total"]];
    _maxLabel.text = [NSString stringWithFormat:@"￥ %@",[totalModel valueForKey:@"max_moneys"]];
    _otherLabel.text = [NSString stringWithFormat:@"￥ %@",[totalModel valueForKey:@"moneys"]];
    _numberLabel.text = [NSString stringWithFormat:@"%@",distributeModel.underling_number];
    _topIDLabel.text = [NSString stringWithFormat:@"上级ID:%@",[leaderModel valueForKey:@"user_id"]];
    _topNameLabel.text = [NSString stringWithFormat:@"上级名称：%@",[leaderModel valueForKey:@"nickname"]];
    _myIDLabel.text = [NSString stringWithFormat:@"我的ID:%ld",(long)distributeModel.user_id];
}

- (UIView *)timeView{
    if(_timeView == nil){
        _timeView = [[UIView alloc]init];
        _timeView.layer.cornerRadius = 2;
        _timeView.backgroundColor = RGBColorHex(0xeff5f8);
    }return _timeView;
}

- (UILabel *)timeLabel{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = [UIFont systemFontOfSize:10];
        _timeLabel.textColor = RGBColorHex(0x30383b);
        _timeLabel.text = @"统计时间：2019-05-11  02：55：30";
    }return _timeLabel;
}

- (UIView *)distributeView{
    if (_distributeView == nil) {
        _distributeView = [[UIView alloc]init];
        _distributeView.layer.cornerRadius = 3;
        _distributeView.backgroundColor = RGBColorHex(0xff5c36);
    }return _distributeView;
}

- (UILabel *)total{
    if (_total == nil) {
        _total = [[UILabel alloc]init];
        _total.font = [UIFont boldSystemFontOfSize:15];
        _total.textColor = [UIColor whiteColor];
        _total.text = @"总业绩";
    }return _total;
}

- (UILabel *)totalLabel{
    if (_totalLabel == nil) {
        _totalLabel = [[UILabel alloc]init];
        _totalLabel.font = [UIFont boldSystemFontOfSize:15];
        _totalLabel.textColor = [UIColor whiteColor];
        _totalLabel.text = @"￥ 100000.00";
    }return _totalLabel;
}

- (UIView *)distributeView1{
    if (_distributeView1 == nil) {
        _distributeView1 = [[UIView alloc]init];
        _distributeView1.layer.cornerRadius = 3;
        _distributeView1.backgroundColor = RGBColorHex(0xff5c36);
    }return _distributeView1;
}

- (UILabel *)max{
    if (_max == nil) {
        _max = [[UILabel alloc]init];
        _max.font = [UIFont boldSystemFontOfSize:15];
        _max.textColor = [UIColor whiteColor];
        _max.text = @"最大用户业绩";
    }return _max;
}

- (UILabel *)maxLabel{
    if (_maxLabel == nil) {
        _maxLabel = [[UILabel alloc]init];
        _maxLabel.font = [UIFont boldSystemFontOfSize:15];
        _maxLabel.textColor = [UIColor whiteColor];
        _maxLabel.text = @"￥200000.00";
    }return _maxLabel;
}

- (UIView *)distributeView2{
    if (_distributeView2 == nil) {
        _distributeView2 = [[UIView alloc]init];
        _distributeView2.layer.cornerRadius = 3;
        _distributeView2.backgroundColor = RGBColorHex(0xff5c36);
    }return _distributeView2;
}

- (UILabel *)other{
    if (_other == nil) {
        _other = [[UILabel alloc]init];
        _other.font = [UIFont boldSystemFontOfSize:15];
        _other.textColor = [UIColor whiteColor];
        _other.text = @"剩余用户业绩之和";
    }return _other;
}

- (UILabel *)otherLabel{
    if (_otherLabel == nil) {
        _otherLabel = [[UILabel alloc]init];
        _otherLabel.font = [UIFont boldSystemFontOfSize:15];
        _otherLabel.textColor = [UIColor whiteColor];
        _otherLabel.text = @"￥300000.00";
    }return _otherLabel;
}

- (UIView *)distributeView3{
    if (_distributeView3 == nil) {
        _distributeView3 = [[UIView alloc]init];
        _distributeView3.layer.cornerRadius = 3;
        _distributeView3.backgroundColor = RGBColorHex(0xff5c36);
    }return _distributeView3;
}

- (UILabel *)number{
    if (_number == nil) {
        _number = [[UILabel alloc]init];
        _number.font = [UIFont boldSystemFontOfSize:15];
        _number.textColor = [UIColor whiteColor];
        _number.text = @"团队总人数";
    }return _number;
}

- (UILabel *)numberLabel{
    if (_numberLabel == nil) {
        _numberLabel = [[UILabel alloc]init];
        _numberLabel.font = [UIFont boldSystemFontOfSize:15];
        _numberLabel.textColor = [UIColor whiteColor];
        _numberLabel.text = @"8";
    }return _numberLabel;
}

- (UIButton *)updateButton{
    if (_updateButton == nil) {
        _updateButton = [[UIButton alloc]init];
        _updateButton.layer.cornerRadius = 2;
        _updateButton.backgroundColor = RGBColorHex(0xf21d12);
        _updateButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_updateButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_updateButton setTitle:@"点击更新" forState:UIControlStateNormal];
        [_updateButton addTarget:self action:@selector(updateClick) forControlEvents:UIControlEventTouchUpInside];
    }return _updateButton;
}

- (UILabel *)topIDLabel{
    if (_topIDLabel== nil) {
        _topIDLabel = [[UILabel alloc]init];
        _topIDLabel.font = [UIFont systemFontOfSize:12];
        _topIDLabel.textColor = RGBColorHex(0x151515);
        _topIDLabel.text = @"上级ID:83432";
    }return _topIDLabel;
}

- (UILabel *)myIDLabel{
    if (_myIDLabel == nil) {
        _myIDLabel = [[UILabel alloc]init];
        _myIDLabel.font = [UIFont systemFontOfSize:12];
        _myIDLabel.textColor = RGBColorHex(0x151515);
        _myIDLabel.text = @"我的ID:83432";
    }return _myIDLabel;
}

- (UILabel *)topNameLabel{
    if (_topNameLabel == nil) {
        _topNameLabel = [[UILabel alloc]init];
        _topNameLabel.font = [UIFont systemFontOfSize:12];
        _topNameLabel.textColor = RGBColorHex(0x151515);
        _topNameLabel.text = @"上级名称：我的菜";
    }return _topNameLabel;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ZFDistributionCellID];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }return _tableView;
}

#pragma mark --协议
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ZFDistributionCellID forIndexPath:indexPath];
    if (indexPath.row == 0) {
        [cell.textLabel setText:@"业绩明细"];
    }else if (indexPath.row == 1){
        [cell.textLabel setText:@"明细记录"];
    }else if (indexPath.row == 2){
        [cell.textLabel setText:@"团队列表"];
    }else if (indexPath.row == 3){
        [cell.textLabel setText:@"分销订单"];
    }
    
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    cell.textLabel.textColor = RGBColorHex(0x2f2f2f);
    //设置下划线
    UIView*lineView =[[UIView alloc]init];
    lineView.frame = CGRectMake(cell.frame.origin.x+20,cell.frame.size.height-5,cell.frame.size.width-40,1);
    lineView.backgroundColor= RGBColorHex(0xe6e6e6);
    [cell.contentView addSubview:lineView];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        ZFDetailDistributeVC *vc = [[ZFDetailDistributeVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1){
        ZFDetailRecordVC *vc = [[ZFDetailRecordVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 2){
        ZFTeamListVC *vc = [[ZFTeamListVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 3){
        ZFDistributeOrderVC *vc = [[ZFDistributeOrderVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark--方法

- (void)updateClick{
    //点击更新
    [http_mine distribut:^(id responseObject) {
        [self showData:responseObject];
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.domain];
    }];
}


@end
