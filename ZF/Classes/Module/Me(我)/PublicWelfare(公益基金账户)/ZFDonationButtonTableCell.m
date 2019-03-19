//
//  ZFDonationButtonTableCell.m
//  ZF
//
//  Created by admin on 2019/3/19.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFDonationButtonTableCell.h"

@interface ZFDonationButtonTableCell()

@property (nonatomic, strong) UIButton* moneyButton;
@property (nonatomic, strong) UIButton* timeButton;
@property (nonatomic, strong) UIButton* numberButton;
@end

@implementation ZFDonationButtonTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setup];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setup
{
    self.contentView.backgroundColor = RGBColorHex(0xffffff);
    [self.contentView addSubview:self.moneyButton];
    [self.contentView addSubview:self.timeButton];
    [self.contentView addSubview:self.numberButton];
    
    [_moneyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.centerY.equalTo(self.contentView);
        make.width.mas_equalTo(125);
        make.height.mas_equalTo(60);
    }];
    
    [_timeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(self.contentView);
        make.width.mas_equalTo(125);
        make.height.mas_equalTo(60);
    }];
    
    [_numberButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.centerY.equalTo(self.contentView);
        make.width.mas_equalTo(125);
        make.height.mas_equalTo(60);
    }];
    
    
}

- (void)moneyButtonDidClick
{
    
}

- (void)timeButtonDidClick
{
    
}

- (void)numberButtonDidClick
{
    
}

- (UIButton *)moneyButton {
    if (_moneyButton == nil) {
        _moneyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_moneyButton setTitle:@"捐赠金额\n 1234" forState:UIControlStateNormal];
        [_moneyButton setTitleColor:RGBColorHex(0x333333) forState:UIControlStateNormal];
        _moneyButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_moneyButton addTarget:self action:@selector(moneyButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moneyButton;
}

- (UIButton *)timeButton {
    if (_timeButton == nil) {
        _timeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_timeButton setTitle:@"相当于\n 给留守儿童\n 讲睡前故事10天" forState:UIControlStateNormal];
        [_timeButton setTitleColor:RGBColorHex(0x333333) forState:UIControlStateNormal];
        _timeButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_timeButton addTarget:self action:@selector(timeButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _timeButton;
}

- (UIButton *)numberButton {
    if (_numberButton == nil) {
        _numberButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_numberButton setTitle:@"爱心次数（笔）\n 12" forState:UIControlStateNormal];
        [_numberButton setTitleColor:RGBColorHex(0x333333) forState:UIControlStateNormal];
        _numberButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_numberButton addTarget:self action:@selector(numberButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _numberButton;
}



@end
