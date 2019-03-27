//
//  ZFMyWalletView.m
//  ZF
//
//  Created by weiming zhang on 2019/3/21.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFMyWalletView.h"

@implementation ZFMyWalletView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)awakeFromNib{
    [super awakeFromNib];
    [self setup];
}
- (void)setup{
    self.backgroundColor = RGBColorHex(0xffffff);
    self.layer.cornerRadius = 10;
    UILabel *titleLabel = [[UILabel alloc]init];
    [titleLabel setText:@"金库总额"];
    [titleLabel setFont:[UIFont systemFontOfSize:16]];
    [titleLabel setTextColor:RGBColorHex(0x000000)];
    [self addSubview:titleLabel];
    UILabel *balanceLabel = [[UILabel alloc]init];
    [balanceLabel setText:@"30000"];
    [balanceLabel setFont:[UIFont boldSystemFontOfSize:22]];
    [balanceLabel setTextColor:RGBColorHex(0xff5600)];
    [self addSubview:balanceLabel];
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = RGBColorHex(0xf5f5f5);
    [self addSubview:lineView];
    UIButton *integrationBtn = [[UIButton alloc]init];
    [integrationBtn setImage:[UIImage imageNamed:@"integration"] forState:UIControlStateNormal];
    [integrationBtn setTitle:@"积分" forState:UIControlStateNormal];
    [integrationBtn.titleLabel setFont:[UIFont systemFontOfSize:17]];
    [integrationBtn setTitleColor:RGBColorHex(0xd81e06) forState:UIControlStateNormal];
    [integrationBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 5)];
    [self addSubview:integrationBtn];
    UILabel *integralLabel = [[UILabel alloc]init];
    [integralLabel setFont:[UIFont systemFontOfSize:15]];
    [integralLabel setTextColor:RGBColorHex(0x0f0f0f)];
    [integralLabel setText:@"36200分"];
    [self addSubview:integralLabel];
    
    UIButton *preferentialBtn = [[UIButton alloc]init];
    [preferentialBtn setImage:[UIImage imageNamed:@"preferential"] forState:UIControlStateNormal];
    [preferentialBtn setTitle:@"优惠券" forState:UIControlStateNormal];
    [preferentialBtn.titleLabel setFont:[UIFont systemFontOfSize:17]];
    [preferentialBtn setTitleColor:RGBColorHex(0xd81e06) forState:UIControlStateNormal];
    [preferentialBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 5)];
    [self addSubview:preferentialBtn];
    UILabel *preferentialLabel = [[UILabel alloc]init];
    [preferentialLabel setFont:[UIFont systemFontOfSize:15]];
    [preferentialLabel setTextColor:RGBColorHex(0x0f0f0f)];
    [preferentialLabel setText:@"3张"];
    [self addSubview:preferentialLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(15);
        make.centerX.equalTo(self.mas_centerX);
    }];
    [balanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).with.offset(15);
        make.centerX.equalTo(self.mas_centerX);
    }];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(balanceLabel.mas_bottom).with.offset(15);
        make.left.equalTo(self).with.offset(20);
        make.right.equalTo(self).with.offset(-20);
        make.height.mas_equalTo(1);
    }];
    [integrationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).with.offset(15);
        make.left.equalTo(self).with.offset(44);
    }];
    [integralLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(integrationBtn.mas_right).with.offset(6);
        make.centerY.equalTo(integrationBtn.mas_centerY);
    }];
    [preferentialBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).with.offset(15);
        make.left.equalTo(integralLabel.mas_right).with.offset(24);
    }];
    [preferentialLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(preferentialBtn.mas_right).with.offset(6);
        make.centerY.equalTo(integrationBtn.mas_centerY);
    }];
    
}

@end
