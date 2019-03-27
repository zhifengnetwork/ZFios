//
//  ZFConfirmOrderVC.m
//  ZF
//
//  Created by weiming zhang on 2019/3/26.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFConfirmOrderVC.h"
#import "ZFAddressManagementVC.h"
@interface ZFConfirmOrderVC ()
//收货地址
@property (nonatomic, strong)UIView *addressView;
@property (nonatomic, strong)UILabel *emptyAddressLabel;
@property (nonatomic, strong)UIImageView *jumpImageView;
@property (nonatomic, strong)UIButton *reviseButton;
//商品信息
@property (nonatomic, strong)UIView *orderView;
@property (nonatomic, strong)UILabel *shopNameLabel;
@property (nonatomic, strong)UIImageView *jumpImageView2;
@property (nonatomic, strong)UIButton *shopButton;
@property (nonatomic, strong)UILabel *disCountLabel;
@property (nonatomic, strong)UILabel *detailDisCountLabel;
@property (nonatomic, strong)UIImageView *jumpImageView3;
@property (nonatomic, strong)UIButton *disCountButton;
@property (nonatomic, strong)UIImageView *pictureImageView;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *priceLabel;
@property (nonatomic, strong)UIView *lineView;
//订单信息
@property (nonatomic, strong)UIView *otherView;
@end

@implementation ZFConfirmOrderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup{
    self.title =@"确定订单";
    self.navigationItem.leftBarButtonItem.image = [UIImage imageNamed:@"Back"];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor blackColor];
//    self.navigationController.navigationBar.translucent  = YES; // 导航栏透明
//    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    [self.navigationController.navigationBar setBackgroundColor:RGBColorHex(0xf4f4f4)];
    //添加view里面的控件
    self.view.backgroundColor = RGBColorHex(0xf4f4f4);
    [self.view addSubview:self.addressView];
    [self.addressView addSubview:self.emptyAddressLabel];
    [self.addressView addSubview:self.jumpImageView];
    [self.addressView addSubview:self.reviseButton];
    [self.view addSubview:self.orderView];
    [self.orderView addSubview:self.shopNameLabel];
    [self.orderView addSubview:self.jumpImageView2];
    [self.orderView addSubview:self.shopButton];
    [self.orderView addSubview:self.disCountLabel];
    [self.orderView addSubview:self.detailDisCountLabel];
    [self.orderView addSubview:self.jumpImageView3];
    [self.orderView addSubview:self.disCountButton];
    [self.orderView addSubview:self.pictureImageView];
    [self.orderView addSubview:self.nameLabel];
    [self.orderView addSubview:self.priceLabel];
    [self.orderView addSubview:self.lineView];
    [self.view addSubview:self.otherView];
    [_addressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(84);
        make.left.equalTo(self.view).with.offset(16);
        make.right.equalTo(self.view).with.offset(-16);
        make.height.mas_equalTo(66);
    }];
    [_emptyAddressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.addressView.mas_centerY);
        make.left.equalTo(self.addressView).with.offset(10);
    }];
    [_jumpImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.addressView.mas_centerY);
        make.right.equalTo(self.addressView).with.offset(-10);
    }];
    [_reviseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.addressView).insets(UIEdgeInsetsZero);
    }];
    [_orderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.addressView.mas_bottom).with.offset(20);
        make.left.equalTo(self.view).with.offset(16);
        make.right.equalTo(self.view).with.offset(-16);
        make.height.mas_equalTo(199);
    }];
    [_shopNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.orderView).with.offset(12);
        make.left.equalTo(self.orderView).with.offset(10);
    }];
    [_jumpImageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.shopNameLabel.mas_right).with.offset(35);
        make.centerY.equalTo(self.shopNameLabel.mas_centerY);
    }];
    [_shopButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.shopNameLabel.mas_left);
        make.right.equalTo(self.jumpImageView2.mas_right);
        make.bottom.equalTo(self.shopNameLabel.mas_bottom);
        make.height.equalTo(self.shopNameLabel.mas_height);
    }];
    [_disCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.orderView).with.offset(10);
        make.top.equalTo(self.shopButton.mas_bottom).with.offset(14);
    }];
    [_detailDisCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.disCountLabel.mas_right).with.offset(12);
        make.centerY.equalTo(self.disCountLabel.mas_centerY);
    }];
    [_jumpImageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.disCountLabel.mas_centerY);
        make.right.equalTo(self.orderView).with.offset(-10);
    }];
    [_disCountButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.disCountLabel.mas_left);
        make.right.equalTo(self.jumpImageView3.mas_right);
        make.bottom.equalTo(self.detailDisCountLabel.mas_bottom);
        make.height.equalTo(self.detailDisCountLabel.mas_height);
    }];
