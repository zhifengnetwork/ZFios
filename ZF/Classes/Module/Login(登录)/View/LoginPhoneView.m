//
//  LoginPhoneView.m
//  LK
//
//  Created by apple on 2018/4/30.
//  Copyright © 2018年 LKQN. All rights reserved.
//

#import "LoginPhoneView.h"


@interface LoginPhoneView()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIView *bg1View;
@property (nonatomic, strong) UIView *phoneView;
@property (nonatomic, strong) UIView *centerLine;

@property (nonatomic, strong) UIImageView* bjIconView;
@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UIImageView* icon2View;
@property (nonatomic, strong) UIView *center2Line;
@property (nonatomic, strong) UIView *center3Line;

@end


@implementation LoginPhoneView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        [self setup];
    }
    return self;
}

- (void)setup
{
    [self addSubview:self.bgView];
    [self addSubview:self.bg1View];
    [self addSubview:self.phoneLabel];
    [self addSubview:self.phoneView];
    [self addSubview:self.centerLine];
    [self addSubview:self.phoneTextField];
    [self addSubview:self.passwordTextField];
    [self addSubview:self.vcodeTextField];
    [self addSubview:self.center2Line];
    [self addSubview:self.center3Line];
    [self addSubview:self.centerLine];
    [self addSubview:self.vcodeButton];
    [self addSubview:self.bjIconView];
    [self addSubview:self.iconView];
    [self addSubview:self.icon2View];
    
    [_bjIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.equalTo(self).offset(30);
        // make.left.equalTo(self).offset(26);
    }];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_phoneLabel.mas_bottom).offset(40);
        make.left.equalTo(self).offset(25);
        make.right.equalTo(self).offset(-25);
        make.height.mas_equalTo(50);
    }];
    
    
    [_bg1View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_bgView.mas_bottom).offset(20);
        make.left.equalTo(self).offset(25);
        make.right.equalTo(self).offset(-25);
        make.height.mas_equalTo(50);
    }];
    
    //    [_phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.top.equalTo(_phoneLabel.mas_bottom).offset(30);
    //        make.left.equalTo(self).offset(25);
    //        make.right.equalTo(self).offset(-25);
    //        make.height.mas_equalTo(90);
    //    }];
    
    //    [_centerLine mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.centerY.equalTo(_phoneView);
    //        make.left.right.equalTo(_phoneView);
    //        make.height.mas_equalTo(0.5f);
    //    }];

    
    //    [_center2Line mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.centerY.equalTo(_areaLabel);
    //        make.left.equalTo(_areaLabel.mas_right).offset(7);
    //        make.height.mas_equalTo(25);
    //        make.width.mas_equalTo(0.5f);
    //    }];
    
    [_phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg1View).offset(15);
        make.top.bottom.equalTo(self->_bg1View);
        make.right.equalTo(self->_vcodeButton.mas_left).offset(-1);
    }];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.top.bottom.equalTo(self->_bg1View);
    }];
    
    [_vcodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->_bg1View);
        make.top.bottom.equalTo(self->_bg1View);
        make.width.mas_equalTo(110);
    }];
    
    //    [_center3Line mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.centerY.equalTo(_vcodeButton);
    //        make.right.equalTo(_vcodeButton.mas_left);
    //        make.height.mas_equalTo(25);
    //        make.width.mas_equalTo(0.5f);
    //    }];
    
    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg1View).offset(15);
        make.top.bottom.equalTo(self->_bg1View);
        make.right.equalTo(self->_vcodeButton.mas_left).offset(-1);
    }];
    
    [_vcodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg1View).offset(15);
        make.top.bottom.equalTo(self->_bg1View);
        make.right.equalTo(self->_vcodeButton.mas_left).offset(-1);
        //        make.bottom.equalTo(_bg1View);
        //        make.top.equalTo(_centerLine);
    }];
    
    [_icon2View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.top.bottom.equalTo(self->_bg1View);
    }];
    
}


- (UILabel *)phoneLabel {
    if (_phoneLabel == nil) {
        _phoneLabel = [[UILabel alloc] init];
        _phoneLabel.textColor = RGBColorHex(0x333333);
        _phoneLabel.font = [UIFont systemFontOfSize:23];
        _phoneLabel.text = @"智丰商场账号登录";
    }
    return _phoneLabel;
}

- (UIView *)phoneView {
    if (_phoneView == nil) {
        _phoneView = [[UIView alloc] init];
        _phoneView.layer.borderWidth = 0.5;
        _phoneView.layer.borderColor = RGBColorHex(0xcccccc).CGColor;
        _phoneView.layer.cornerRadius = 3.0f;
    }
    return _phoneView;
}

