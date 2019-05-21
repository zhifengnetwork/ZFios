//
//  ZFChangePasswordVC.m
//  ZF
//
//  Created by admin on 2019/5/21.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFChangePasswordVC.h"
#import "ZFTool.h"
#import "http_user.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "UserInfoModel.h"

@interface ZFChangePasswordVC ()

@property (nonatomic, strong) UIImageView* icon1View;
@property (nonatomic, strong) UIImageView* icon2View;
@property (nonatomic, strong) UIImageView* icon3View;

@property (nonatomic, strong) UILabel *passwordLabel;
@property (nonatomic, strong) UITextField *usedPasswordTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UITextField *twoPasswordTextField;

@property (nonatomic, strong) UIView* line1View;
@property (nonatomic, strong) UIView* line2View;
@property (nonatomic, strong) UIView* line3View;

@property (nonatomic, strong) UIButton *confirmButton;

@end

@implementation ZFChangePasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置密码";
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
}


- (void)setupUI
{
    [self.view addSubview:self.passwordLabel];
    [self.view addSubview:self.icon1View];
    [self.view addSubview:self.icon2View];
    [self.view addSubview:self.icon3View];
    [self.view addSubview:self.usedPasswordTextField];
    [self.view addSubview:self.passwordTextField];
    [self.view addSubview:self.twoPasswordTextField];
    [self.view addSubview:self.line1View];
    [self.view addSubview:self.line2View];
    [self.view addSubview:self.line3View];
    [self.view addSubview:self.confirmButton];
    
    [_passwordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.equalTo(self.view).offset(30);
    }];
    
    [_icon1View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.top.equalTo(self->_passwordLabel.mas_bottom).offset(40);
    }];
    
    [_icon2View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.top.equalTo(self->_icon1View.mas_bottom).offset(30);
    }];
    
    [_icon3View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.top.equalTo(self->_icon2View.mas_bottom).offset(30);
    }];
    
    [_usedPasswordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_icon1View.mas_right).offset(10);
        make.top.bottom.equalTo(self->_icon1View);
        make.right.mas_equalTo(-15);
    }];
    
    //控件优先级
    [self.icon1View setContentHuggingPriority:UILayoutPriorityRequired
                                     forAxis:UILayoutConstraintAxisHorizontal];
    [self.icon1View setContentCompressionResistancePriority:UILayoutPriorityRequired
                                                   forAxis:UILayoutConstraintAxisHorizontal];
    [self.usedPasswordTextField setContentHuggingPriority:UILayoutPriorityDefaultLow
                                  forAxis:UILayoutConstraintAxisHorizontal];
    [self.usedPasswordTextField setContentCompressionResistancePriority:UILayoutPriorityDefaultLow
                                                forAxis:UILayoutConstraintAxisHorizontal];
    
    
    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_icon2View.mas_right).offset(10);
        make.top.bottom.equalTo(self->_icon2View);
        make.right.mas_equalTo(-15);
    }];
    
    [_twoPasswordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_icon3View.mas_right).offset(10);
        make.top.bottom.equalTo(self->_icon3View);
        make.right.mas_equalTo(-15);
    }];
    
    [_line1View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.equalTo(self->_icon1View.mas_bottom).offset(10);
        make.height.mas_equalTo(0.5f);
    }];
    
    [_line2View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.equalTo(self->_icon2View.mas_bottom).offset(10);
        make.height.mas_equalTo(0.5f);
    }];
    
    [_line3View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.equalTo(self->_icon3View.mas_bottom).offset(10);
        make.height.mas_equalTo(0.5f);
    }];
    
    [_confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_twoPasswordTextField.mas_bottom).offset(40);
        make.left.equalTo(self.view).offset(15);
        make.right.equalTo(self.view).offset(-15);
        make.height.mas_equalTo(50);
    }];
    
}


- (UILabel *)passwordLabel {
    if (_passwordLabel == nil) {
        _passwordLabel = [[UILabel alloc] init];
        _passwordLabel.textColor = RGBColorHex(0x333333);
        _passwordLabel.font = [UIFont systemFontOfSize:24];
        _passwordLabel.text = @"修改登录密码";
    }
    return _passwordLabel;
}