//    [_pictureImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        <#code#>
//    }]
}
- (UIView *)addressView{
    if (_addressView == nil) {
        _addressView = [[UIView alloc]init];
        _addressView.layer.cornerRadius = 9;
        _addressView.backgroundColor = RGBColorHex(0xffffff);
    }
    return _addressView;
}
- (UILabel *)emptyAddressLabel{
    if (_emptyAddressLabel == nil) {
        _emptyAddressLabel = [[UILabel alloc]init];
        
        [_emptyAddressLabel setText:@"*请添加收货地址"];
//        [_emptyAddressLabel setFont:[UIFont systemFontOfSize:12]];
        [_emptyAddressLabel setFont:[UIFont boldSystemFontOfSize:12]];
        [_emptyAddressLabel setTextColor:RGBColorHex(0xe51c23)];
    }
    return _emptyAddressLabel;
}
- (UIImageView *)jumpImageView{
    if (_jumpImageView == nil) {
        _jumpImageView = [[UIImageView alloc]init];
        [_jumpImageView setImage:[UIImage imageNamed:@"arrow"]];
    }
    return _jumpImageView;
}
- (UIButton *)reviseButton{
    if (_reviseButton == nil) {
        _reviseButton = [[UIButton alloc]init];
        [_reviseButton addTarget:self action:@selector(selectAddress) forControlEvents:UIControlEventTouchUpInside];
    }
    return _reviseButton;
}
- (UIView *)orderView{
    if (_orderView == nil) {
        _orderView = [[UIView alloc]init];
        _orderView.layer.cornerRadius = 9;
        _orderView.backgroundColor = RGBColorHex(0xffffff);
    }
    return _orderView;
}
- (UILabel *)shopNameLabel{
    if (_shopNameLabel == nil) {
        _shopNameLabel = [[UILabel alloc]init];
        _shopNameLabel.font = [UIFont boldSystemFontOfSize:14];
        _shopNameLabel.textColor = RGBColorHex(0x333333);
        _shopNameLabel.text = [NSString stringWithFormat:@"ZF智丰自营旗舰店"];
    }
    return _shopNameLabel;
}
- (UIImageView *)jumpImageView2{
    if (_jumpImageView2 == nil) {
        _jumpImageView2 = [[UIImageView alloc]init];
        [_jumpImageView2 setImage:[UIImage imageNamed:@"arrow"]];
    }
    return _jumpImageView2;
}
- (UIButton *)shopButton{
    if (_shopButton == nil) {
        _shopButton = [[UIButton alloc]init];
        [_shopButton addTarget:self action:@selector(jumpShop) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shopButton;
}
- (UILabel *)disCountLabel{
    if (_disCountLabel == nil) {
        _disCountLabel = [[UILabel alloc]init];
        _disCountLabel.font = [UIFont systemFontOfSize:10];
        _disCountLabel.textColor = RGBColorHex(0xe51c23);
        _disCountLabel.text = [NSString stringWithFormat:@"满赠"];
    }
    return _disCountLabel;
}
- (UILabel *)detailDisCountLabel{
    if (_detailDisCountLabel == nil) {
        _detailDisCountLabel = [[UILabel alloc]init];
        _detailDisCountLabel.font = [UIFont systemFontOfSize:11];
        _detailDisCountLabel.textColor = RGBColorHex(0x4d4d4d);
        _detailDisCountLabel.text = [NSString stringWithFormat:@"已购物4500.00元，可领取赠品"];
    }
    return _detailDisCountLabel;
}
- (UIImageView *)jumpImageView3{
    if (_jumpImageView3 == nil) {
        _jumpImageView3 = [[UIImageView alloc]init];
        [_jumpImageView3 setImage:[UIImage imageNamed:@"arrow"]];
    }
    return _jumpImageView3;
}
- (UIButton *)disCountButton{
    if (_disCountButton == nil) {
        _disCountButton = [[UIButton alloc]init];
        [_disCountButton addTarget:self action:@selector(jumpDisCount) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _disCountButton;
}
#pragma mark --方法
//选择地址
- (void)selectAddress{
    ZFAddressManagementVC* vc = [[ZFAddressManagementVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
//跳转到店铺界面
- (void)jumpShop{
    
}
//领取赠品
- (void)jumpDisCount{
    
}
@end
