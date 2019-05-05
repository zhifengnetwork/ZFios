//
//  ZFMyHeadView.m
//  ZF
//
//  Created by apple on 2019/3/8.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFMyHeadView.h"
#import "UIImageView+WebCache.h"


@interface ZFMyHeadView()

@property (nonatomic, strong) UIImageView* bjIconView;
@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* memberLabel;
@property (nonatomic, strong) UIButton* signInButton;
@property (nonatomic, strong) UILabel* giftLabel;
@property (nonatomic, strong) UIButton* commodityButton;
@property (nonatomic, strong) UIButton* shopButton;
@property (nonatomic, strong) UIButton* footprintButton;

@end

@implementation ZFMyHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupUI];
    }
    return self;
}


- (void)setupUI
{
    [self addSubview:self.bjIconView];
    [self addSubview:self.iconView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.memberLabel];
    [self addSubview:self.signInButton];
    [self addSubview:self.giftLabel];
    [self addSubview:self.commodityButton];
    [self addSubview:self.shopButton];
    [self addSubview:self.footprintButton];
    
    [_bjIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bjIconView.mas_left).offset(15);
        make.top.equalTo(self->_bjIconView.mas_top).offset(25);
        make.width.height.mas_equalTo(50);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(10);
        make.centerY.equalTo(self->_iconView).offset(-5);
    }];
    
    [_memberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_iconView.mas_bottom).offset(-5);
        make.centerX.equalTo(self->_iconView);
    }];
    
    [_signInButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self->_bjIconView);
        make.top.equalTo(self->_bjIconView.mas_top).offset(38);
    }];
    
    [_giftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->_bjIconView.mas_right).offset(-18);
        make.centerY.equalTo(self->_signInButton);
    }];
    
    [_commodityButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bjIconView.mas_left).offset(35);
        make.top.equalTo(self->_memberLabel.mas_bottom).offset(5);
    }];
    
    [_shopButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self->_bjIconView);
        make.centerY.equalTo(self->_commodityButton);
    }];
    
    [_footprintButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->_bjIconView.mas_right).offset(-55);
        make.centerY.equalTo(self->_shopButton);
    }];
}


-(void)setUserInfo:(UserInfoModel *)userInfo
{
    _userInfo = userInfo;
    //显示头像
    if (!kStringIsEmpty(_userInfo.head_pic))
    {
        NSString* str = [NSString stringWithFormat:@"%@%@",ImageUrl,_userInfo.head_pic];
        [_iconView sd_setImageWithURL:[NSURL URLWithString:str]];
    }
    _nameLabel.text = _userInfo.nickname;
    [_commodityButton setTitle:[NSString stringWithFormat:@"        %ld\n  商品关注",(long)_userInfo.goods_collect_num] forState:UIControlStateNormal];
    [_shopButton setTitle:[NSString stringWithFormat:@"       %ld\n  店铺关注",(long)_userInfo.seller_goods_num] forState:UIControlStateNormal];
    [_footprintButton setTitle:[NSString stringWithFormat:@"  %ld\n足迹",(long)_userInfo.goods_visit_num] forState:UIControlStateNormal];
}


-(void)signInButtonDidClick
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ZFMyHeadViewDidClick:)])
    {
        [self.delegate ZFMyHeadViewDidClick:5];
    }
}

-(void)commodityButtonDidClick
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ZFMyHeadViewDidClick:)])
    {
        [self.delegate ZFMyHeadViewDidClick:2];
    }
}

-(void)shopButtonDidClick
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ZFMyHeadViewDidClick:)])
    {
        [self.delegate ZFMyHeadViewDidClick:3];
    }
}

-(void)footprintButtonDidClick
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ZFMyHeadViewDidClick:)])
    {
        [self.delegate ZFMyHeadViewDidClick:4];
    }
}


- (UIImageView *)bjIconView {
    if (_bjIconView == nil) {
        _bjIconView = [[UIImageView alloc] init];
        _bjIconView.image = [UIImage imageNamed:@"tupian"];
    }
    return _bjIconView;
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"w12"];
        _iconView.layer.cornerRadius = 25.0f;
        _iconView.clipsToBounds = YES;
        //头像点击事件
        _iconView.userInteractionEnabled = YES;
        UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        [_iconView addGestureRecognizer:singleTap];
    }
    return _iconView;
}

- (void)handleSingleTap:(UITouch *)touch
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ZFMyHeadViewDidClick:)])
    {
        [self.delegate ZFMyHeadViewDidClick:1];
    }
}


- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColorHex(0xffffff);
        _nameLabel.font = [UIFont systemFontOfSize:15];
        _nameLabel.text = @"潘多拉";
    }
    return _nameLabel;
}

- (UILabel *)memberLabel {
    if (_memberLabel == nil) {
        _memberLabel = [[UILabel alloc] init];
        _memberLabel.textColor = RGBColorHex(0x151515);
        _memberLabel.font = [UIFont systemFontOfSize:12];
        _memberLabel.backgroundColor = [UIColor whiteColor];
        _memberLabel.layer.cornerRadius = 7.0f;
        _memberLabel.clipsToBounds = YES;
        _memberLabel.text = @"  尊贵会员  ";
        
    }
    return _memberLabel;
}


- (UIButton *)signInButton {
    if (_signInButton == nil) {
        _signInButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_signInButton setTitle:@" 签到 " forState:UIControlStateNormal];
        [_signInButton setImage:[UIImage imageNamed:@"QD1"] forState:UIControlStateNormal];
        [_signInButton setTitleColor:RGBColorHex(0xffffff) forState:UIControlStateNormal];
        _signInButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_signInButton addTarget:self action:@selector(signInButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _signInButton;
}

- (UILabel *)giftLabel {
    if (_giftLabel == nil) {
        _giftLabel = [[UILabel alloc] init];
        _giftLabel.textColor = RGBColorHex(0xffffff);
        _giftLabel.font = [UIFont systemFontOfSize:12];
        _giftLabel.text = @"10天签到领取礼品";
    }
    return _giftLabel;
}

- (UIButton *)commodityButton {
    if (_commodityButton == nil) {
        _commodityButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_commodityButton setTitle:@"       10\n  商品关注" forState:UIControlStateNormal];
        _commodityButton.titleLabel.lineBreakMode = 0;
        [_commodityButton setTitleColor:RGBColorHex(0xffffff) forState:UIControlStateNormal];
        _commodityButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_commodityButton addTarget:self action:@selector(commodityButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _commodityButton;
}

- (UIButton *)shopButton {
    if (_shopButton == nil) {
        _shopButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shopButton setTitle:@"       10\n  店铺关注" forState:UIControlStateNormal];
        _shopButton.titleLabel.lineBreakMode = 0;
        [_shopButton setTitleColor:RGBColorHex(0xffffff) forState:UIControlStateNormal];
        _shopButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_shopButton addTarget:self action:@selector(shopButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shopButton;
}


- (UIButton *)footprintButton {
    if (_footprintButton == nil) {
        _footprintButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_footprintButton setTitle:@" 123\n足迹" forState:UIControlStateNormal];
        _footprintButton.titleLabel.lineBreakMode = 0;
        [_footprintButton setTitleColor:RGBColorHex(0xffffff) forState:UIControlStateNormal];
        _footprintButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_footprintButton addTarget:self action:@selector(footprintButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _footprintButton;
}


@end
