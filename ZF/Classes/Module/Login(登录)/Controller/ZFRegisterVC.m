//
//  ZFRegisterVC.m
//  ZF
//
//  Created by apple on 2019/2/26.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFRegisterVC.h"
#import "ZFPhoneLoginVC.h"
#import "ZFRegisterVC.h"
#import "JKCountDownButton.h"
#import "LoginTypeView.h"

#import "UIButton+LXMImagePosition.h"
#import "ZFTool.h"
#import "http_user.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "UserInfoModel.h"
#import "CQCountDownButton.h"
#import "ZFLoginVC.h"
#import "ZFHomeVC.h"


@interface ZFRegisterVC ()<LoginTypeViewDelegate>

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIView *bg1View;
@property (nonatomic, strong) UIView *bg2View;
@property (nonatomic, strong) UIView *bg3View;
@property (nonatomic, strong) UIView *bg4View;
@property (nonatomic, strong) UIView *phoneView;
@property (nonatomic, strong) UIView *centerLine;

@property (nonatomic, strong) UIImageView* bjIconView;
@property (nonatomic, strong) UIView *center2Line;
@property (nonatomic, strong) UIView *center3Line;

@property (nonatomic, strong) UILabel *zhuceLabel;
@property (nonatomic, strong) UILabel *zhLabel;
@property (nonatomic, strong) UILabel *sjhLabel;
@property (nonatomic, strong) UILabel *yzmLabel;
@property (nonatomic, strong) UILabel *mimaLabel;
@property (nonatomic, strong) UILabel *zmimaLabel;
@property (nonatomic, strong) UITextField *numberTextField;
@property (nonatomic, strong) UITextField *phoneTextField;
@property (nonatomic, strong) UITextField *vcodeTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UITextField *zPasswordTextField;

@property (nonatomic, strong) UIButton *agreeButton;
@property (nonatomic, strong) UIButton *mAgreeButton;
@property (nonatomic, strong) UIButton *returnLoginButton;

@property (nonatomic, strong) CQCountDownButton* vcodeButton;

@end

@implementation ZFRegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
}


- (void)setupUI
{
    [self.view addSubview:self.bjIconView];
    [self.view addSubview:self.bgView];
    [self.view addSubview:self.bg1View];
    [self.view addSubview:self.bg2View];
    [self.view addSubview:self.bg3View];
    [self.view addSubview:self.bg4View];
    [self.view addSubview:self.zhuceLabel];
    [self.view addSubview:self.numberTextField];
    [self.view addSubview:self.phoneTextField];
    [self.view addSubview:self.vcodeTextField];
    [self.view addSubview:self.passwordTextField];
    [self.view addSubview:self.zPasswordTextField];
    [self.view addSubview:self.vcodeButton];
    
    [self.view addSubview:self.zhLabel];
    [self.view addSubview:self.sjhLabel];
    [self.view addSubview:self.yzmLabel];
    [self.view addSubview:self.mimaLabel];
    [self.view addSubview:self.zmimaLabel];

    [self.view addSubview:self.agreeButton];
    [self.view addSubview:self.mAgreeButton];
    [self.view addSubview:self.returnLoginButton];
    
    [_bjIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [_zhuceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.equalTo(self.view).offset(30);
//        make.top.equalTo(self.view).offset(5+LL_NavigationBarHeight);
    }];
    
    [_zhLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(42);
        make.centerY.equalTo(self->_bgView);
    }];
    
    [_sjhLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(24);
        make.centerY.equalTo(self->_bg1View);
    }];
    
    [_yzmLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(24);
        make.centerY.equalTo(self->_bg2View);

    }];
    
    [_mimaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(42);
        make.centerY.equalTo(self->_bg3View);
    }];
    
    [_zmimaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(8);
        make.centerY.equalTo(self->_bg4View);
    }];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_zhuceLabel.mas_bottom).offset(25);
        make.left.equalTo(self.view).offset(90);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(50);
    }];
    
    [_bg1View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_bgView.mas_bottom).offset(30);
        make.left.equalTo(self.view).offset(90);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(50);
    }];
    
    [_bg2View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_bg1View.mas_bottom).offset(20);
        make.left.equalTo(self.view).offset(90);
        make.width.mas_equalTo(158);
        make.height.mas_equalTo(50);
    }];
    
    [_bg3View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_bg2View.mas_bottom).offset(20);
        make.left.equalTo(self.view).offset(90);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(50);
    }];
    
    [_bg4View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_bg3View.mas_bottom).offset(20);
        make.left.equalTo(self.view).offset(90);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(50);
    }];
    
    [_numberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView).offset(12);
        make.top.bottom.equalTo(self->_bgView);
        make.right.mas_equalTo(-15);
    }];
    
    [_phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg1View).offset(12);
        make.top.bottom.equalTo(self->_bg1View);
        make.right.mas_equalTo(-15);
    }];
    
    [_vcodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg2View).offset(8);
        make.top.bottom.equalTo(self->_bg2View);
