//
//  ZFMyIntegralHeadTableCell.m
//  ZF
//
//  Created by admin on 2019/3/19.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFMyIntegralHeadTableCell.h"

@interface ZFMyIntegralHeadTableCell()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *numberLabel;
@property (nonatomic, strong) UIButton *integralButton;

@end

@implementation ZFMyIntegralHeadTableCell

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
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.numberLabel];
    [self.contentView addSubview:self.integralButton];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.contentView);
        make.height.mas_equalTo(180);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_iconView.mas_top).offset(18);
        make.centerX.equalTo(self->_iconView);
    }];
    
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_nameLabel.mas_bottom).offset(9);
        make.centerX.equalTo(self->_iconView);
    }];
    
    [_integralButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_numberLabel.mas_bottom).offset(45);
        make.centerX.equalTo(self->_iconView);
        make.width.mas_equalTo(180);
        make.height.mas_equalTo(30);
    }];
    
}

- (void)integralButtonDidClick
{
    
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"jianbian"];
    }
    return _iconView;
}

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColorHex(0xffffff);
        _nameLabel.font = [UIFont systemFontOfSize:17];
        _nameLabel.text = @"我的积分";
    }
    return _nameLabel;
}


- (UILabel *)numberLabel {
    if (_numberLabel == nil) {
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.textColor = RGBColorHex(0xffffff);
        _numberLabel.font = [UIFont systemFontOfSize:17];
        _numberLabel.text = @"1234";
    }
    return _numberLabel;
}

- (UIButton *)integralButton {
    if (_integralButton == nil) {
        _integralButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_integralButton setTitle:@"200积分换面膜卷" forState:UIControlStateNormal];
        [_integralButton setTitleColor:RGBColorHex(0xffffff) forState:UIControlStateNormal];
        _integralButton.titleLabel.font = [UIFont systemFontOfSize:14];
        _integralButton.layer.borderWidth = 1.0f;
        _integralButton.layer.borderColor = RGBColorHex(0xffffff).CGColor;
        _integralButton.layer.cornerRadius = 15;
        _integralButton.clipsToBounds = YES;
        [_integralButton addTarget:self action:@selector(integralButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _integralButton;
}


@end
