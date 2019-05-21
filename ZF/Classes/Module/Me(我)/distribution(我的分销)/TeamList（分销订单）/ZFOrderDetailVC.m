//
//  ZFOrderDetailVC.m
//  ZF
//
//  Created by weiming zhang on 2019/5/21.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFOrderDetailVC.h"
#import "ZFOrderDetailCell.h"

@interface ZFOrderDetailVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@end

@implementation ZFOrderDetailVC
static NSString *const ZFOrderDetailCellID = @"ZFOrderDetailCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"下级订单详情";
    [self.view addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(self.view);
    }];
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 80;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[ZFOrderDetailCell class] forCellReuseIdentifier:ZFOrderDetailCellID];
    }return _tableView;
}

- (void)setGoodsArray:(NSArray *)goodsArray{
    _goodsArray = goodsArray;
    [self.tableView reloadData];
}

#pragma mark --协议

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.goodsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZFOrderDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:ZFOrderDetailCellID forIndexPath:indexPath];
    cell.detailModel = [self.goodsArray objectAtIndex:indexPath.row];
    return cell;
}

@end
