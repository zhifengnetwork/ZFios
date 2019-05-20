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
#import "ZFTool.h"
#import "http_user.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "UserInfoModel.h"
#import "CQCountDownButton.h"

@interface ZFAccountModificationVC ()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIView *bg1View;
@property (nonatomic, strong) UIView *bg2View;
@property (nonatomic, strong) UIView *bg3View;

//@property (nonatomic, strong) UIImageView* vcodeView;
@property (nonatomic, strong) UIImageView* iconView;

@property (nonatomic, strong) UILabel *phoneLabel;
@property (nonatomic, strong) UITextField *phoneTextField;
@property (nonatomic, strong) UITextField *vcodeTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UITextField *twoPasswordTextField;
//@property (nonatomic, strong) UITextField *verificationTextField;

@property (nonatomic, strong) UIButton *loginButton;

@property (nonatomic, strong) CQCountDownButton* vcodeButton;

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
    [self.view addSubview:self.bg3View];
    [self.view addSubview:self.phoneLabel];
    [self.view addSubview:self.phoneTextField];
    [self.view addSubview:self.vcodeTextField];
    [self.view addSubview:self.passwordTextField];
    [self.view addSubview:self.twoPasswordTextField];
//    [self.view addSubview:self.verificationTextField];
   
    [self.view addSubview:self.iconView];
//    [self.view addSubview:self.vcodeView];
    
    [self.view addSubview:self.loginButton];
    [self.view addSubview:self.vcodeButton];
    
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.equalTo(self.view).offset(30);
//        make.top.equalTo(self.view).offset(39+LL_NavigationBarHeight);
        // make.left.equalTo(self).offset(26);
    }];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_phoneLabel.mas_bottom).offset(40);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(50);
    }];
    
    
    [_bg1View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_bgView.mas_bottom).offset(20);
        make.left.equalTo(self.view).offset(10);
        make.width.mas_equalTo(230);
        make.height.mas_equalTo(50);
    }];
    
    [_bg2View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_bg1View.mas_bottom).offset(20);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(50);
    }];
    
    [_bg3View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_bg2View.mas_bottom).offset(20);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
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
        make.width.mas_equalTo(154);
        make.height.mas_equalTo(40);
    }];
    
    [_vcodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_vcodeTextField.mas_right).offset(5);
        make.top.bottom.equalTo(self->_bg1View);
        make.right.mas_equalTo(-10);
        make.width.mas_equalTo(110);
        make.height.mas_equalTo(40);
    }];
    
    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg2View.mas_left).offset(8);
        make.top.bottom.equalTo(self->_bg2View);
        make.right.mas_equalTo(-165);
    }];
    
    [_twoPasswordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg3View.mas_left).offset(8);
        make.top.bottom.equalTo(self->_bg3View);
        make.right.mas_equalTo(-165);
    }];
    
        
//    [_verificationTextField mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self->_bg2View).offset(8);
//        make.top.bottom.equalTo(self->_bg2View);
//        make.right.mas_equalTo(-165);
//    }];
    
//    [_vcodeView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self->_vcodeTextField.mas_right).offset(5);
//        make.top.bottom.equalTo(self->_bg2View);
//        make.right.mas_equalTo(-15);
//        make.width.mas_equalTo(137);
//        make.height.mas_equalTo(50);
//
//    }];
    
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_twoPasswordTextField.mas_bottom).offset(30);
        make.left.equalTo(self.view).offset(15);
        make.right.equalTo(self.view).offset(-15);
        make.height.mas_equalTo(50);
    }];
    
}

