//
//  ZFStoreConcernViewCell.m
//  ZF
//
//  Created by admin on 2019/3/15.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFStoreConcernViewCell.h"
#import "UIImageView+WebCache.h"
#import "UIButton+LXMImagePosition.h"

@interface ZFStoreConcernViewCell()

@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UIButton* couponButton;
@property (nonatomic, strong) UIButton* promotionButton;
@property (nonatomic, strong) UIButton* priceButton;
@property (nonatomic, strong) UIButton* goShopButton;

@end

@implementation ZFStoreConcernViewCell

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
    [self.contentView addSubview:self.couponButton];
    [self.contentView addSubview:self.promotionButton];
    [self.contentView addSubview:self.priceButton];
    [self.contentView addSubview:self.goShopButton];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.equalTo(self.contentView);
        make.width.mas_equalTo(90);
        make.height.mas_equalTo(57);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(28);
        make.top.equalTo(self->_iconView.mas_top);
    }];
    
    [_couponButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(28);
        make.top.equalTo(self->_nameLabel.mas_bottom).offset(6);
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
    
    [_goShopButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-27);
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


- (void)goShopButtonDidClick
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

- (UIButton *)goShopButton {
    if (_goShopButton == nil) {
        _goShopButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_goShopButton setTitle:@"进入店铺" forState:UIControlStateNormal];
        [_goShopButton setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
        [_goShopButton setTitleColor:RGBColorHex(0x151515) forState:UIControlStateNormal];
        _goShopButton.titleLabel.font = [UIFont systemFontOfSize:10];
        [_goShopButton setImagePosition:LXMImagePositionRight spacing:3];
        [_goShopButton addTarget:self action:@selector(goShopButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _goShopButton;
}

- (void)setShopModel:(ZFShopModel *)shopModel{
    _shopModel = shopModel;
    _nameLabel.text = [NSString stringWithFormat:@"%@",_shopModel.seller_name];
    if (!kStringIsEmpty(_shopModel.avatar))
    {
//        NSString* str = [NSString stringWithFormat:@"%@%@",ImageUrl,_userInfo.head_pic];
        [_iconView sd_setImageWithURL:[NSURL URLWithString:_shopModel.avatar]];
    }
}

@end
