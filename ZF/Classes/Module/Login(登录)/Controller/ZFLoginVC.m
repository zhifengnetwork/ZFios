//
//  ZFLoginVC.m
//  ZF
//
//  Created by apple on 2019/02/25.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFLoginVC.h"
#import "ZFPhoneLoginVC.h"
#import "ZFRegisterVC.h"
#import "JKCountDownButton.h"
#import "LoginTypeView.h"
#import "ZFRegisterVC.h"
#import "ZFAccountModificationVC.h"
#import "ZFTool.h"
#import "http_user.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "UserInfoModel.h"
#import "PooCodeView.h"
#import "ZFJumpVCTool.h"


@interface ZFLoginVC ()<LoginTypeViewDelegate>

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIView *bg1View;
@property (nonatomic, strong) UIView *bg2View;
@property (nonatomic, strong) UIView *phoneView;
@property (nonatomic, strong) UIView *centerLine;

@property (nonatomic, strong) UIImageView* bjIconView;
@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UIImageView* icon2View;
@property (nonatomic, strong) UIView *center2Line;
@property (nonatomic, strong) UIView *center3Line;

@property (nonatomic, strong) UILabel *phoneLabel;
@property (nonatomic, strong) UITextField *phoneTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UITextField *vcodeTextField;
//@property (nonatomic, strong) JKCountDownButton *vcodeButton;


@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *wmButton;
@property (nonatomic, strong) UIButton *zcButton;

@property (nonatomic, strong) LoginTypeView *typeView;

@property (nonatomic, strong) UIButton *testButton;
@property (nonatomic, strong) PooCodeView *codeView;

@end

@implementation ZFLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [ZFTool isHiddenNavigationBarSeparatorLine:YES vc:self];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}



- (void)setupUI
{
    [self.view addSubview:self.bjIconView];
    [self.view addSubview:self.bgView];
    [self.view addSubview:self.bg1View];
    [self.view addSubview:self.bg2View];
    [self.view addSubview:self.phoneLabel];
    [self.view addSubview:self.phoneView];
    [self.view addSubview:self.centerLine];
    [self.view addSubview:self.phoneTextField];
    [self.view addSubview:self.passwordTextField];
    [self.view addSubview:self.vcodeTextField];
    [self.view addSubview:self.center2Line];
    [self.view addSubview:self.center3Line];
    [self.view addSubview:self.centerLine];
    [self.view addSubview:self.iconView];
    [self.view addSubview:self.icon2View];
    
    [self.view addSubview:self.loginButton];
    [self.view addSubview:self.wmButton];
    [self.view addSubview:self.zcButton];
    [self.view addSubview:self.typeView];
    [self.view addSubview:self.codeView];
    
    [_bjIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.equalTo(self.view).offset(39+LL_NavigationBarHeight);
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
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(50);
    }];
    
    [_bg2View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_bg1View.mas_bottom).offset(20);
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
    
    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg1View).offset(30);
        make.top.bottom.equalTo(self->_bg1View);
        make.right.mas_equalTo(-15);
    }];
    
    [_vcodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg2View).offset(8);
        make.top.bottom.equalTo(self->_bg2View);
        make.right.mas_equalTo(-165);
    }];
    
    [_codeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_vcodeTextField.mas_right).offset(5);
        make.top.bottom.equalTo(self->_bg2View);
        make.right.mas_equalTo(-15);
        make.width.mas_equalTo(137);
        make.height.mas_equalTo(50);
        
    }];
    
    [_icon2View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.equalTo(self->_bg1View);
    }];
    
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_vcodeTextField.mas_bottom).offset(30);
        make.left.equalTo(self.view).offset(15);
        make.right.equalTo(self.view).offset(-15);
        make.height.mas_equalTo(50);
    }];
    
    [_wmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(40);
        make.top.equalTo(self->_loginButton.mas_bottom).offset(5);
    }];
    
    [_zcButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-35);
        make.top.equalTo(self->_loginButton.mas_bottom).offset(5);
    }];
    
    [_typeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_bottom).offset(-148);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(100);
    }];
    
#ifdef APP_TEST
    [self.view addSubview:self.testButton];
    [_testButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(50);
        make.right.mas_equalTo(-20);
    }];
#else
    
#endif
    
}

//登录按钮被点击
- (void)loginButtonDidClick
{
    NSString* username = _phoneTextField.text;
    NSString* passwd = _passwordTextField.text;
    NSString* code = _vcodeTextField.text;
    NSString *codeTwo = _codeView.changeString;
    
    if (kStringIsEmpty(username))
    {
        [SVProgressHUD showInfoWithStatus:@"请输入手机号"];
        return;
    }
    if ( [ZFTool isPhoneNumber:username]==NO )
    {
        [SVProgressHUD showInfoWithStatus:@"请输入正确的手机号码"];
        return;
    }
    
    if (kStringIsEmpty(passwd))
    {
        [SVProgressHUD showInfoWithStatus:@"请输入您的登录密码"];
        return;
    }
    if (kStringIsEmpty(code))
    {
        [SVProgressHUD showInfoWithStatus:@"请输入验证码"];
        return;
    }
    
    //都转成大写后再比较
    NSString* codeD = [code uppercaseString];
    NSString *codeTwoD = [codeTwo uppercaseString];
    
    if( [codeD isEqualToString: codeTwoD]==NO)
    {
        [SVProgressHUD showInfoWithStatus:@"请输入正确的验证码"];
        //刷新
        [self.codeView changeCode];
        return;
    }
    
    [self toLogin:username password:passwd];
}

