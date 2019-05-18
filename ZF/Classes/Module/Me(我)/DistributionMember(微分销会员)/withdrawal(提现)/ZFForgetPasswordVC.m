//
//  ZFForgetPasswordVC.m
//  ZF
//
//  Created by weiming zhang on 2019/5/18.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFForgetPasswordVC.h"
#import "CQCountDownButton.h"
#import "http_user.h"
#import "SVProgressHUD.h"
#import "JKCountDownButton.h"
#import "ZFTool.h"
#import "MJExtension.h"
#import "UserInfoModel.h"
#import "ZFRePayPassWordVC.h"
#import "UIImageView+WebCache.h"
#import "UIButton+LXMImagePosition.h"

@interface ZFForgetPasswordVC()
@property (nonatomic, strong)UIImageView *iconImageView;
@property (nonatomic, strong)UILabel *phoneLabel;
@property (nonatomic, strong)UILabel *vcodeLabel;
@property (nonatomic, strong)UITextField *vcodeTF;
@property (nonatomic, strong)CQCountDownButton *vcodeButton;
@property (nonatomic, strong)UIButton *agreeButton;

@property (nonatomic, strong) UserInfoModel *userInfo;

@end
@implementation ZFForgetPasswordVC

- (void)viewDidLoad{
    self.title = @"短信修改支付密码";
    [self setup];
}

- (void)setup{
    [self.view addSubview:self.iconImageView];
    [self.view addSubview:self.phoneLabel];
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = RGBColorHex(0xcccccc);
    [self.view addSubview:lineView];
    [self.view addSubview:self.vcodeLabel];
    [self.view addSubview:self.vcodeTF];
    [self.view addSubview:self.vcodeButton];
    [self.view addSubview:self.agreeButton];
    
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(30);
        make.top.equalTo(self.view).with.offset(40);
    }];
    
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).with.offset(20);
        make.centerY.equalTo(self.iconImageView.mas_centerY);
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImageView.mas_bottom).with.offset(12);
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.height.mas_equalTo(1);
    }];
    
    [_vcodeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).with.offset(30);
        make.left.equalTo(lineView.mas_left);
    }];
    
    [_vcodeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(70);
        make.centerY.equalTo(self.vcodeLabel.mas_centerY);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(25);
    }];
    
    [_vcodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.vcodeTF.mas_right).with.offset(20);
        make.centerY.equalTo(self.vcodeTF.mas_centerY);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(25);
    }];
    
    [_agreeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.vcodeTF.mas_bottom).with.offset(50);
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.height.mas_equalTo(38);
    }];
    ZWeakSelf
    [http_user userinfo:^(id responseObject)
     {
         [weakSelf loadData_ok:responseObject];
         
     } failure:^(NSError *error) {
         
         [SVProgressHUD showInfoWithStatus:error.domain];
     }];
    
}

//加载数据完成
-(void)loadData_ok:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    
    //jsonToModel
    self.userInfo = [UserInfoModel mj_objectWithKeyValues:responseObject];
    
    self.phoneLabel.text = [NSString stringWithFormat:@"%@",self.userInfo.mobile];
    
}

- (UIImageView *)iconImageView{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc]init];
        _iconImageView.image = [UIImage imageNamed:@"shouji"];
    }return _iconImageView;
}

- (UILabel *)phoneLabel{
    if (_phoneLabel == nil) {
        _phoneLabel = [[UILabel alloc]init];
        _phoneLabel.font = [UIFont systemFontOfSize:14];
        _phoneLabel.textColor = [UIColor blackColor];
        _phoneLabel.text = @"erwqrewrwe";
    }return _phoneLabel;
}

- (UILabel *)vcodeLabel{
    if (_vcodeLabel == nil) {
        _vcodeLabel = [[UILabel alloc]init];
        _vcodeLabel.font = [UIFont systemFontOfSize:14];
        _vcodeLabel.textColor = [UIColor blackColor];
        _vcodeLabel.text =@"验证码：";
    }return _vcodeLabel;
}

- (UITextField *)vcodeTF{
    if (_vcodeTF == nil) {
        _vcodeTF = [[UITextField alloc]init];
        _vcodeTF.placeholder = @"请输入验证码";
        _vcodeTF.layer.borderColor = RGBColorHex(0xcccccc).CGColor;
        _vcodeTF.layer.borderWidth =1;
    }return _vcodeTF;
}

- (UIButton *)agreeButton {
    if (_agreeButton == nil) {
        _agreeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _agreeButton.backgroundColor = RGBColorHex(0xFF4200);
        [_agreeButton setTitle:@"下一步" forState:UIControlStateNormal];
        _agreeButton.titleLabel.font = [UIFont systemFontOfSize:24];
        [_agreeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _agreeButton.layer.cornerRadius = 3;
        _agreeButton.clipsToBounds = YES;
        [_agreeButton addTarget:self action:@selector(loginButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _agreeButton;
}

- (void)loginButtonDidClick
{
    NSString* phone = self.phoneLabel.text;
    NSString* vcode = _vcodeTF.text;

    
    if (kStringIsEmpty(vcode))
    {
        [SVProgressHUD showInfoWithStatus:@"请输入验证码"];
        return;
    }
    
    ZWeakSelf
    [http_user FindPwdCheckSms:phone code:vcode scene:6 success:^(id responseObject)
     {
         [weakSelf sdData:responseObject];
     } failure:^(NSError *error) {
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
}

-(void)sdData:(id)responseObject
{
    ZFRePayPassWordVC* vc = [[ZFRePayPassWordVC alloc]init];
    vc.phoneNumber = self.userInfo.mobile;
    [self.navigationController presentViewController:vc animated:YES completion:nil];
}


- (void)vcodeButtonDidClick
{
    NSString* phone = self.phoneLabel.text;

    ZWeakSelf
    [http_user validateCode:nil scene:@"6" mobile:phone success:^(id responseObject)
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
            if ( kStringIsEmpty(weakSelf.phoneLabel.text) )
            {
                [SVProgressHUD showInfoWithStatus:@"请输入手机号码"];
                weakSelf.vcodeButton.enabled = YES;
                return;
            }

            if ( [ZFTool isPhoneNumber:weakSelf.phoneLabel.text]==NO )
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
