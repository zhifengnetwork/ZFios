//
//  ZFDistributionMemTableCell.m
//  ZF
//
//  Created by admin on 2019/3/16.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFDistributionMemTableCell.h"
#import "UIButton+LXMImagePosition.h"

@interface ZFDistributionMemTableCell()

@property (nonatomic, strong) UIButton *upgradeButton;
@property (nonatomic, strong) UIButton *commodityButton;
@property (nonatomic, strong) UIButton *recommendButton;
@property (nonatomic, strong) UIButton *accountButton;

@end

@implementation ZFDistributionMemTableCell

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
    [self.contentView addSubview:self.upgradeButton];
    [self.contentView addSubview:self.commodityButton];
    [self.contentView addSubview:self.recommendButton];
    [self.contentView addSubview:self.accountButton];
    
    [_upgradeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo(76);
    }];
    
    [_commodityButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_upgradeButton.mas_right).offset(12);
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo(76);
    }];
    
    [_recommendButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_commodityButton.mas_right).offset(12);
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo(76);
    }];
    
    [_accountButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_recommendButton.mas_right).offset(12);
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo(76);
    }];
    
}

- (void)upgradeButtonDidClick
{
    
}


- (void)commodityButtonDidClick
{
    
}

- (void)recommendButtonDidClick
{
    
}

- (void)accountButtonDidClick
{
    
}


- (UIButton *)upgradeButton {
    if (_upgradeButton == nil) {
        _upgradeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_upgradeButton setTitle:@"升级会员" forState:UIControlStateNormal];
        [_upgradeButton setTitleColor:RGBColorHex(0x333333) forState:UIControlStateNormal];
        _upgradeButton.titleLabel.font = [UIFont systemFontOfSize:12];
        _upgradeButton.backgroundColor = RGBColorHex(0xf3f5f7);
         [_upgradeButton setImagePosition:LXMImagePositionTop spacing:11];
        [_upgradeButton addTarget:self action:@selector(upgradeButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _upgradeButton;
}

- (UIButton *)commodityButton {
    if (_commodityButton == nil) {
        _commodityButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_commodityButton setTitle:@"分润商品" forState:UIControlStateNormal];
        [_commodityButton setTitleColor:RGBColorHex(0x333333) forState:UIControlStateNormal];
        _commodityButton.titleLabel.font = [UIFont systemFontOfSize:12];
        _commodityButton.backgroundColor = RGBColorHex(0xf3f5f7);
        [_commodityButton setImagePosition:LXMImagePositionTop spacing:11];
        [_commodityButton addTarget:self action:@selector(commodityButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _upgradeButton;
}

- (UIButton *)recommendButton {
    if (_recommendButton == nil) {
        _recommendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_recommendButton setTitle:@"推荐会员" forState:UIControlStateNormal];
        [_recommendButton setTitleColor:RGBColorHex(0x333333) forState:UIControlStateNormal];
        _recommendButton.titleLabel.font = [UIFont systemFontOfSize:12];
        _recommendButton.backgroundColor = RGBColorHex(0xf3f5f7);
        [_recommendButton setImagePosition:LXMImagePositionTop spacing:11];
        [_recommendButton addTarget:self action:@selector(recommendButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _recommendButton;
}

- (UIButton *)accountButton {
    if (_accountButton == nil) {
        _accountButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_accountButton setTitle:@"账户管理" forState:UIControlStateNormal];
        [_accountButton setTitleColor:RGBColorHex(0x333333) forState:UIControlStateNormal];
        _accountButton.titleLabel.font = [UIFont systemFontOfSize:12];
        _accountButton.backgroundColor = RGBColorHex(0xf3f5f7);
        [_accountButton setImagePosition:LXMImagePositionTop spacing:11];
        [_accountButton addTarget:self action:@selector(accountButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _accountButton;
}


@end
