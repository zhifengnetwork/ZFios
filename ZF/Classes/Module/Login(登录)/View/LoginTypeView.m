//
//  LoginTypeView.m
//  LK
//
//  Created by ZMac on 2018/4/27.
//  Copyright © 2018年 LKQN. All rights reserved.
//

#import "LoginTypeView.h"


@interface LoginTypeView()

@property (nonatomic, strong) UIView *leftLine;
@property (nonatomic, strong) UIView *rightLine;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *wxButton;

@end

@implementation LoginTypeView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    
    [self addSubview:self.leftLine];
    [self addSubview:self.titleLabel];
    [self addSubview:self.rightLine];
    [self addSubview:self.wxButton];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(kScale(15));
        make.centerX.equalTo(self);
    }];
    
    [_leftLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self->_titleLabel);
        make.right.equalTo(self->_titleLabel.mas_left).offset(-10);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(0.5);
    }];
    
    [_rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self->_titleLabel);
        make.left.equalTo(self->_titleLabel.mas_right).offset(5);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(0.5);
    }];
    
    [_wxButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self->_titleLabel.mas_bottom).offset(20);
        make.width.mas_equalTo(42);
        make.height.mas_equalTo(42);
    }];
    

}

-(void)setIsHidePhone:(BOOL)isHidePhone
{
    _isHidePhone = isHidePhone;
    
    if (_isHidePhone)
    {
        _titleLabel.text = @"微信登录";
        
        [_wxButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self->_titleLabel.mas_bottom).offset(20);
            make.width.mas_equalTo(42);
            make.height.mas_equalTo(42);
        }];
        
    }
    
}



- (void)ButtonDidClick:(UIButton *)sender
{
    int tag = (int)sender.tag - 1000;
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(LoginTypeViewDidClick:)])
    {
        [self.delegate LoginTypeViewDidClick:tag];
    }
}



- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0x151515);
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.text = @"使用第三方登录";
    }
    return _titleLabel;
}

- (UIView *)leftLine {
    if (_leftLine == nil) {
        _leftLine = [[UIView alloc] init];
        _leftLine.backgroundColor = RGBColorHex(0xBBBBBB);
    }
    return _leftLine;
}

- (UIView *)rightLine {
    if (_rightLine == nil) {
        _rightLine = [[UIView alloc] init];
        _rightLine.backgroundColor = RGBColorHex(0xBBBBBB);
    }
    return _rightLine;
}

- (UIButton *)wxButton {
    if (_wxButton == nil) {
        
        _wxButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_wxButton setImage:[UIImage imageNamed:@"weixi"] forState:UIControlStateNormal];
        [_wxButton addTarget:self action:@selector(ButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
        _wxButton.tag = 1000+2;
    }
    return _wxButton;
}



@end
