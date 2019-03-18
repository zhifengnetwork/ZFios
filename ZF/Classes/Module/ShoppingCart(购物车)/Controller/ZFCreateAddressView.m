//
//  ZFCreateAddressView.m
//  ZF
//
//  Created by weiming zhang on 2019/3/16.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFCreateAddressView.h"
#import "ZFAddressTextField.h"
#import "ZFBounceView.h"
@implementation ZFCreateAddressView

- (void)setup{
    
    self.layer.cornerRadius = 10;
    self.backgroundColor = RGBColorHex(0xffffff);
    UIButton *back = [[UIButton alloc]init];
    [self addSubview:back];
    back.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [back setImage:[UIImage imageNamed:@"Back"] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *newAdress = [[UILabel alloc]init];
    [self addSubview:newAdress];
    newAdress.font = [UIFont fontWithName:@"PingFang-SC-Bold" size:17];
    newAdress.text= [NSString stringWithFormat:@"新建地址"];
    newAdress.textColor = RGBColorHex(0x0f0f0f);
    
    UIView *lineview = [[UIView alloc]init];
    [self addSubview:lineview];
    lineview.backgroundColor = RGBColorHex(0xf5f5f5);
    
    ZFAddressTextField *name = [[ZFAddressTextField alloc]init];
    [self addSubview:name];
    name.placeholder = [NSString stringWithFormat:@"收货人姓名(请使用真实姓名)"];
    
    ZFAddressTextField *phoneNumber = [[ZFAddressTextField alloc]init];
    [self addSubview:phoneNumber];
    phoneNumber.placeholder = [NSString stringWithFormat:@"手机号码"];
    
    ZFAddressTextField *address = [[ZFAddressTextField alloc]init];
    [self addSubview:address];
    address.placeholder = [NSString stringWithFormat:@"所在地区"];
    
    ZFAddressTextField *detailaddress = [[ZFAddressTextField alloc]init];
    [self addSubview:detailaddress];
    detailaddress.placeholder = [NSString stringWithFormat:@"街道、小区门牌等详细地址"];
    
    UIButton *selectBtn = [[UIButton alloc]init];
    [self addSubview:selectBtn];
    [selectBtn setImage:[UIImage imageNamed:@"option_b"] forState:UIControlStateNormal];
    [selectBtn setImage:[UIImage imageNamed:@"option_s"] forState:UIControlStateSelected];
    
    UILabel *label = [[UILabel alloc]init];
    [self addSubview:label];
    label.text = [NSString stringWithFormat:@"设为默认地址"];
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = RGBColorHex(0x141414);
    
    UIButton *addAddress = [[UIButton alloc]init];
    [self addSubview:addAddress];
    addAddress.titleLabel.textColor = RGBColorHex(0xffffff);
    addAddress.titleLabel.font = [UIFont systemFontOfSize:17];
    addAddress.titleLabel.text = [NSString stringWithFormat:@"添加地址"];
    [addAddress setBackgroundImage:[UIImage imageNamed:@"submit"] forState:UIControlStateNormal];
    
#pragma mark --约束
    [back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).with.offset(16);
        make.top.mas_equalTo(self).with.offset(15);
        make.width.height.mas_equalTo(15);
    }];
    [newAdress mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(back.mas_centerY);
        make.centerX.equalTo(self);
    }];
    [lineview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(back.mas_bottom).with.offset(15);
        make.left.mas_equalTo(self).with.offset(16);
        make.right.mas_equalTo(self).with.offset(-16);
        make.height.mas_equalTo(1);
        
    }];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineview.mas_bottom).with.offset(15);
        make.left.mas_equalTo(self).with.offset(16);
        make.right.mas_equalTo(self).with.offset(-16);
        make.height.mas_equalTo(45);
    }];
    [phoneNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(name.mas_bottom).with.offset(15);
        make.left.mas_equalTo(self).with.offset(16);
        make.right.mas_equalTo(self).with.offset(-16);
        make.height.mas_equalTo(45);
    }];
    [address mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(phoneNumber.mas_bottom).with.offset(15);
        make.left.mas_equalTo(self).with.offset(16);
        make.right.mas_equalTo(self).with.offset(-16);
        make.height.mas_equalTo(45);
    }];
    [detailaddress mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(address.mas_bottom).with.offset(15);
        make.left.mas_equalTo(self).with.offset(16);
        make.right.mas_equalTo(self).with.offset(-16);
        make.height.mas_equalTo(45);
    }];
    [selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).with.offset(16);
        make.top.mas_equalTo(detailaddress.mas_bottom).with.offset(20);
    }];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(selectBtn.mas_right).with.offset(12);
        make.centerY.equalTo(selectBtn.mas_centerY);
    }];
    [addAddress mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.mas_equalTo(49);
    }];
}
- (void)back{
    [self removeFromSuperview];
    
}
@end
