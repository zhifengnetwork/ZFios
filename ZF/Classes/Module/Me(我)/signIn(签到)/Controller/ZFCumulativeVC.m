//
//  ZFCumulativeVC.m
//  LK
//
//  Created by juchuangweiye on 2018/9/21.
//  Copyright © 2018年 LKQN. All rights reserved.
//

#import "ZFCumulativeVC.h"
#import "UIImageView+WebCache.h"
#import "UIButton+LXMImagePosition.h"
#import "SVProgressHUD.h"


@interface ZFCumulativeVC ()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UIButton *signButton;
@property (nonatomic, strong) UILabel *integralLabel;
@property (nonatomic, strong) UILabel *dayLabel;
@property (nonatomic, strong) UILabel *totalDayLabel;


@end

@implementation ZFCumulativeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setup
{
    self.view.backgroundColor = RGBColorHex(0xf3f5f7);
    
    [self.view addSubview:self.iconView];
    [self.view addSubview:self.signButton];
    [self.view addSubview:self.integralLabel];
    [self.view addSubview:self.dayLabel];
    [self.view addSubview:self.totalDayLabel];
    
    self.title = @"累计积分";
    
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(215);
    }];
    
    [_signButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_iconView.mas_top).offset(16);
        make.centerX.equalTo(self->_iconView);
        make.width.mas_equalTo(152);
        make.height.mas_equalTo(41);
    }];
    
    [_integralLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_signButton.mas_bottom).offset(15);
        make.centerX.equalTo(self->_iconView);
    }];
    
    [_dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_integralLabel.mas_bottom).offset(20);
        make.centerX.equalTo(self->_iconView);
    }];
    
    [_totalDayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_dayLabel.mas_bottom).offset(5);
        make.centerX.equalTo(self->_iconView);
    }];
    
//    _bankLabel.text = [_bank bankName];
//    _numberLabel.text = [_bank bankNumber];
    
//    [_smallView sd_setImageWithURL:[NSURL URLWithString:_bank.dict_url]];
//    _iconView.image = [UIImage imageNamed:[NSString stringWithFormat:@"icon_bank%lu",(unsigned long)_bank.dict_colour]];
    
}


- (void)signButtonDidClick
{
    
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"image"];
    }
    return _iconView;
}


- (UIButton *)signButton {
    if (_signButton == nil) {
        _signButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_signButton setTitle:@"已签到" forState:UIControlStateNormal];
        [_signButton setImage:[UIImage imageNamed:@"qiandao"] forState:UIControlStateNormal];
        [_signButton setTitleColor:RGBColorHex(0xffffff) forState:UIControlStateNormal];
        _signButton.titleLabel.font = [UIFont systemFontOfSize:18];
        [_signButton setImagePosition:LXMImagePositionLeft spacing:3];
        _signButton.layer.borderWidth = 1.0f;
        _signButton.layer.borderColor = RGBColorHex(0xffffff).CGColor;
        _signButton.layer.cornerRadius = 20;
        _signButton.clipsToBounds = YES;
        [_signButton addTarget:self action:@selector(signButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _signButton;
}

- (UILabel *)integralLabel {
    if (_integralLabel == nil) {
        _integralLabel = [[UILabel alloc] init];
        _integralLabel.textColor = RGBColorHex(0xffffff);
        _integralLabel.font = [UIFont systemFontOfSize:13];
        [_integralLabel sizeToFit];
        _integralLabel.text = @"+2积分";
    }
    return _integralLabel;
}

- (UILabel *)dayLabel {
    if (_dayLabel == nil) {
        _dayLabel = [[UILabel alloc] init];
        _dayLabel.textColor = RGBColorHex(0xffffff);
        _dayLabel.font = [UIFont systemFontOfSize:13];
        [_dayLabel sizeToFit];
        _dayLabel.text = @"已连续签到：3天";
    }
    return _dayLabel;
}

- (UILabel *)totalDayLabel {
    if (_totalDayLabel == nil) {
        _totalDayLabel = [[UILabel alloc] init];
        _totalDayLabel.textColor = RGBColorHex(0xffffff);
        _totalDayLabel.font = [UIFont systemFontOfSize:14];
        [_totalDayLabel sizeToFit];
        _totalDayLabel.text = @"积累签到：22天";
    }
    return _totalDayLabel;
}


@end