- (UIView *)centerLine {
    if (_centerLine == nil) {
        _centerLine = [[UIView alloc] init];
        _centerLine.backgroundColor = RGBColorHex(0xcccccc);
    }
    return _centerLine;
}

- (UIView *)center2Line {
    if (_center2Line == nil) {
        _center2Line = [[UIView alloc] init];
        _center2Line.backgroundColor = RGBColorHex(0xcccccc);
    }
    return _center2Line;
}

- (UIView *)center3Line {
    if (_center3Line == nil) {
        _center3Line = [[UIView alloc] init];
        _center3Line.backgroundColor = RGBColorHex(0xcccccc);
    }
    return _center3Line;
}


- (UITextField *)phoneTextField {
    if (_phoneTextField == nil) {
        _phoneTextField = [[UITextField alloc] init];
        _phoneTextField.placeholder = @"手机号码/账号";
        _phoneTextField.font = [UIFont systemFontOfSize:17];
        _phoneTextField.textColor = RGBColorHex(0x333333);
        _phoneTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _phoneTextField;
}

- (UITextField *)passwordTextField {
    if (_passwordTextField == nil) {
        _passwordTextField = [[UITextField alloc] init];
        _passwordTextField.placeholder = @"输入密码";
        _passwordTextField.font = [UIFont systemFontOfSize:17];
        _passwordTextField.textColor = RGBColorHex(0x333333);
        _passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passwordTextField.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _passwordTextField;
}

- (UITextField *)vcodeTextField {
    if (_vcodeTextField == nil) {
        _vcodeTextField = [[UITextField alloc] init];
        _vcodeTextField.placeholder = @"图像验证码不区分大小写";
        _vcodeTextField.font = [UIFont systemFontOfSize:17];
        _vcodeTextField.textColor = RGBColorHex(0x333333);
        _vcodeTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _vcodeTextField.keyboardType = UIKeyboardTypeASCIICapable;
    }
    return _vcodeTextField;
}

-(UIView *)bgView
{
    if(_bgView==nil)
    {
        _bgView = [[UIView alloc]initWithFrame:CGRectZero];
        _bgView.backgroundColor = RGBColorHex(0xf3f5f7);
        _bgView.layer.cornerRadius = 4.0f;
    }
    return _bgView;
}


-(UIView *)bg1View
{
    if(_bg1View==nil)
    {
        _bg1View = [[UIView alloc]initWithFrame:CGRectZero];
        _bg1View.backgroundColor = RGBColorHex(0xf3f5f7);
        _bg1View.layer.cornerRadius = 4.0f;
    }
    return _bg1View;
}

- (UIImageView *)bjIconView {
    if (_bjIconView == nil) {
        _bjIconView = [[UIImageView alloc] init];
        _bjIconView.image = [UIImage imageNamed:@"icon_login_bgk"];
        _bjIconView.clipsToBounds = YES;
        _bjIconView.layer.cornerRadius = 3.0f;
    }
    return _bjIconView;
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"icon_login_bgk"];
        _iconView.clipsToBounds = YES;
        _iconView.layer.cornerRadius = 3.0f;
    }
    return _iconView;
}

- (UIImageView *)icon2View {
    if (_icon2View == nil) {
        _icon2View = [[UIImageView alloc] init];
        _icon2View.image = [UIImage imageNamed:@"icon_login_bgk"];
        _icon2View.clipsToBounds = YES;
        _icon2View.layer.cornerRadius = 3.0f;
    }
    return _icon2View;
}


- (JKCountDownButton *)vcodeButton {
    if (_vcodeButton == nil) {
        _vcodeButton = [JKCountDownButton buttonWithType:UIButtonTypeCustom];
        [_vcodeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
        _vcodeButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_vcodeButton setTitleColor:RGBColorHex(0x101010) forState:UIControlStateNormal];
        
        //点击
        ZWeakSelf
        [_vcodeButton countDownButtonHandler:^(JKCountDownButton*sender, NSInteger tag) {
            
            if (self.delegate != nil && [self.delegate respondsToSelector:@selector(LoginPhoneViewDidClick:)])
            {
                BOOL bRet = [self.delegate LoginPhoneViewDidClick:weakSelf.phoneTextField.text];
                if (bRet)
                {
                    sender.enabled = NO;
                    [sender startCountDownWithSecond:60];
                }
            }
            
            [sender countDownChanging:^NSString *(JKCountDownButton *countDownButton,NSUInteger second) {
                NSString *title = [NSString stringWithFormat:@"剩余%zd秒",second];
                return title;
            }];
            [sender countDownFinished:^NSString *(JKCountDownButton *countDownButton, NSUInteger second) {
                countDownButton.enabled = YES;
                return @"点击重新获取";
                
            }];
            
        }];
        
    }
    
    return _vcodeButton;
}

@end
