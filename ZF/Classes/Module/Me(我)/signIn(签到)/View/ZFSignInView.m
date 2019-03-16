//
//  ZFSignInView.m
//  LK
//
//  Created by juchuangweiye on 2018/8/27.
//  Copyright © 2018年 LKQN. All rights reserved.
//

#import "ZFSignInView.h"
#import "TYShowAlertView.h"
#import "UIView+TYAlertView.h"
#import "UIButton+LXMImagePosition.h"

@interface ZFSignInView()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UIImageView* backView;
@property (nonatomic, strong) UIButton* deleteButton;
@property (nonatomic, strong) UILabel *scoreLabel;
@property (nonatomic, strong) UILabel *dayLabel;
@property (nonatomic, strong) UILabel *succeedLabel;
@property (nonatomic, strong) UILabel *integralLabel;

@end

@implementation ZFSignInView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.backgroundColor = [UIColor clearColor];
    self.layer.cornerRadius = 10.0f;
    
    [self addSubview:self.backView];
    [self addSubview:self.deleteButton];
    [self addSubview:self.scoreLabel];
    [self addSubview:self.dayLabel];
    [self addSubview:self.succeedLabel];
    [self addSubview:self.integralLabel];
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(330);
        make.height.mas_equalTo(317);
    }];
    
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self);
    }];
    
    [_deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.bottom.equalTo(self->_backView.mas_top).offset(30);
    }];
    
    [_scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_backView.mas_top).offset(88);
        make.centerX.equalTo(self);
    }];
    
    [_dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_scoreLabel.mas_bottom).offset(9);
        make.centerX.equalTo(self);
    }];
    
    [_succeedLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_dayLabel.mas_bottom).offset(30);
        make.centerX.equalTo(self);
    }];
    
    [_integralLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_succeedLabel.mas_bottom).offset(30);
        make.centerX.equalTo(self);
    }];
    
    
}


- (void)deleteButtonDidClick:(UIButton *)sender
{
    [self hideView];
}


- (UIImageView *)backView {
    if (_backView == nil) {
        _backView = [[UIImageView alloc] init];
        _backView.image = [UIImage imageNamed:@"bak_image"];
        _backView.clipsToBounds = YES;
    }
    return _backView;
}

- (UIButton *)deleteButton {
    if (_deleteButton == nil) {
        _deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deleteButton setImage:[UIImage imageNamed:@"cuowu"] forState:UIControlStateNormal];
        [_deleteButton addTarget:self action:@selector(deleteButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteButton;
}


- (UILabel *)scoreLabel {
    if (_scoreLabel == nil) {
        _scoreLabel = [[UILabel alloc] init];
        _scoreLabel.textColor = RGBColorHex(0xe51c23);
        _scoreLabel.font = [UIFont systemFontOfSize:16];
        _scoreLabel.text = @"总积分：1342";
    }
    return _scoreLabel;
}

- (UILabel *)dayLabel {
    if (_dayLabel == nil) {
        _dayLabel = [[UILabel alloc] init];
        _dayLabel.textColor = RGBColorHex(0xe51c23);
        _dayLabel.font = [UIFont systemFontOfSize:12];
        _dayLabel.text = @"已经连续签到257天";
    }
    return _dayLabel;
}

- (UILabel *)succeedLabel {
    if (_succeedLabel == nil) {
        _succeedLabel = [[UILabel alloc] init];
        _succeedLabel.textColor = RGBColorHex(0xffffff);
        _succeedLabel.font = [UIFont systemFontOfSize:17];
        _succeedLabel.text = @"今日签到成功";
    }
    return _succeedLabel;
}

- (UILabel *)integralLabel {
    if (_integralLabel == nil) {
        _integralLabel = [[UILabel alloc] init];
        _integralLabel.textColor = RGBColorHex(0xe51c23);
        _integralLabel.font = [UIFont systemFontOfSize:17];
        _integralLabel.text = @"+10积分";
    }
    return _integralLabel;
}


@end
