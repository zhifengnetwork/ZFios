//
//  ZFFavoriteShopViewCell.m
//  ZF
//
//  Created by admin on 2019/3/15.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFFavoriteShopViewCell.h"
#import "UIImageView+WebCache.h"
#import "UIButton+LXMImagePosition.h"

@interface ZFFavoriteShopViewCell()

@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* numberFansLabel;
@property (nonatomic, strong) UIButton* couponButton;
@property (nonatomic, strong) UIButton* promotionButton;
@property (nonatomic, strong) UIButton* priceButton;
@property (nonatomic, strong) UIButton* goShopsButton;

@end

@implementation ZFFavoriteShopViewCell

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
    self.contentView.backgroundColor = RGBColorHex(0xffffff);
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.numberFansLabel];
    [self.contentView addSubview:self.couponButton];
    [self.contentView addSubview:self.promotionButton];
    [self.contentView addSubview:self.priceButton];
    [self.contentView addSubview:self.goShopsButton];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo(50);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(11);
        make.top.equalTo(self->_iconView.mas_top);
    }];
    
    [_numberFansLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(11);
        make.centerY.equalTo(self->_iconView);
    }];
    
    [_couponButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(11);
        make.top.equalTo(self->_numberFansLabel.mas_bottom).offset(6);
        make.width.mas_equalTo(23);
        make.height.mas_equalTo(13);
    }];
    
    [_promotionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_couponButton.mas_right).offset(5);
        make.centerY.equalTo(self->_couponButton);
        make.width.mas_equalTo(23);
        make.height.mas_equalTo(13);
    }];
    
    [_priceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_promotionButton.mas_right).offset(5);
        make.centerY.equalTo(self->_promotionButton);
        make.width.mas_equalTo(23);
        make.height.mas_equalTo(13);
    }];
    
    [_goShopsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-31);
        make.width.mas_equalTo(65);
        make.height.mas_equalTo(22);
        make.centerY.equalTo(self.contentView);
    }];
    
}

-(void)couponButtonDidClick
{
    
}

-(void)promotionButtonDidClick
{
    
}

-(void)priceButtonDidClick
{
    
}


- (void)goShopsButtonDidClick
{
    
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"image"];
        _iconView.clipsToBounds = YES;
        _iconView.layer.cornerRadius = 3.0f;
    }
    return _iconView;
}

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColorHex(0x151515);
        _nameLabel.font = [UIFont systemFontOfSize:15];
        _nameLabel.numberOfLines = 0;
        _nameLabel.text = @"韩都衣舍";
    }
    return _nameLabel;
}

- (UILabel *)numberFansLabel {
    if (_numberFansLabel == nil) {
        _numberFansLabel = [[UILabel alloc] init];
        _numberFansLabel.textColor = RGBColorHex(0xf72c0b);
        _numberFansLabel.font = [UIFont systemFontOfSize:12];
        _numberFansLabel.numberOfLines = 0;
        _numberFansLabel.text = @"200万粉丝";
    }
    return _numberFansLabel;
}

- (UIButton *)couponButton {
    if (_couponButton == nil) {
        _couponButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_couponButton setTitle:@"有券" forState:UIControlStateNormal];
        [_couponButton setTitleColor:RGBColorHex(0xf72c0b) forState:UIControlStateNormal];
        _couponButton.titleLabel.font = [UIFont systemFontOfSize:10];
        _couponButton.layer.borderWidth = 1.0f;
        _couponButton.layer.borderColor = RGBColorHex(0xf72c0b).CGColor;
        [_couponButton addTarget:self action:@selector(couponButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _couponButton;
}

- (UIButton *)promotionButton {
    if (_promotionButton == nil) {
        _promotionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_promotionButton setTitle:@"促销" forState:UIControlStateNormal];
        [_promotionButton setTitleColor:RGBColorHex(0xf72c0b) forState:UIControlStateNormal];
        _promotionButton.titleLabel.font = [UIFont systemFontOfSize:10];
        _promotionButton.layer.borderWidth = 1.0f;
        _promotionButton.layer.borderColor = RGBColorHex(0xf72c0b).CGColor;
        [_promotionButton addTarget:self action:@selector(promotionButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _promotionButton;
}


- (UIButton *)priceButton {
    if (_priceButton == nil) {
        _priceButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_priceButton setTitle:@"降价" forState:UIControlStateNormal];
        [_priceButton setTitleColor:RGBColorHex(0xf72c0b) forState:UIControlStateNormal];
        _priceButton.titleLabel.font = [UIFont systemFontOfSize:10];
        _priceButton.layer.borderWidth = 1.0f;
        _priceButton.layer.borderColor = RGBColorHex(0xf72c0b).CGColor;
        [_priceButton addTarget:self action:@selector(priceButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _priceButton;
}

- (UIButton *)goShopsButton {
    if (_goShopsButton == nil) {
        _goShopsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_goShopsButton setTitle:@"进入店铺" forState:UIControlStateNormal];
        [_goShopsButton setTitleColor:RGBColorHex(0xf72c0b) forState:UIControlStateNormal];
        _goShopsButton.titleLabel.font = [UIFont systemFontOfSize:12];
        _goShopsButton.layer.borderWidth = 1.0f;
        _goShopsButton.layer.borderColor = RGBColorHex(0xffe5e3).CGColor;
        _goShopsButton.layer.cornerRadius = 11;
        _goShopsButton.clipsToBounds = YES;
        [_goShopsButton addTarget:self action:@selector(goShopsButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _goShopsButton;
}

@end
