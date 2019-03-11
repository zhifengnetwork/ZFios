//
//  ZFAccountModificationVC.m
//  ZF
//
//  Created by apple on 2019/2/27.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFAccountModificationVC.h"
#import "JKCountDownButton.h"
#import "ZFResetPasswordVC.h"

@interface ZFAccountModificationVC ()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIView *bg1View;
@property (nonatomic, strong) UIView *bg2View;

@property (nonatomic, strong) UIImageView* vcodeView;
@property (nonatomic, strong) UIImageView* iconView;

@property (nonatomic, strong) UILabel *phoneLabel;
@property (nonatomic, strong) UITextField *phoneTextField;
@property (nonatomic, strong) UITextField *vcodeTextField;
@property (nonatomic, strong) UITextField *verificationTextField;

@property (nonatomic, strong) UIButton *loginButton;


@end

@implementation ZFAccountModificationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
}



- (void)setupUI
{
    [self.view addSubview:self.bgView];
    [self.view addSubview:self.bg1View];
    [self.view addSubview:self.bg2View];
    [self.view addSubview:self.phoneLabel];
    [self.view addSubview:self.phoneTextField];
     [self.view addSubview:self.vcodeTextField];
    [self.view addSubview:self.verificationTextField];
   
    [self.view addSubview:self.iconView];
    [self.view addSubview:self.vcodeView];
    
    [self.view addSubview:self.loginButton];
    
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.equalTo(self.view).offset(30);
//        make.top.equalTo(self.view).offset(39+LL_NavigationBarHeight);
        // make.left.equalTo(self).offset(26);
    }];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_phoneLabel.mas_bottom).offset(40);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(50);
    }];
    
    
    [_bg1View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_bgView.mas_bottom).offset(20);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(50);
    }];
    
    [_bg2View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_bg1View.mas_bottom).offset(20);
        make.left.equalTo(self.view).offset(10);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(50);
    }];
    
    [_phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView).offset(30);
        make.top.bottom.equalTo(self->_bgView);
        make.right.mas_equalTo(-15);
    }];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.equalTo(self->_bgView);
    }];

    [_vcodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg1View).offset(10);
        make.top.bottom.equalTo(self->_bg1View);
        make.right.mas_equalTo(-15);
    }];
    
    [_verificationTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg2View).offset(8);
        make.top.bottom.equalTo(self->_bg2View);
        make.right.mas_equalTo(-165);
    }];
    
    [_vcodeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_vcodeTextField.mas_right).offset(5);
        make.top.bottom.equalTo(self->_bg2View);
        make.right.mas_equalTo(-15);
        make.width.mas_equalTo(137);
        make.height.mas_equalTo(50);
        
    }];
    
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_verificationTextField.mas_bottom).offset(30);
        make.left.equalTo(self.view).offset(15);
        make.right.equalTo(self.view).offset(-15);
        make.height.mas_equalTo(50);
    }];
    
}


