//
//  ZFPhoneLoginVC.m
//  ZF
//
//  Created by apple on 2019/02/25.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFPhoneLoginVC.h"
#import "ZFTool.h"
#import "SVProgressHUD.h"
#import "http_user.h"
#import "UserInfoModel.h"
#import "MJExtension.h"


@interface ZFPhoneLoginVC ()

@property (nonatomic, strong) UIImageView *accountLeftView;
@property (nonatomic, strong) UIImageView *passwordLeftView;
@property (nonatomic, strong) UITextField *accountTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UIView *lineView1;
@property (nonatomic, strong) UIView *lineView2;

@property (nonatomic, strong) UIButton *termsButton;

@property (nonatomic, strong) UIButton *loginButton;

@end

@implementation ZFPhoneLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"手机登录";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.accountLeftView];
    [self.view addSubview:self.passwordLeftView];
    [self.view addSubview:self.lineView1];
    [self.view addSubview:self.lineView2];
    [self.view addSubview:self.accountTextField];
    [self.view addSubview:self.passwordTextField];
    [self.view addSubview:self.termsButton];
    [self.view addSubview:self.loginButton];
    
    UIImage *imageAccount = [UIImage imageNamed:@"icon_account-number"];
    UIImage *imagePassword = [UIImage imageNamed:@"icon_password"];
    
    [_accountLeftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(15);
        make.leading.equalTo(self.view.mas_leading).offset(LeadingTrailingMargin);
        make.width.mas_equalTo(imageAccount.size.width).priorityHigh();
    }];
    
    [_lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_accountLeftView.mas_bottom).offset(10);
        make.height.mas_equalTo(0.5);
        make.leading.equalTo(self.view).offset(LeadingTrailingMargin);
        make.trailing.equalTo(self.view).offset(-LeadingTrailingMargin);
    }];
    
    [_passwordLeftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_lineView1.mas_bottom).offset(20);
        make.leading.equalTo(self.view).offset(LeadingTrailingMargin);
        make.width.mas_equalTo(imagePassword.size.width).priorityHigh();
    }];
    
    [_lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_passwordLeftView.mas_bottom).offset(10);
        make.height.mas_equalTo(0.5);
        make.leading.equalTo(self.view).offset(LeadingTrailingMargin);
        make.trailing.equalTo(self.view).offset(-LeadingTrailingMargin);
    }];
    
    [_accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self->_accountLeftView);
        make.leading.equalTo(self->_accountLeftView.mas_trailing).offset(11);
        make.trailing.equalTo(self.view).offset(-LeadingTrailingMargin);
        make.height.mas_equalTo(44);
    }];
    
    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self->_passwordLeftView);
        make.leading.equalTo(self->_passwordLeftView.mas_trailing).offset(11);
        make.trailing.equalTo(self.view).offset(-LeadingTrailingMargin);
        make.height.mas_equalTo(44);
    }];
    
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_lineView2.mas_bottom).offset(74);
        make.height.mas_equalTo(44);
        make.leading.equalTo(self.view).offset(LeadingTrailingMargin);
        make.trailing.equalTo(self.view).offset(-LeadingTrailingMargin);
    }];
    
    [_termsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_loginButton.mas_bottom).offset(18);
        make.leading.equalTo(self.view).offset(LeadingTrailingMargin);
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [_accountTextField becomeFirstResponder];
}