//        make.right.mas_equalTo(-15);
        make.width.mas_equalTo(154);
        make.height.mas_equalTo(40);
    }];
    
    [_vcodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_vcodeTextField.mas_right).offset(5);
        make.top.bottom.equalTo(self->_bg2View);
        make.right.mas_equalTo(-10);
        make.width.mas_equalTo(110);
        make.height.mas_equalTo(40);
    }];
    
    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg3View).offset(12);
        make.top.bottom.equalTo(self->_bg3View);
        make.right.mas_equalTo(-15);
    }];
    
    [_zPasswordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg4View).offset(12);
        make.top.bottom.equalTo(self->_bg4View);
        make.right.mas_equalTo(-15);
    }];
    
    [_agreeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_zPasswordTextField.mas_bottom).offset(30);
        make.left.equalTo(self.view).offset(112);
        make.right.equalTo(self.view).offset(-45);
    }];
    
    [_mAgreeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_agreeButton.mas_bottom).offset(27);
        make.left.equalTo(self.view).offset(15);
        make.right.equalTo(self.view).offset(-15);
        make.height.mas_equalTo(50);
    }];
    
    [_returnLoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_mAgreeButton.mas_bottom).offset(10);
        make.centerX.mas_equalTo(self.view);
    }];
    

}


//同意按钮被点击
- (void)agreeButtonDidClick:(UIButton *)sender
{
    sender.selected = !sender.isSelected;
    
}

-(void)zcButtonDidClick
{
    
}