- (UIImageView *)icon1View {
    if (_icon1View == nil) {
        _icon1View = [[UIImageView alloc] init];
        _icon1View.image = [UIImage imageNamed:@"lock"];
    }
    return _icon1View;
}

- (UIImageView *)icon2View {
    if (_icon2View == nil) {
        _icon2View = [[UIImageView alloc] init];
        _icon2View.image = [UIImage imageNamed:@"lock"];
    }
    return _icon2View;
}

- (UIImageView *)icon3View {
    if (_icon3View == nil) {
        _icon3View = [[UIImageView alloc] init];
        _icon3View.image = [UIImage imageNamed:@"lock"];
    }
    return _icon3View;
}

- (UITextField *)usedPasswordTextField {
    if (_usedPasswordTextField == nil) {
        _usedPasswordTextField = [[UITextField alloc] init];
        _usedPasswordTextField.placeholder = @"旧密码";
        _usedPasswordTextField.font = [UIFont systemFontOfSize:14];
        _usedPasswordTextField.textColor = RGBColorHex(0x757575);
        _usedPasswordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _usedPasswordTextField.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _usedPasswordTextField;
}

- (UITextField *)passwordTextField {
    if (_passwordTextField == nil) {
        _passwordTextField = [[UITextField alloc] init];
        _passwordTextField.placeholder = @"新密码";
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
        _twoPasswordTextField.placeholder = @"确认新密码";
        _twoPasswordTextField.font = [UIFont systemFontOfSize:14];
        _twoPasswordTextField.textColor = RGBColorHex(0x757575);
        _twoPasswordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _twoPasswordTextField.keyboardType = UIKeyboardTypeASCIICapable;
    }
    return _twoPasswordTextField;
}

- (UIView *)line1View {
    if (_line1View == nil) {
        _line1View = [[UIView alloc] init];
        _line1View.backgroundColor = RGBColorHex(0xbbbbbb);
    }
    return _line1View;
}

- (UIView *)line2View {
    if (_line2View == nil) {
        _line2View = [[UIView alloc] init];
        _line2View.backgroundColor = RGBColorHex(0xbbbbbb);
    }
    return _line2View;
}

- (UIView *)line3View {
    if (_line3View == nil) {
        _line3View = [[UIView alloc] init];
        _line3View.backgroundColor = RGBColorHex(0xbbbbbb);
    }
    return _line3View;
}

- (UIButton *)confirmButton {
    if (_confirmButton == nil) {
        _confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _confirmButton.backgroundColor = RGBColorHex(0xd03e2f);
        [_confirmButton setTitle:@"确认修改" forState:UIControlStateNormal];
        _confirmButton.titleLabel.font = [UIFont systemFontOfSize:24];
        [_confirmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _confirmButton.layer.cornerRadius = 25;
        _confirmButton.clipsToBounds = YES;
        [_confirmButton addTarget:self action:@selector(confirmButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmButton;
}

- (void)confirmButtonDidClick
{
    NSString* used = _usedPasswordTextField.text;
    NSString* password = _passwordTextField.text;
    NSString* twoPassword = _twoPasswordTextField.text;
    
    if (kStringIsEmpty(used))
    {
        [SVProgressHUD showInfoWithStatus:@"请输入旧密码"];
        return;
    }
    if (kStringIsEmpty(password))
    {
        [SVProgressHUD showInfoWithStatus:@"请输入新密码"];
        return;
    }
    
    if (kStringIsEmpty(twoPassword))
    {
        [SVProgressHUD showInfoWithStatus:@"请再输入新密码"];
        return;
    }
    
    if ([password isEqualToString:twoPassword]==NO)
    {
        [SVProgressHUD showInfoWithStatus:@"两次密码不一致"];
        return;
    }
    
//    ZWeakSelf
//    [http_user FindPwd:nil password:password password2:twoPassword success:^(id responseObject)
//     {
//         [weakSelf sdData:responseObject];
//     } failure:^(NSError *error) {
//         [SVProgressHUD showErrorWithStatus:error.domain];
//     }];
}

//-(void)sdData:(id)responseObject
//{
//    [SVProgressHUD showSuccessWithStatus:@"修改成功"];
//    [self.navigationController popViewControllerAnimated:YES];
//}
@end
