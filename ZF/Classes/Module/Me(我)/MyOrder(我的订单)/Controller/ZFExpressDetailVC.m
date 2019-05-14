//
//  ZFExpressDetailVC.m
//  ZF
//
//  Created by weiming zhang on 2019/5/14.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFExpressDetailVC.h"
#import "ZFExpressDetailCell.h"

@interface ZFExpressDetailVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UILabel *expressLabel;
@property (nonatomic, strong)UITableView *tableView;
@end

@implementation ZFExpressDetailVC

static NSString *const ZFExpressDetailCellID = @"ZFExpressDetailCellID";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"物流详情";
    [self setup];
}

- (void)setup{
    [self.view addSubview:self.expressLabel];
    [self.view addSubview:self.tableView];
    [_expressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view).with.offset(20);
    }];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.expressLabel.mas_bottom).with.offset(10);
        make.left.right.bottom.equalTo(self.view);
    }];
}

- (UILabel *)expressLabel{
    if (_expressLabel == nil) {
        _expressLabel = [[UILabel alloc]init];
        _expressLabel.font = [UIFont systemFontOfSize:12];
        _expressLabel.textColor = RGBColorHex(0x999999);
        _expressLabel.text = @"快递单号: 3232523423423";
    }return _expressLabel;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]init];
        _tableView.rowHeight = 20;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[ZFExpressDetailCell class] forCellReuseIdentifier:ZFExpressDetailCellID];
    }return _tableView;
}

#pragma mark --协议
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZFExpressDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:ZFExpressDetailCellID forIndexPath:indexPath];
    return cell;
}


@end