//提交按钮被点击
- (void)loginButtonDidClick
{
    ZFResetPasswordVC* vc = [[ZFResetPasswordVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (UILabel *)phoneLabel {
    if (_phoneLabel == nil) {
        _phoneLabel = [[UILabel alloc] init];
        _phoneLabel.textColor = RGBColorHex(0x333333);
        _phoneLabel.font = [UIFont systemFontOfSize:24];
        _phoneLabel.text = @"智丰商城账户修改";
    }
    return _phoneLabel;
}

- (UITextField *)phoneTextField {
    if (_phoneTextField == nil) {
        _phoneTextField = [[UITextField alloc] init];
        _phoneTextField.placeholder = @"请输入账号或手机号";
        _phoneTextField.font = [UIFont systemFontOfSize:14];
        _phoneTextField.textColor = RGBColorHex(0x757575);
        _phoneTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _phoneTextField;
}

- (UITextField *)vcodeTextField {
    if (_vcodeTextField == nil) {
        _vcodeTextField = [[UITextField alloc] init];
        _vcodeTextField.placeholder = @"请输入验证码";
        _vcodeTextField.font = [UIFont systemFontOfSize:14];
        _vcodeTextField.textColor = RGBColorHex(0x757575);
        _vcodeTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _vcodeTextField.keyboardType = UIKeyboardTypeASCIICapable;
    }
    return _vcodeTextField;
}

- (UITextField *)verificationTextField {
    if (_verificationTextField == nil) {
        _verificationTextField = [[UITextField alloc] init];
        _verificationTextField.placeholder = @"其他验证方式";
        _verificationTextField.font = [UIFont systemFontOfSize:14];
        _verificationTextField.textColor = RGBColorHex(0x757575);
        _verificationTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _verificationTextField.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _verificationTextField;
}



-(UIView *)bgView
{
    if(_bgView==nil)
    {
        _bgView = [[UIView alloc]initWithFrame:CGRectZero];
        _bgView.layer.borderWidth = 1.0f;
        _bgView.layer.borderColor = RGBColorHex(0xBBBBBB).CGColor;
        _bgView.layer.cornerRadius = 4.0f;
    }
    return _bgView;
}


-(UIView *)bg1View
{
    if(_bg1View==nil)
    {
        _bg1View = [[UIView alloc]initWithFrame:CGRectZero];
        _bg1View.layer.borderWidth = 1.0f;
        _bg1View.layer.borderColor = RGBColorHex(0xBBBBBB).CGColor;
        _bg1View.layer.cornerRadius = 4.0f;
    }
    return _bg1View;
}

-(UIView *)bg2View
{
    if(_bg2View==nil)
    {
        _bg2View = [[UIView alloc]initWithFrame:CGRectZero];
        _bg2View.layer.borderWidth = 1.0f;
        _bg2View.layer.borderColor = RGBColorHex(0xBBBBBB).CGColor;
        _bg2View.layer.cornerRadius = 4.0f;
    }
    return _bg2View;
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"shouji"];
        _iconView.clipsToBounds = YES;
        _iconView.layer.cornerRadius = 3.0f;
    }
    return _iconView;
}

- (UIImageView *)vcodeView {
    if (_vcodeView == nil) {
        _vcodeView = [[UIImageView alloc] init];
        _vcodeView.layer.borderWidth = 1.0f;
        _vcodeView.layer.borderColor = RGBColorHex(0xBBBBBB).CGColor;
        _vcodeView.image = [UIImage imageNamed:@"icon_login_bgk"];
        _vcodeView.clipsToBounds = YES;
        _vcodeView.layer.cornerRadius = 3.0f;
    }
    return _vcodeView;
}

- (UIButton *)loginButton {
    if (_loginButton == nil) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginButton.backgroundColor = RGBColorHex(0xFF4200);
        [_loginButton setTitle:@"提交按钮" forState:UIControlStateNormal];
        _loginButton.titleLabel.font = [UIFont systemFontOfSize:24];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _loginButton.layer.cornerRadius = 3;
        _loginButton.clipsToBounds = YES;
        [_loginButton addTarget:self action:@selector(loginButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}


//- (JKCountDownButton *)vcodeButton {
//    if (_vcodeButton == nil) {
//        _vcodeButton = [JKCountDownButton buttonWithType:UIButtonTypeCustom];
//        [_vcodeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
//        _vcodeButton.titleLabel.font = [UIFont systemFontOfSize:14];
//        [_vcodeButton setTitleColor:RGBColorHex(0x101010) forState:UIControlStateNormal];
//
//        //点击
//        ZWeakSelf
//        [_vcodeButton countDownButtonHandler:^(JKCountDownButton*sender, NSInteger tag) {
//
//            sender.enabled = NO;
//            [sender startCountDownWithSecond:60];
//
//            [sender countDownChanging:^NSString *(JKCountDownButton *countDownButton,NSUInteger second) {
//                NSString *title = [NSString stringWithFormat:@"剩余%zd秒",second];
//                return title;
//            }];
//            [sender countDownFinished:^NSString *(JKCountDownButton *countDownButton, NSUInteger second) {
//                countDownButton.enabled = YES;
//                return @"点击重新获取";
//
//            }];
//
//        }];
//
//    }
//
//    return _vcodeButton;
//}

@end
