//
//  ZFConfirmOrderVC.m
//  ZF
//
//  Created by weiming zhang on 2019/3/26.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFConfirmOrderVC.h"
#import "ZFAddressManagementVC.h"
#import "ZFXuXianView.h"
#import "ZFOrderView.h"
#import "ZFExpressView.h"
#import "ZFSelectPayView.h"
#import "TYAlertController.h"
@interface ZFConfirmOrderVC ()
//收货地址
@property (nonatomic, strong)UIView *addressView;
@property (nonatomic, strong)UILabel *emptyAddressLabel;
@property (nonatomic, strong)UIImageView *jumpImageView;
@property (nonatomic, strong)UIButton *reviseButton;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *phoneNumberLabel;
@property (nonatomic, strong)UILabel *addressLabel;
//商品信息
@property (nonatomic, strong)ZFOrderView *orderView;
//订单信息
@property (nonatomic, strong)ZFExpressView *expressView;
@property (nonatomic, strong)UILabel *totalLabel;
@property (nonatomic, strong)UILabel *priceLabel;
@property (nonatomic, strong)UIButton *submitButton;
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
    self.view.backgroundColor = RGBColorHex(0xf4f4f4);
    //添加view里面的控件
    [self.view addSubview:self.addressView];
    [self.addressView addSubview:self.emptyAddressLabel];
    [self.addressView addSubview:self.jumpImageView];
    [self.addressView addSubview:self.reviseButton];
    [self.addressView addSubview:self.nameLabel];
    [self.addressView addSubview:self.phoneNumberLabel];
    [self.addressView addSubview:self.addressLabel];
    [self.view addSubview:self.orderView];
    [self.view addSubview:self.expressView];
    [self.view addSubview:self.totalLabel];
    [self.view addSubview:self.priceLabel];
    [self.view addSubview:self.submitButton];
    [_addressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(20);
        make.left.equalTo(self.view).with.offset(16);
        make.right.equalTo(self.view).with.offset(-16);
        make.height.mas_equalTo(77);
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
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.addressView).with.offset(10);
        make.top.equalTo(self.addressView).with.offset(17);
    }];
    [_phoneNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_right).with.offset(15);
        make.top.equalTo(self.addressView).with.offset(17);
    }];
    [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.addressView).with.offset(10);
        make.top.equalTo(self.nameLabel.mas_bottom).with.offset(12);
        make.bottom.equalTo(self.addressView).with.offset(-15);
    }];
    [_orderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.addressView.mas_bottom).with.offset(20);
        make.left.equalTo(self.view).with.offset(16);
        make.right.equalTo(self.view).with.offset(-16);
        make.height.mas_equalTo(199);
    }];
    [_expressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.orderView.mas_bottom).with.offset(20);
        make.left.equalTo(self.view).with.offset(16);
        make.right.equalTo(self.view).with.offset(-16);
        make.height.mas_equalTo(130);
    }];
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.expressView.mas_bottom).with.offset(20);
        make.right.equalTo(self.view).with.offset(-26);
    }];
    [_totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.priceLabel.mas_left);
        make.top.equalTo(self.expressView.mas_bottom).with.offset(20);
    }];
    [_submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.mas_equalTo(44);
    }];
    
    if (/* DISABLES CODE */ (1)) {
        self.emptyAddressLabel.hidden = YES;
    }else{
        self.nameLabel.hidden = YES;
        self.phoneNumberLabel.hidden = YES;
        self.addressLabel.hidden = YES;
    }
    if (self.emptyAddressLabel.hidden == NO) {
        self.submitButton.enabled = NO;
        [self.submitButton setBackgroundImage:nil forState:UIControlStateNormal];
        [self.submitButton setBackgroundColor:RGBColorHex(0xe6e6e6)];
    }else{
        self.submitButton.enabled = YES;
        [self.submitButton setBackgroundImage:[UIImage imageNamed:@"submit"] forState:UIControlStateNormal];
    }
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
- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = [UIFont boldSystemFontOfSize:15];
        _nameLabel.textColor = RGBColorHex(0x0f0f0f);
        _nameLabel.text = @"张**";
    }
    return _nameLabel;
}
- (UILabel *)phoneNumberLabel{
    if (_phoneNumberLabel == nil) {
        _phoneNumberLabel = [[UILabel alloc]init];
        _phoneNumberLabel.font = [UIFont boldSystemFontOfSize:15];
        _phoneNumberLabel.textColor = RGBColorHex(0x0f0f0f);
        _phoneNumberLabel.text = @"186****0486";
    }
    return _phoneNumberLabel;
}
- (UILabel *)addressLabel{
    if (_addressLabel == nil) {
        _addressLabel = [[UILabel alloc]init];
        _addressLabel.font = [UIFont systemFontOfSize:12];
        _addressLabel.textColor = RGBColorHex(0x424242);
        _addressLabel.text = @"广东省广州市白云区";
    }
    return _addressLabel;
}
- (UIView *)orderView{
    if (_orderView == nil) {
        _orderView = [[ZFOrderView alloc]init];
        _orderView.layer.cornerRadius = 9;
        _orderView.backgroundColor = RGBColorHex(0xffffff);
    }
    return _orderView;
}
- (ZFExpressView *)expressView{
    if (_expressView == nil) {
        _expressView = [[ZFExpressView alloc]init];
        _expressView.layer.cornerRadius = 9;
        _expressView.backgroundColor = RGBColorHex(0xffffff);
    }
    return _expressView;
}
- (UILabel *)priceLabel{
    if (_priceLabel == nil) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.font = [UIFont systemFontOfSize:15];
        _priceLabel.textColor = RGBColorHex(0xf05050);
        _priceLabel.text = @"￥4900.00";
    }
    return _priceLabel;
}
- (UILabel *)totalLabel{
    if (_totalLabel == nil) {
        _totalLabel = [[UILabel alloc]init];
        _totalLabel.font = [UIFont systemFontOfSize:15];
        _totalLabel.textColor = RGBColorHex(0x0f0f0f);
        _totalLabel.text = @"合计:";
    }
    return _totalLabel;
}
- (UIButton *)submitButton{
    if (_submitButton == nil) {
        _submitButton = [[UIButton alloc]init];
        [_submitButton setTitle:@"确认订单" forState:UIControlStateNormal];
        [_submitButton setTitleColor:RGBColorHex(0xffffff) forState:UIControlStateNormal];
        _submitButton.titleLabel.font = [UIFont systemFontOfSize:17];
        [_submitButton addTarget:self action:@selector(submitClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _submitButton;
}
#pragma mark --方法
//选择地址
- (void)selectAddress{
    ZFAddressManagementVC* vc = [[ZFAddressManagementVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
//提交订单，调到选择支付方式页面
- (void)submitClick{
    if (self.submitButton.enabled ) {
        ZFSelectPayView *payView = [[ZFSelectPayView alloc]initWithFrame:CGRectMake(0, LL_ScreenHeight - 367, LL_ScreenWidth, 367)];
        TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:payView preferredStyle:TYAlertControllerStyleActionSheet];
        alertController.backgoundTapDismissEnable = YES;
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
}
@end