- (void)loginButtonDidClick {
    
    if (![ZFTool isPhoneNumber:_accountTextField.text]) {
        [SVProgressHUD showInfoWithStatus:@"请输入正确的手机号码"];
        return;
    }
    if (_passwordTextField.text.length < 6) {
        [SVProgressHUD showInfoWithStatus:@"请输入6位以上的密码，密码由英文、数字、符号组成"];
        return;
    }
    
    [self.view endEditing:YES];
    
    ZWeakSelf
    [SVProgressHUD showWithStatus:@"正在登录"];
    [http_user login:_accountTextField.text password:_passwordTextField.text success:^(id responseObject)
     {
         [weakSelf login_success:responseObject];
         
     } failure:^(NSError *error)
     {
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
}

-(void)login_success:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        [SVProgressHUD showErrorWithStatus:@"登录失败"];
        return;
    }
    
    UserInfoModel* userInfo = [UserInfoModel mj_objectWithKeyValues:responseObject];
    [userInfo saveUserInfo];
    
    [SVProgressHUD showSuccessWithStatus:@"登录成功"];
    [[NSNotificationCenter defaultCenter] postNotificationName:UserLoginRegisterNotification object:nil userInfo:nil];
}


- (void)termsButtonDidClick
{
    
}

#pragma mark - getter

- (UIButton *)loginButton {
    if (_loginButton == nil) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        _loginButton.titleLabel.font = [UIFont systemFontOfSize:15];
        _loginButton.titleLabel.textColor = [UIColor whiteColor];
        _loginButton.layer.cornerRadius = 4;
        _loginButton.clipsToBounds = YES;
        [_loginButton setBackgroundColor:RGBColor(255, 101, 140)];
        [_loginButton addTarget:self action:@selector(loginButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}

- (UIButton *)termsButton {
    if (_termsButton == nil) {
        _termsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _termsButton.adjustsImageWhenHighlighted = NO;
        _termsButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_termsButton setTitle:@"用户协议" forState:UIControlStateNormal];
        [_termsButton setTitleColor:RGBColor(173, 173, 173) forState:UIControlStateNormal];
        [_termsButton setImage:[UIImage imageNamed:@"icon_defaults_press"] forState:UIControlStateNormal];
        _termsButton.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, -5);
        _termsButton.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
        [_termsButton addTarget:self action:@selector(termsButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _termsButton;
}

- (UITextField *)accountTextField {
    if (_accountTextField == nil) {
        _accountTextField = [[UITextField alloc] init];
        _accountTextField.placeholder = @"请输入手机号码";
        _accountTextField.font = [UIFont systemFontOfSize:16];
        _accountTextField.textColor = RGBColor(46, 46, 46);
        _accountTextField.borderStyle = UITextBorderStyleNone;
        _accountTextField.keyboardType = UIKeyboardTypeNumberPad;
        _accountTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _accountTextField;
}

- (UITextField *)passwordTextField {
    if (_passwordTextField == nil) {
        _passwordTextField = [[UITextField alloc] init];
        _passwordTextField.placeholder = @"请输入登录密码";
        _passwordTextField.font = [UIFont systemFontOfSize:16];
        _passwordTextField.textColor = RGBColor(46, 46, 46);
        _passwordTextField.borderStyle = UITextBorderStyleNone;
        _passwordTextField.secureTextEntry = YES;
    }
    return _passwordTextField;
}

- (UIImageView *)accountLeftView {
    if (_accountLeftView == nil) {
        _accountLeftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_account-number"]];
    }
    return _accountLeftView;
}

- (UIImageView *)passwordLeftView {
    if (_passwordLeftView == nil) {
        UIImage *image = [UIImage imageNamed:@"icon_password"];
        _passwordLeftView = [[UIImageView alloc] initWithImage:image];
    }
    return _passwordLeftView;
}

- (UIView *)lineView1 {
    if (_lineView1 == nil) {
        _lineView1 = [[UIView alloc] init];
        _lineView1.backgroundColor = [UIColor colorWithRed:227/255.0 green:227/255.0 blue:227/255.0 alpha:1.0];
    }
    return _lineView1;
}

- (UIView *)lineView2 {
    if (_lineView2 == nil) {
        _lineView2 = [[UIView alloc] init];
        _lineView2.backgroundColor = [UIColor colorWithRed:227/255.0 green:227/255.0 blue:227/255.0 alpha:1.0];
    }
    return _lineView2;
}

@end