-(void)returnLoginButtonDidClick
{
    ZFLoginVC* vc = [[ZFLoginVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (UILabel *)zhuceLabel {
    if (_zhuceLabel == nil) {
        _zhuceLabel = [[UILabel alloc] init];
        _zhuceLabel.textColor = RGBColorHex(0x333333);
        _zhuceLabel.font = [UIFont systemFontOfSize:24];
        _zhuceLabel.text = @"DC商城注册";
    }
    return _zhuceLabel;
}

- (UILabel *)zhLabel {
    if (_zhLabel == nil) {
        _zhLabel = [[UILabel alloc] init];
        _zhLabel.textColor = RGBColorHex(0x151515);
        _zhLabel.font = [UIFont systemFontOfSize:17];
        _zhLabel.text = @"账号:";
    }
    return _zhLabel;
}

- (UILabel *)sjhLabel {
    if (_sjhLabel == nil) {
        _sjhLabel = [[UILabel alloc] init];
        _sjhLabel.textColor = RGBColorHex(0x151515);
        _sjhLabel.font = [UIFont systemFontOfSize:17];
        _sjhLabel.text = @"手机号:";
    }
    return _sjhLabel;
}

- (UILabel *)yzmLabel {
    if (_yzmLabel == nil) {
        _yzmLabel = [[UILabel alloc] init];
        _yzmLabel.textColor = RGBColorHex(0x151515);
        _yzmLabel.font = [UIFont systemFontOfSize:17];
        _yzmLabel.text = @"验证码:";
    }
    return _yzmLabel;
}

- (UILabel *)mimaLabel {
    if (_mimaLabel == nil) {
        _mimaLabel = [[UILabel alloc] init];
        _mimaLabel.textColor = RGBColorHex(0x151515);
        _mimaLabel.font = [UIFont systemFontOfSize:17];
        _mimaLabel.text = @"密码:";
    }
    return _mimaLabel;
}

- (UILabel *)zmimaLabel {
    if (_zmimaLabel == nil) {
        _zmimaLabel = [[UILabel alloc] init];
        _zmimaLabel.textColor = RGBColorHex(0x151515);
        _zmimaLabel.font = [UIFont systemFontOfSize:17];
        _zmimaLabel.text = @"再输密码:";
    }
    return _zmimaLabel;
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

- (UITextField *)numberTextField {
    if (_numberTextField == nil) {
        _numberTextField = [[UITextField alloc] init];
        _numberTextField.placeholder = @"请输入账号";
        _numberTextField.font = [UIFont systemFontOfSize:14];
        _numberTextField.textColor = RGBColorHex(0x757575);
        _numberTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _numberTextField.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _numberTextField;
}

- (UITextField *)phoneTextField {
    if (_phoneTextField == nil) {
        _phoneTextField = [[UITextField alloc] init];
        _phoneTextField.placeholder = @"请输入手机号";
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
        _passwordTextField.placeholder = @"请输入密码";
        _passwordTextField.font = [UIFont systemFontOfSize:14];
        _passwordTextField.textColor = RGBColorHex(0x757575);
        _passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passwordTextField.keyboardType = UIKeyboardTypeNumberPad;
        _passwordTextField.secureTextEntry = YES;
    }
    return _passwordTextField;
}

- (UITextField *)zPasswordTextField {
    if (_zPasswordTextField == nil) {
        _zPasswordTextField = [[UITextField alloc] init];
        _zPasswordTextField.placeholder = @"请再输入密码";
        _zPasswordTextField.font = [UIFont systemFontOfSize:14];
        _zPasswordTextField.textColor = RGBColorHex(0x757575);
        _zPasswordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _zPasswordTextField.keyboardType = UIKeyboardTypeNumberPad;
        _zPasswordTextField.secureTextEntry = YES;
    }
    return _zPasswordTextField;
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

-(UIView *)bg4View
{
    if(_bg4View==nil)
    {
        _bg4View = [[UIView alloc]initWithFrame:CGRectZero];
        _bg4View.layer.borderWidth = 1.0f;
        _bg4View.layer.borderColor = RGBColorHex(0xBBBBBB).CGColor;
        _bg4View.layer.cornerRadius = 4.0f;
    }
    return _bg4View;
}


- (UIImageView *)bjIconView {
    if (_bjIconView == nil) {
        _bjIconView = [[UIImageView alloc] init];
        _bjIconView.image = [UIImage imageNamed:@"yemian"];
    }
    return _bjIconView;
}

- (UIButton *)agreeButton {
    if (_agreeButton == nil) {
        _agreeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_agreeButton setTitle:@"我已经阅读并同意《服务协议》" forState:UIControlStateNormal];
        [_agreeButton setImage:[UIImage imageNamed:@"gx"] forState:UIControlStateNormal];
        [_agreeButton setImage:[UIImage imageNamed:@"gx5"] forState:UIControlStateSelected];
        [_agreeButton setTitleColor:RGBColorHex(0x101010) forState:UIControlStateNormal];
        _agreeButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_agreeButton setImagePosition:LXMImagePositionLeft spacing:5];
        [_agreeButton addTarget:self action:@selector(agreeButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _agreeButton;
}


- (UIButton *)mAgreeButton {
    if (_mAgreeButton == nil) {
        _mAgreeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _mAgreeButton.backgroundColor = RGBColorHex(0xFF4200);
        [_mAgreeButton setTitle:@"同意协议并注册" forState:UIControlStateNormal];
        _mAgreeButton.titleLabel.font = [UIFont systemFontOfSize:24];
        [_mAgreeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _mAgreeButton.layer.cornerRadius = 3;
        _mAgreeButton.clipsToBounds = YES;
        [_mAgreeButton addTarget:self action:@selector(mAgreeButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _mAgreeButton;
}

- (UIButton *)returnLoginButton {
    if (_returnLoginButton == nil) {
        _returnLoginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_returnLoginButton setTitle:@"返回登录" forState:UIControlStateNormal];
        _returnLoginButton.titleLabel.font = [UIFont systemFontOfSize:18];
        [_returnLoginButton setTitleColor:RGBColorHex(0x266CE8) forState:UIControlStateNormal];
        [_returnLoginButton addTarget:self action:@selector(returnLoginButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _returnLoginButton;
}

- (void)mAgreeButtonDidClick
{
    NSString* name = _numberTextField.text;
    NSString* phone = _phoneTextField.text;
    NSString* vcode = _vcodeTextField.text;
    NSString* password = _passwordTextField.text;
    NSString* twoPassword = _zPasswordTextField.text;
    
    if (kStringIsEmpty(name))
    {
        [SVProgressHUD showInfoWithStatus:@"请输入账号"];
        return;
    }
    
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
    [SVProgressHUD showWithStatus:@"正在注册"];
    self.userInfo = [[UserInfoModel alloc]init];
    self.userInfo.nickname = name;
    self.userInfo.mobile = phone;
    self.userInfo.password = password;
    self.userInfo.password2 = twoPassword;
    self.userInfo.code = vcode;
    [http_user userReg:self.userInfo success:^(id responseObject)
     {
         [weakSelf sdData:responseObject];
     } failure:^(NSError *error) {
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
}

-(void)sdData:(id)responseObject
{
    [SVProgressHUD showSuccessWithStatus:@"注册成功"];
    
    [self toLogin:self.userInfo.mobile password:self.userInfo.password];
}


- (void)vcodeButtonDidClick
{
    NSString* phone = _phoneTextField.text;
    
    ZWeakSelf
    [http_user validateCode:nil scene:@"1" mobile:phone success:^(id responseObject)
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

//登录
-(void)toLogin:(NSString*)username password:(NSString*)password
{
    ZWeakSelf
    [SVProgressHUD showWithStatus:@"正在登录"];
    [http_user login:username password:password success:^(id responseObject)
     {
         [SVProgressHUD showSuccessWithStatus:@"登录成功"];
         [weakSelf toLogin_ok:responseObject];
     } failure:^(NSError *error) {
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
}

-(void)toLogin_ok:(id)responseObject
{
    if(kObjectIsEmpty(responseObject))
    {
        return;
    }
    
    UserInfoModel* user = [UserInfoModel mj_objectWithKeyValues:responseObject];
    [user saveUserInfo];
    
    //登录成功通知
    [[NSNotificationCenter defaultCenter] postNotificationName:UserLoginRegisterNotification object:self];
    
}

@end
