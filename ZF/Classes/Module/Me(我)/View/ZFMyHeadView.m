//
//  ZFMyHeadView.m
//  ZF
//
//  Created by apple on 2019/3/8.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFMyHeadView.h"



@interface ZFMyHeadView()

@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UIImageView* icon2View;
@property (nonatomic, strong) UILabel* memberLabel;
@property (nonatomic, strong) UIButton* setUpButton;
@property (nonatomic, strong) UIButton* commodityButton;
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
    self.backgroundColor = RGBColorHex(0xedf4f7);
    [self addSubview:self.iconView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.icon2View];
    [self addSubview:self.memberLabel];
    [self addSubview:self.setUpButton];
    [self addSubview:self.commodityButton];
    [self addSubview:self.footprintButton];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(30);
        make.width.height.mas_equalTo(50);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(kScale(10));
        make.centerY.equalTo(self->_iconView).offset(-kScale(5));
        make.right.mas_equalTo(-kScale(220));
    }];
    
    [_icon2View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(10);
        make.top.equalTo(self->_nameLabel.mas_bottom).offset(5);
    }];
    
    [_memberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_icon2View.mas_right).offset(4);
        make.top.equalTo(self->_nameLabel.mas_bottom).offset(5);
    }];
    
    [_setUpButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(35);
    }];
    
    [_commodityButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(80);
        make.top.equalTo(self->_memberLabel.mas_bottom).offset(10);
    }];
    
    [_footprintButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-80);
        make.centerY.equalTo(self->_commodityButton);
    }];
}


-(void)setUserInfo:(UserInfoModel *)userInfo
{
    _userInfo = userInfo;
    //显示头像
    if (!kStringIsEmpty(_userInfo.head_pic))
    {
//        NSString* str = [NSString stringWithFormat:@"%@%@",ImageUrl,_userInfo.head_pic];
        [_iconView sd_setImageWithURL:[NSURL URLWithString:userInfo.head_pic]];
    }
    _nameLabel.text = _userInfo.nickname;
    [_commodityButton setTitle:[NSString stringWithFormat:@"        %ld\n  商品关注",(long)_userInfo.goods_collect_num] forState:UIControlStateNormal];
    [_footprintButton setTitle:[NSString stringWithFormat:@"  %ld\n足迹",(long)_userInfo.goods_visit_num] forState:UIControlStateNormal];
}


-(void)setUpButtonDidClick
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

-(void)footprintButtonDidClick
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ZFMyHeadViewDidClick:)])
    {
        [self.delegate ZFMyHeadViewDidClick:4];
    }
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
        _nameLabel.textColor = RGBColorHex(0x151515);
        _nameLabel.font = [UIFont systemFontOfSize:15];
        _nameLabel.text = @"潘多拉";
    }
    return _nameLabel;
}

- (UIImageView *)icon2View {
    if (_icon2View == nil) {
        _icon2View = [[UIImageView alloc] init];
        _icon2View.image = [UIImage imageNamed:@"Member"];
    }
    return _icon2View;
}

- (UILabel *)memberLabel {
    if (_memberLabel == nil) {
        _memberLabel = [[UILabel alloc] init];
        _memberLabel.textColor = RGBColorHex(0x383838);
        _memberLabel.font = [UIFont systemFontOfSize:9];
        _memberLabel.text = @"普通会员";
        
    }
    return _memberLabel;
}


- (UIButton *)setUpButton {
    if (_setUpButton == nil) {
        _setUpButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_setUpButton setImage:[UIImage imageNamed:@"Setting"] forState:UIControlStateNormal];
        [_setUpButton setTitleColor:RGBColorHex(0xffffff) forState:UIControlStateNormal];
        _setUpButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_setUpButton addTarget:self action:@selector(setUpButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _setUpButton;
}

- (UIButton *)commodityButton {
    if (_commodityButton == nil) {
        _commodityButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_commodityButton setTitle:@"       10\n  商品关注" forState:UIControlStateNormal];
        _commodityButton.titleLabel.lineBreakMode = 0;
        [_commodityButton setTitleColor:RGBColorHex(0x151515) forState:UIControlStateNormal];
        _commodityButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_commodityButton addTarget:self action:@selector(commodityButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _commodityButton;
}

- (UIButton *)footprintButton {
    if (_footprintButton == nil) {
        _footprintButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_footprintButton setTitle:@" 123\n足迹" forState:UIControlStateNormal];
        _footprintButton.titleLabel.lineBreakMode = 0;
        [_footprintButton setTitleColor:RGBColorHex(0x151515) forState:UIControlStateNormal];
        _footprintButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_footprintButton addTarget:self action:@selector(footprintButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _footprintButton;
}


@end
