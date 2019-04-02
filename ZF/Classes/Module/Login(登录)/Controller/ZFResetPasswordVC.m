//
//  ZFResetPasswordVC.m
//  ZF
//
//  Created by apple on 2019/2/27.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFResetPasswordVC.h"

@interface ZFResetPasswordVC ()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIView *bg1View;

@property (nonatomic, strong) UILabel *passwordLabel;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UITextField *twoPasswordTextField;

@property (nonatomic, strong) UIButton *nextButton;

@end

@implementation ZFResetPasswordVC

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
    [self.view addSubview:self.passwordLabel];
    [self.view addSubview:self.passwordTextField];
    [self.view addSubview:self.twoPasswordTextField];
    [self.view addSubview:self.nextButton];
    
    [_passwordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.equalTo(self.view).offset(30);
//        make.top.equalTo(self.view).offset(39+LL_NavigationBarHeight);
        // make.left.equalTo(self).offset(26);
    }];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_passwordLabel.mas_bottom).offset(40);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(50);
    }];
    
    
    [_bg1View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_bgView.mas_bottom).offset(20);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(50);
    }];
    
    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView).offset(20);
        make.top.bottom.equalTo(self->_bgView);
        make.right.mas_equalTo(-15);
    }];
    
    [_twoPasswordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg1View).offset(20);
        make.top.bottom.equalTo(self->_bg1View);
        make.right.mas_equalTo(-15);
    }];
    
    [_nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_twoPasswordTextField.mas_bottom).offset(30);
        make.left.equalTo(self.view).offset(15);
        make.right.equalTo(self.view).offset(-15);
        make.height.mas_equalTo(50);
    }];
    
}


//登录按钮被点击
- (void)nextButtonDidClick
{
    //    ZFRegisterVC* vc = [[ZFRegisterVC alloc]init];
    //    [self.navigationController pushViewController:vc animated:YES];
}


- (UILabel *)passwordLabel {
    if (_passwordLabel == nil) {
        _passwordLabel = [[UILabel alloc] init];
        _passwordLabel.textColor = RGBColorHex(0x333333);
        _passwordLabel.font = [UIFont systemFontOfSize:24];
        _passwordLabel.text = @"重新设置密码";
    }
    return _passwordLabel;
}

- (UITextField *)passwordTextField {
    if (_passwordTextField == nil) {
        _passwordTextField = [[UITextField alloc] init];
        _passwordTextField.placeholder = @"请输入密码";
        _passwordTextField.font = [UIFont systemFontOfSize:14];
        _passwordTextField.textColor = RGBColorHex(0x757575);
        _passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passwordTextField.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _passwordTextField;
}

- (UITextField *)twoPasswordTextField {
    if (_twoPasswordTextField == nil) {
        _twoPasswordTextField = [[UITextField alloc] init];
        _twoPasswordTextField.placeholder = @"请再输入密码";
        _twoPasswordTextField.font = [UIFont systemFontOfSize:14];
        _twoPasswordTextField.textColor = RGBColorHex(0x757575);
        _twoPasswordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _twoPasswordTextField.keyboardType = UIKeyboardTypeASCIICapable;
    }
    return _twoPasswordTextField;
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

- (UIButton *)nextButton {
    if (_nextButton == nil) {
        _nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _nextButton.backgroundColor = RGBColorHex(0xFF4200);
        [_nextButton setTitle:@"下一步" forState:UIControlStateNormal];
        _nextButton.titleLabel.font = [UIFont systemFontOfSize:24];
        [_nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _nextButton.layer.cornerRadius = 3;
        _nextButton.clipsToBounds = YES;
        [_nextButton addTarget:self action:@selector(nextButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextButton;
}


@end
