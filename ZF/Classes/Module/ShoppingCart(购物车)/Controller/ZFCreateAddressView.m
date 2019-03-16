//
//  ZFCreateAddressView.m
//  ZF
//
//  Created by weiming zhang on 2019/3/16.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFCreateAddressView.h"

@implementation ZFCreateAddressView

- (void)setup{
    self.layer.cornerRadius = 10;
    self.backgroundColor = RGBColorHex(0xffffff);
    UIButton *back = [[UIButton alloc]init];
    [self addSubview:back];
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
    
    UITextField *name = [[UITextField alloc]init];
    [self addSubview:name];
//    name.placeholder = NSString stringWithFormat:@""
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
}
- (void)back{
    [self removeFromSuperview];
}
@end
