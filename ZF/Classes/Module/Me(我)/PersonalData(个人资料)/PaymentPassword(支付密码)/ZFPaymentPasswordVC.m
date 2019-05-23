//
//  ZFPaymentPasswordVC.m
//  ZF
//
//  Created by admin on 2019/5/23.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFPaymentPasswordVC.h"
#import "JKCountDownButton.h"
#import "ZFResetPasswordVC.h"
#import "ZFTool.h"
#import "http_user.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "UserInfoModel.h"
#import "CQCountDownButton.h"

@interface ZFPaymentPasswordVC ()

@property (nonatomic, strong) UILabel *passwordLabel;

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIView *bg1View;
@property (nonatomic, strong) UIView *bg2View;
@property (nonatomic, strong) UIView* lineView;

@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel *phoneLabel;
@property (nonatomic, strong) UILabel *codeLabel;

@property (nonatomic, strong) UITextField *vcodeTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UITextField *twoPasswordTextField;

@property (nonatomic, strong) UIButton *submissionButton;

@property (nonatomic, strong) CQCountDownButton* vcodeButton;

@end

@implementation ZFPaymentPasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"重置支付密码";
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
}



- (void)setupUI
{
    [self.view addSubview:self.passwordLabel];
    [self.view addSubview:self.bgView];
    [self.view addSubview:self.bg1View];
    [self.view addSubview:self.bg2View];
    [self.view addSubview:self.lineView];
    [self.view addSubview:self.iconView];
    [self.view addSubview:self.phoneLabel];
    [self.view addSubview:self.codeLabel];
    [self.view addSubview:self.vcodeTextField];
    [self.view addSubview:self.passwordTextField];
    [self.view addSubview:self.twoPasswordTextField];
    [self.view addSubview:self.submissionButton];
    [self.view addSubview:self.vcodeButton];
    
    [_passwordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.equalTo(self.view).offset(30);
    }];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(25);
        make.top.equalTo(self->_passwordLabel.mas_bottom).offset(40);
    }];
    
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(20);
        make.top.equalTo(self->_passwordLabel.mas_bottom).offset(42);
    }];
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_iconView.mas_bottom).offset(15);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(0.5f);
    }];
    
    [_codeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.equalTo(self->_lineView.mas_bottom).offset(30);
    }];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_lineView.mas_bottom).offset(20);
        make.left.equalTo(self.view).offset(90);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(40);
    }];
    
    [_bg1View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_bgView.mas_bottom).offset(20);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(40);
    }];
    
    [_bg2View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_bg1View.mas_bottom).offset(20);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(40);
    }];
   
    [_vcodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(10);
        make.top.bottom.equalTo(self->_bgView);
        make.right.equalTo(self->_vcodeButton.mas_left).offset(-15);
    }];
    
    [_vcodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_vcodeTextField.mas_right).offset(5);
        make.right.equalTo(self->_bgView.mas_right).offset(-5);
        make.centerY.equalTo(self->_bgView);
        make.width.mas_equalTo(90);
        make.height.mas_equalTo(30);
    }];
    
    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg1View.mas_left).offset(10);
        make.top.bottom.equalTo(self->_bg1View);
        make.right.mas_equalTo(-15);
    }];
    
    [_twoPasswordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg2View.mas_left).offset(10);
        make.top.bottom.equalTo(self->_bg2View);
        make.right.mas_equalTo(-15);
    }];
    
    [_submissionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_twoPasswordTextField.mas_bottom).offset(30);
        make.left.equalTo(self.view).offset(15);
        make.right.equalTo(self.view).offset(-15);
        make.height.mas_equalTo(50);
    }];
    
    _phoneLabel.text = self.userInfo.mobile;
}

- (UILabel *)passwordLabel {
    if (_passwordLabel == nil) {
        _passwordLabel = [[UILabel alloc] init];
        _passwordLabel.textColor = RGBColorHex(0x333333);
        _passwordLabel.font = [UIFont systemFontOfSize:24];
        _passwordLabel.text = @"短信重置支付密码";
    }
    return _passwordLabel;
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"shouji"];
    }
    return _iconView;
}

- (UILabel *)phoneLabel {
    if (_phoneLabel == nil) {
        _phoneLabel = [[UILabel alloc] init];
        _phoneLabel.textColor = RGBColorHex(0x151515);
        _phoneLabel.font = [UIFont systemFontOfSize:14];
        _phoneLabel.text = @"13222222222";
    }
    return _phoneLabel;
}

- (UIView *)lineView {
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = RGBColorHex(0xbbbbbb);
    }
    return _lineView;
}

- (UILabel *)codeLabel {
    if (_codeLabel == nil) {
        _codeLabel = [[UILabel alloc] init];
        _codeLabel.textColor = RGBColorHex(0x333333);
        _codeLabel.font = [UIFont systemFontOfSize:18];
        _codeLabel.text = @"验证码:";
    }
    return _codeLabel;
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
        _passwordTextField.secureTextEntry = YES;
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
        _twoPasswordTextField.secureTextEntry = YES;
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

- (UIButton *)submissionButton {
    if (_submissionButton == nil) {
        _submissionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _submissionButton.backgroundColor = RGBColorHex(0xFF4200);
        [_submissionButton setTitle:@"提交" forState:UIControlStateNormal];
        _submissionButton.titleLabel.font = [UIFont systemFontOfSize:24];
        [_submissionButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _submissionButton.layer.cornerRadius = 3;
        _submissionButton.clipsToBounds = YES;
        [_submissionButton addTarget:self action:@selector(submissionButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _submissionButton;
}


- (void)submissionButtonDidClick
{
    NSString* vcode = _vcodeTextField.text;
    NSString* password = _passwordTextField.text;
    NSString* twoPassword = _twoPasswordTextField.text;
    
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
    [http_user FindPwdCheckSms:self.userInfo.mobile code:vcode success:^(id responseObject)
     {
         [weakSelf sdData:responseObject];
     } failure:^(NSError *error) {
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
}

-(void)sdData:(id)responseObject
{
    NSString* password = _passwordTextField.text;
    NSString* twoPassword = _twoPasswordTextField.text;
    
    ZWeakSelf
    [http_user FindPwd:self.userInfo.mobile password:password password2:twoPassword success:^(id responseObject)
     {
         [weakSelf sdData2:responseObject];
     } failure:^(NSError *error) {
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
}

-(void)sdData2:(id)responseObject
{
    [SVProgressHUD showSuccessWithStatus:@"修改成功"];
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)vcodeButtonDidClick
{
    ZWeakSelf
    [http_user validateCode:nil scene:@"2" mobile:self.userInfo.mobile success:^(id responseObject)
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
//            if ( kStringIsEmpty(weakSelf.phoneTextField.text) )
//            {
//                [SVProgressHUD showInfoWithStatus:@"请输入手机号码"];
//                weakSelf.vcodeButton.enabled = YES;
//                return;
//            }
//
//            if ( [ZFTool isPhoneNumber:weakSelf.phoneTextField.text]==NO )
//            {
//                [SVProgressHUD showInfoWithStatus:@"请输入正确的手机号码"];
//                weakSelf.vcodeButton.enabled = YES;
//                return;
//            }
            
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
