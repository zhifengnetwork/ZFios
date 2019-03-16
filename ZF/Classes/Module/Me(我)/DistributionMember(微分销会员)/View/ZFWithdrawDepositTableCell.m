//
//  ZFWithdrawDepositTableCell.m
//  ZF
//
//  Created by admin on 2019/3/16.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFWithdrawDepositTableCell.h"

@interface ZFWithdrawDepositTableCell()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel* moneyLabel;
@property (nonatomic, strong) UIButton *distrButton;

@end

@implementation ZFWithdrawDepositTableCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.contentView.backgroundColor = TableViewBGColor;
    [self.contentView addSubview:self.bgView];
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.distrButton];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(10);
        make.bottom.mas_equalTo(0);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(55);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_distrButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-55);
        make.centerY.equalTo(self.contentView);
    }];
    
    //竖线
    UIView *hLineView = [[UIView alloc] init];
    hLineView.backgroundColor = RGBColorHex(0xcccccc);
    [self.contentView addSubview:hLineView];
    
    [hLineView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.centerX.centerY.equalTo(self.contentView);
         make.width.mas_equalTo(0.5f);
         make.height.mas_equalTo(40.0f);
     }];
    
    
}

- (void)distrButtonDidClick
{
    
}


- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = RGBColorHex(0x333333);
        _moneyLabel.font = [UIFont systemFontOfSize:12];
        _moneyLabel.text = @"账户余额¥670元";
    }
    return _moneyLabel;
}

- (UIButton *)distrButton {
    if (_distrButton == nil) {
        _distrButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_distrButton setTitle:@"提现" forState:UIControlStateNormal];
        [_distrButton setTitleColor:RGBColorHex(0x333333) forState:UIControlStateNormal];
        _distrButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_distrButton setBackgroundImage:[UIImage imageNamed:@"anniu"] forState:UIControlStateNormal];
        _distrButton.layer.cornerRadius = 13;
        _distrButton.clipsToBounds = YES;
        [_distrButton addTarget:self action:@selector(distrButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _distrButton;
}

-(UIView *)bgView
{
    if(_bgView==nil)
    {
        _bgView = [[UIView alloc]initWithFrame:CGRectZero];
        _bgView.backgroundColor = [UIColor whiteColor];
        _bgView.clipsToBounds = YES;
        _bgView.layer.cornerRadius = 13.0f;
    }
    return _bgView;
}

@end