- (UILabel *)phoneLabel {
    if (_phoneLabel == nil) {
        _phoneLabel = [[UILabel alloc] init];
        _phoneLabel.textColor = RGBColorHex(0x333333);
        _phoneLabel.font = [UIFont systemFontOfSize:24];
        _phoneLabel.text = @"DC商城账户修改";
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

- (UITextField *)passwordTextField {
    if (_passwordTextField == nil) {
        _passwordTextField = [[UITextField alloc] init];
        _passwordTextField.placeholder = @"请输入重置密码";
        _passwordTextField.font = [UIFont systemFontOfSize:14];
        _passwordTextField.textColor = RGBColorHex(0x757575);
        _passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passwordTextField.keyboardType = UIKeyboardTypeASCIICapable;
    }
    return _passwordTextField;
}

- (UITextField *)twoPasswordTextField{
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


//- (UITextField *)verificationTextField {
//    if (_verificationTextField == nil) {
//        _verificationTextField = [[UITextField alloc] init];
//        _verificationTextField.placeholder = @"其他验证方式";
//        _verificationTextField.font = [UIFont systemFontOfSize:14];
//        _verificationTextField.textColor = RGBColorHex(0x757575);
//        _verificationTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
//        _verificationTextField.keyboardType = UIKeyboardTypeNumberPad;
//    }
//    return _verificationTextField;
//}



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

-(UIView *)bg3View
{
    if(_bg3View==nil)
    {
        _bg3View = [[UIView alloc]initWithFrame:CGRectZero];
        _bg3View.layer.borderWidth = 1.0f;
        _bg3View.layer.borderColor = RGBColorHex(0xBBBBBB).CGColor;
        _bg3View.layer.cornerRadius = 4.0f;
    }
    return _bg3View;
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

//- (UIImageView *)vcodeView {
//    if (_vcodeView == nil) {
//        _vcodeView = [[UIImageView alloc] init];
//        _vcodeView.layer.borderWidth = 1.0f;
//        _vcodeView.layer.borderColor = RGBColorHex(0xBBBBBB).CGColor;
//        _vcodeView.image = [UIImage imageNamed:@"icon_login_bgk"];
//        _vcodeView.clipsToBounds = YES;
//        _vcodeView.layer.cornerRadius = 3.0f;
//    }
//    return _vcodeView;
//}

- (UIButton *)loginButton {
    if (_loginButton == nil) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginButton.backgroundColor = RGBColorHex(0xFF4200);
        [_loginButton setTitle:@"点击修改" forState:UIControlStateNormal];
        _loginButton.titleLabel.font = [UIFont systemFontOfSize:24];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _loginButton.layer.cornerRadius = 3;
        _loginButton.clipsToBounds = YES;
        [_loginButton addTarget:self action:@selector(loginButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}


- (void)loginButtonDidClick
{
    NSString* phone = _phoneTextField.text;
    NSString* vcode = _vcodeTextField.text;
    NSString* password = _passwordTextField.text;
    NSString* twoPassword = _twoPasswordTextField.text;
    
    if (kStringIsEmpty(phone))
    {
        [SVProgressHUD showInfoWithStatus:@"请输入手机号"];
        return;
    }
    
    if ( [ZFTool isPhoneNumber:phone]==NO )
    {
        [SVProgressHUD showInfoWithStatus:@"请输入正确的手机号码"];
        return;
    }
    
    if (kStringIsEmpty(vcode))
    {
        [SVProgressHUD showInfoWithStatus:@"请输入验证码"];
        return;
    }
    if (kStringIsEmpty(password))
    {
        [SVProgressHUD showInfoWithStatus:@"请输入密码"];
        return;
    }
    
    if (kStringIsEmpty(twoPassword))
    {
        [SVProgressHUD showInfoWithStatus:@"请再输入密码"];
        return;
    }
    
    if ([password isEqualToString:twoPassword]==NO)
    {
        [SVProgressHUD showInfoWithStatus:@"两次密码不一致"];
        return;
    }
    
    ZWeakSelf
    [http_user FindPwdCheckSms:phone code:vcode success:^(id responseObject)
     {
         [weakSelf sdData:responseObject];
     } failure:^(NSError *error) {
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
}

-(void)sdData:(id)responseObject
{
    ZFResetPasswordVC* vc = [[ZFResetPasswordVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)vcodeButtonDidClick
{
    NSString* phone = _phoneTextField.text;
    
    ZWeakSelf
    [http_user validateCode:nil scene:@"2" mobile:phone success:^(id responseObject)
     {
         [weakSelf verifycode_ok:responseObject];
         
     } failure:^(NSError *error) {
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
}

-(void)verifycode_ok:(id)responseObject
{
    [SVProgressHUD showSuccessWithStatus:@"发送成功"];
    
}

- (CQCountDownButton *)vcodeButton
{
    if (_vcodeButton == nil) {
        _vcodeButton = [CQCountDownButton buttonWithType:UIButtonTypeCustom];
        [_vcodeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
        _vcodeButton.backgroundColor = RGBColorHex(0x646464);
        [_vcodeButton setTitleColor:RGBColorHex(0xFFFFFF) forState:UIControlStateNormal];
        _vcodeButton.titleLabel.font = [UIFont systemFontOfSize:12];
        _vcodeButton.layer.cornerRadius = 3.0f;
        _vcodeButton.clipsToBounds = YES;
        //        [_vcodeButton addTarget:self action:@selector(vcodeButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
        __weak typeof(self) weakSelf = self;
        [_vcodeButton configDuration:60 buttonClicked:^{
            //========== 按钮点击 ==========//
            if ( kStringIsEmpty(weakSelf.phoneTextField.text) )
            {
                [SVProgressHUD showInfoWithStatus:@"请输入手机号码"];
                weakSelf.vcodeButton.enabled = YES;
                return;
            }
            
            if ( [ZFTool isPhoneNumber:weakSelf.phoneTextField.text]==NO )
            {
                [SVProgressHUD showInfoWithStatus:@"请输入正确的手机号码"];
                weakSelf.vcodeButton.enabled = YES;
                return;
            }
            
            [weakSelf.vcodeButton startCountDown];
            [weakSelf vcodeButtonDidClick];
        } countDownStart:^{
            //========== 倒计时开始 ==========//
            NSLog(@"倒计时开始");
        } countDownUnderway:^(NSInteger restCountDownNum) {
            //========== 倒计时进行中 ==========//
            NSString *title = [NSString stringWithFormat:@"%ldS", restCountDownNum];
            [weakSelf.vcodeButton setTitle:title forState:UIControlStateNormal];
        } countDownCompletion:^{
            //========== 倒计时结束 ==========//
            [weakSelf.vcodeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
            NSLog(@"倒计时结束");
        }];
    }
    return _vcodeButton;
}


@end