//忘记密码按钮被点击
-(void)wmButtonDidClick
{
    ZFAccountModificationVC* vc = [[ZFAccountModificationVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

//注册按钮被点击
-(void)zcButtonDidClick
{
    ZFRegisterVC* vc = [[ZFRegisterVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)testButtonDidClick
{
    NSString* username = @"13516565558";
    NSString* passwd = @"123456";
    [self toLogin:username password:passwd];
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



- (UILabel *)phoneLabel {
    if (_phoneLabel == nil) {
        _phoneLabel = [[UILabel alloc] init];
        _phoneLabel.textColor = RGBColorHex(0x333333);
        _phoneLabel.font = [UIFont systemFontOfSize:24];
        _phoneLabel.text = @"智丰商城账号登录";
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
        _phoneTextField.font = [UIFont systemFontOfSize:14];
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
        _passwordTextField.font = [UIFont systemFontOfSize:14];
        _passwordTextField.textColor = RGBColorHex(0x333333);
        _passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passwordTextField.keyboardType = UIKeyboardTypeNumberPad;
        _passwordTextField.secureTextEntry = YES;
    }
    return _passwordTextField;
}

- (UITextField *)vcodeTextField {
    if (_vcodeTextField == nil) {
        _vcodeTextField = [[UITextField alloc] init];
        _vcodeTextField.placeholder = @"图像验证码不区分大小写";
        _vcodeTextField.font = [UIFont systemFontOfSize:14];
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


- (UIImageView *)bjIconView {
    if (_bjIconView == nil) {
        _bjIconView = [[UIImageView alloc] init];
        _bjIconView.image = [UIImage imageNamed:@"yemian"];
    }
    return _bjIconView;
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"sou"];
        _iconView.clipsToBounds = YES;
        _iconView.layer.cornerRadius = 3.0f;
    }
    return _iconView;
}

- (UIImageView *)icon2View {
    if (_icon2View == nil) {
        _icon2View = [[UIImageView alloc] init];
        _icon2View.image = [UIImage imageNamed:@"shouji"];
        _icon2View.clipsToBounds = YES;
        _icon2View.layer.cornerRadius = 3.0f;
    }
    return _icon2View;
}

- (UIButton *)loginButton {
    if (_loginButton == nil) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginButton.backgroundColor = RGBColorHex(0xFF4200);
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        _loginButton.titleLabel.font = [UIFont systemFontOfSize:17];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _loginButton.layer.cornerRadius = 4;
        _loginButton.clipsToBounds = YES;
        [_loginButton addTarget:self action:@selector(loginButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}

- (UIButton *)wmButton {
    if (_wmButton == nil) {
        _wmButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_wmButton setTitle:@"忘记密码" forState:UIControlStateNormal];
        _wmButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_wmButton setTitleColor:RGBColorHex(0x646464) forState:UIControlStateNormal];
        [_wmButton addTarget:self action:@selector(wmButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _wmButton;
}

- (UIButton *)zcButton {
    if (_zcButton == nil) {
        _zcButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_zcButton setTitle:@"注册" forState:UIControlStateNormal];
        _zcButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_zcButton setTitleColor:RGBColorHex(0x266CE8) forState:UIControlStateNormal];
        [_zcButton addTarget:self action:@selector(zcButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _zcButton;
}

-(LoginTypeView*)typeView
{
    if (_typeView==nil)
    {
        _typeView = [[LoginTypeView alloc]initWithFrame:CGRectZero];
        _typeView.delegate = self;
    }
    
    return _typeView;
}

/**
 登录类型view按扭被点击
 
 @param type 2:微信 1:QQ 3:新浪 4:手机
 */
- (void)LoginTypeViewDidClick:(int)type
{
    [ZFJumpVCTool to_ThirdpartyLogin:type srcVC:self];
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

- (UIButton *)testButton {
    if (_testButton == nil) {
        _testButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_testButton setTitle:@"测试账号" forState:UIControlStateNormal];
        [_testButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_testButton addTarget:self action:@selector(testButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _testButton;
}

-(PooCodeView *)codeView
{
    if (_codeView==nil) {
        _codeView = [[PooCodeView alloc]initWithFrame:CGRectMake(0, 0, 120, 50) andChangeArray:nil];
    }
    
    return _codeView;
}

@end
