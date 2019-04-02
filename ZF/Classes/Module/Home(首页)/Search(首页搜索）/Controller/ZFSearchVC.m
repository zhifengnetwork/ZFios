//
//  ZFSearchVC.m
//  ZF
//
//  Created by weiming zhang on 2019/3/30.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFSearchVC.h"
#import "ZFTitleView.h"
#import "ZFSearchTableViewCell.h"
@interface ZFSearchVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UIView *screenView;
@property (nonatomic, strong)UIButton *multipleBtn;
@property (nonatomic, strong)UIButton *salesBtn;
@property (nonatomic, strong)UIButton *priceBtn;
@property (nonatomic, strong)UIButton *ProductBtn;
@property (nonatomic, strong)UIButton *filterBtn;
@end

@implementation ZFSearchVC
static NSString *const ZFSearchTableViewCellID = @"ZFSearchTableViewCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    
}
- (void)setup{
    self.navigationItem.leftBarButtonItem.image = [UIImage imageNamed:@"Back"];
    UIButton *btn = [[UIButton alloc]init];
    [btn setImage:[UIImage imageNamed:@"listing"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(cellControl) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    ZFTitleView *titleView = [[ZFTitleView alloc] initWithFrame:CGRectMake(0, 0, 261, 35)];
    titleView.intrinsicContentSize = CGSizeMake(261, 35);
    titleView.backgroundColor = RGBColorHex(0xf2f2f2);
    titleView.layer.cornerRadius = 5;
    self.navigationItem.titleView = titleView;
    
    [self.view addSubview:self.screenView];
    [self.screenView addSubview:self.multipleBtn];
    [self.screenView addSubview:self.salesBtn];
    [self.screenView addSubview:self.priceBtn];
    [self.screenView addSubview:self.ProductBtn];
    [self.screenView addSubview:self.filterBtn];
    [_screenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(5);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(39);
    }];
    [_multipleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.screenView).with.offset(16);
        make.centerY.equalTo(self.screenView.mas_centerY);
    }];
    [_multipleBtn setTitleEdgeInsets:UIEdgeInsetsMake(0,  -_multipleBtn.imageView.frame.size.width - 4, 0, _multipleBtn.imageView.frame.size.width + 4)];
    [_multipleBtn setImageEdgeInsets:UIEdgeInsetsMake(0 , _multipleBtn.titleLabel.bounds.size.width , 0,
                                                      -_multipleBtn.titleLabel.bounds.size.width )];
    [_salesBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.multipleBtn.mas_right).with.offset(47);
        make.centerY.equalTo(self.screenView.mas_centerY);
    }];
    [_priceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.salesBtn.mas_right).with.offset(47);
        make.centerY.equalTo(self.screenView.mas_centerY);
    }];
    [_priceBtn setTitleEdgeInsets:UIEdgeInsetsMake(0,  -_priceBtn.imageView.frame.size.width - 4, 0, _priceBtn.imageView.frame.size.width + 4)];
    [_priceBtn setImageEdgeInsets:UIEdgeInsetsMake(0 , _priceBtn.titleLabel.bounds.size.width , 0,
                                                      -_priceBtn.titleLabel.bounds.size.width )];
    [_ProductBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.priceBtn.mas_right).with.offset(47);
        make.centerY.equalTo(self.screenView.mas_centerY);
    }];
    [_filterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.ProductBtn.mas_right).with.offset(47);
        make.centerY.equalTo(self.screenView.mas_centerY);
    }];
    [_filterBtn setTitleEdgeInsets:UIEdgeInsetsMake(0,  -_filterBtn.imageView.frame.size.width - 4, 0, _filterBtn.imageView.frame.size.width + 4)];
    [_filterBtn setImageEdgeInsets:UIEdgeInsetsMake(0 , _filterBtn.titleLabel.bounds.size.width , 0,
                                                   -_filterBtn.titleLabel.bounds.size.width )];
    UITableView *tableView = [[UITableView alloc]init];
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.rowHeight = 121;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.screenView.mas_bottom).with.offset(5);
        make.left.equalTo(self.view).with.offset(16);
        make.right.equalTo(self.view).with.offset(-16);
        make.height.mas_equalTo(400);
    }];
}
- (UIView *)screenView{
    if (_screenView == nil) {
        _screenView = [[UIView alloc]init];
        _screenView.backgroundColor = RGBColorHex(0xf2f2f2);
    }
    return _screenView;
}
//综合按钮
- (UIButton *)multipleBtn{
    if (_multipleBtn == nil) {
        _multipleBtn = [[UIButton alloc]init];
        _multipleBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_multipleBtn setTitleColor:RGBColorHex(0xe73339) forState:UIControlStateNormal];
        [_multipleBtn setTitle:@"综合" forState:UIControlStateNormal];
        [_multipleBtn setImage:[UIImage imageNamed:@"down_r"] forState:UIControlStateNormal];
        
        
    }
    return _multipleBtn;
}
//销量按钮
- (UIButton *)salesBtn{
    if (_salesBtn == nil) {
        _salesBtn = [[UIButton alloc]init];
        _salesBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_salesBtn setTitleColor:RGBColorHex(0x484848) forState:UIControlStateNormal];
        [_salesBtn setTitle:@"销量" forState:UIControlStateNormal];
    }
    return _salesBtn;
}
//价格按钮
- (UIButton *)priceBtn{
    if (_priceBtn == nil) {
        _priceBtn = [[UIButton alloc]init];
        _priceBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_priceBtn setTitleColor:RGBColorHex(0x484848) forState:UIControlStateNormal];
        [_priceBtn setTitle:@"价格" forState:UIControlStateNormal];
        [_priceBtn setImage:[UIImage imageNamed:@"arrow_r"] forState:UIControlStateNormal];
    }
    return _priceBtn;
}
//新品按钮
- (UIButton *)ProductBtn{
    if (_ProductBtn == nil) {
        _ProductBtn = [[UIButton alloc]init];
        _ProductBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_ProductBtn setTitleColor:RGBColorHex(0x484848) forState:UIControlStateNormal];
        [_ProductBtn setTitle:@"新品" forState:UIControlStateNormal];
    }
    return _ProductBtn;
}
//筛选按钮
- (UIButton *)filterBtn{
    if (_filterBtn == nil) {
        _filterBtn = [[UIButton alloc]init];
        _filterBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_filterBtn setTitleColor:RGBColorHex(0x484848) forState:UIControlStateNormal];
        [_filterBtn setTitle:@"筛选" forState:UIControlStateNormal];
        [_filterBtn setImage:[UIImage imageNamed:@"screen"] forState:UIControlStateNormal];
    }
    return _filterBtn;
}
//控制显示列表还是块
- (void)cellControl{
    
}
#pragma mark --协议
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ZFSearchTableViewCellID];
    if (cell ==nil) {
        cell = [[ZFSearchTableViewCell alloc]init];
    }
    return cell;
}

@end
