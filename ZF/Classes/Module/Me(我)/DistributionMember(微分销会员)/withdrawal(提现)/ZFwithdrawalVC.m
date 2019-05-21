//
//  ZFwithdrawalVC.m
//  ZF
//
//  Created by weiming zhang on 2019/5/17.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFwithdrawalVC.h"
#import "ZFBindAlipayVC.h"
#import "http_mine.h"
#import "SVProgressHUD.h"
#import "ZFWithdrawModel.h"
#import "MJExtension.h"
#import "ZFForgetPasswordVC.h"
#import "UIButton+LXMImagePosition.h"

@interface ZFwithdrawalVC ()
@property (nonatomic, strong)UIView *backView;
@property (nonatomic, strong)UIImageView *imageView1;
@property (nonatomic, strong)UILabel *totalNumberLabel;
@property (nonatomic, strong)UILabel *todayNumberLabel;
@property (nonatomic, strong)UIImageView *imageView2;
@property (nonatomic, strong)UILabel *totalMoneyLabel;

@property (nonatomic, strong)UILabel *typeLabel;
@property (nonatomic, strong)UIButton *button1;
@property (nonatomic, strong)UIButton *zhifubaoButton;
@property (nonatomic, strong)UIButton *button2;
@property (nonatomic, strong)UIButton *wexinButton;
@property (nonatomic, strong)UIButton *accountButton;
@property (nonatomic, strong)UIButton *jumpButton;

@property (nonatomic, strong)UILabel *promptLabel;
@property (nonatomic, strong)UIImageView *imageView3;
@property (nonatomic, strong)UITextField *priceTF;
@property (nonatomic, strong)UILabel *serviceChargeLabel;
@property (nonatomic, strong)UILabel *passwordLabel;
@property (nonatomic, strong)UITextField *passwordTF;
@property (nonatomic, strong)UIButton *forgetButton;

@property (nonatomic, strong)UIButton *withdrawalButton;
@property (nonatomic, strong)UILabel *footerLabel;

@property (nonatomic, strong)ZFWithdrawModel *withdrawModel;
@end

@implementation ZFwithdrawalVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"提现";
    [self setup];
}

- (void)setup{
    [self.view addSubview:self.backView];
    [self.view addSubview:self.imageView1];
    [self.backView addSubview:self.totalNumberLabel];
    [self.backView addSubview:self.todayNumberLabel];
    [self.view addSubview:self.imageView2];
    [self.backView addSubview:self.totalMoneyLabel];
    [self.view addSubview:self.typeLabel];
    [self.view addSubview:self.button1];
    [self.button1 addSubview:self.zhifubaoButton];
    [self.view addSubview:self.button2];
    [self.button2 addSubview:self.wexinButton];
    
    [self.view addSubview:self.accountButton];
    [self.view addSubview:self.jumpButton];
    [self.view addSubview:self.serviceChargeLabel];
    UIView *lineView2 = [[UIView alloc]init];
    lineView2.backgroundColor = RGBColorHex(0xdcdcdc);
    [self.view addSubview:lineView2];
    [self.view addSubview:self.passwordLabel];
    [self.view addSubview:self.passwordTF];
    [self.view addSubview:self.forgetButton];
    UIView *lineView3 = [[UIView alloc]init];
    lineView3.backgroundColor = RGBColorHex(0xdcdcdc);
    [self.view addSubview:lineView3];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = RGBColorHex(0xf3f3f3);
    [self.view addSubview:lineView];
    [self.view addSubview:self.promptLabel];
    [self.view addSubview:self.imageView3];
    [self.view addSubview:self.priceTF];
    UIView *lineView1 = [[UIView alloc]init];
    lineView1.backgroundColor = RGBColorHex(0xdcdcdc);
    [self.view addSubview:lineView1];
    [self.view addSubview:self.withdrawalButton];
    [self.view addSubview:self.footerLabel];
    
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.mas_equalTo(109);
    }];
    
    [_imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backView).with.offset(20);
        make.left.equalTo(self.backView).with.offset(25);
    }];
    
    [_totalNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView1.mas_top);
        make.left.equalTo(self.imageView1.mas_right).with.offset(15);
    }];
    
    [_todayNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.totalNumberLabel.mas_top);
        make.right.equalTo(self.backView).with.offset(-25);
    }];
    
    [_totalMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.totalNumberLabel.mas_bottom).with.offset(17);
        make.left.equalTo(self.totalNumberLabel.mas_left);
    }];
    
    [_imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageView1.mas_left);
        make.bottom.equalTo(self.totalMoneyLabel.mas_bottom).with.offset(-10);
    }];
    
    [_typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backView.mas_bottom).with.offset(15);
        make.left.equalTo(self.view).with.offset(12);
    }];
    
    [_button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(12);
        make.top.equalTo(self.typeLabel.mas_bottom).with.offset(12);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(29);
    }];
    [_button1 setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 85)];
    
    [_button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.button1.mas_right).with.offset(15);
        make.top.equalTo(self.typeLabel.mas_bottom).with.offset(12);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(29);
    }];
    [_button2 setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 80)];
    
    [_zhifubaoButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.button1.mas_left);
        make.top.equalTo(self.button1.mas_top);
        make.bottom.equalTo(self.button1.mas_bottom);
        make.right.equalTo(self.button1.mas_right).with.offset(10);
    }];
    
    [_wexinButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.button2.mas_left);
        make.top.equalTo(self.button2.mas_top);
        make.bottom.equalTo(self.button2.mas_bottom);
        make.right.equalTo(self.button2.mas_right);
    }];
    
    [_accountButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.wexinButton.mas_bottom).with.offset(12);
        make.left.equalTo(self.view).with.offset(12);
        make.right.equalTo(self.wexinButton.mas_right);
        make.height.mas_equalTo(29);
    }];
    
    [_jumpButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).with.offset(-12);
        make.left.equalTo(self.view).with.offset(12);
        make.top.equalTo(self.wexinButton.mas_bottom).with.offset(12);
        make.height.mas_equalTo(29);
    }];
    [_jumpButton setImageEdgeInsets:UIEdgeInsetsMake(0, self.jumpButton.frame.size.width +350, 0, 0)];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.accountButton.mas_bottom).with.offset(24);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(4);
    }];
    
    [_promptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).with.offset(15);
        make.left.equalTo(self.view).with.offset(12);
    }];
    
    [_imageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.promptLabel.mas_bottom).with.offset(25);
        make.left.equalTo(self.promptLabel.mas_left);
    }];
    
    [_priceTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageView3.mas_right).with.offset(10);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(25);
        make.top.equalTo(self.promptLabel.mas_bottom).with.offset(25);
    }];
    
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.priceTF.mas_bottom);
        make.left.equalTo(self.priceTF.mas_left);
        make.width.mas_equalTo(338);
        make.height.mas_equalTo(1);
    }];
    
    [_serviceChargeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView1.mas_bottom).with.offset(7);
        make.left.equalTo(lineView1.mas_left);
    }];
    
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.serviceChargeLabel.mas_bottom).with.offset(12);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(5);
    }];
    
    [_passwordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView2.mas_bottom).with.offset(13);
        make.left.equalTo(self.view).with.offset(12);
    }];
    
    [_passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(100);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(25);
        make.centerY.equalTo(self.passwordLabel.mas_centerY);
    }];
    
    [lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passwordLabel.mas_bottom).with.offset(13);
        make.left.equalTo(self.view).with.offset(12);
        make.right.equalTo(self.view).with.offset(-12);
        make.height.mas_equalTo(1);
    }];
    
    [_forgetButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView3.mas_bottom).with.offset(12);
        make.right.equalTo(self.view).with.offset(-12);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(30);
    }];
    
    [_withdrawalButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView3.mas_bottom).with.offset(60);
        make.left.equalTo(self.view).with.offset(32.5);
        make.right.equalTo(self.view).with.offset(-32.5);
        make.height.mas_equalTo(40);
    }];
    
    [_footerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.withdrawalButton.mas_bottom).with.offset(25);
        make.left.equalTo(self.view).with.offset(12);
        make.right.equalTo(self.view).with.offset(-12);
        make.height.mas_equalTo(150);
    }];
    [http_mine my_wallet:^(id responseObject) {
        [self showData:responseObject];
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.domain];
    }];
}

- (void)viewDidAppear:(BOOL)animated{
    [http_mine my_wallet:^(id responseObject) {
        [self showData:responseObject];
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.domain];
    }];
}

- (void)showData:(id)responseObject{
    if (kObjectIsEmpty(responseObject)) {
        return;
    }
    self.withdrawModel = [ZFWithdrawModel mj_objectWithKeyValues:responseObject];
    _todayNumberLabel.text = [NSString stringWithFormat:@"当日额度:%@",self.withdrawModel.count_cash];
    _totalMoneyLabel.text = [NSString stringWithFormat:@"%@",self.withdrawModel.user_money];
    _promptLabel.text = [NSString stringWithFormat:@"提现金额（单次可提最大金额：%@）",self.withdrawModel.max_cash];
    _footerLabel.text = [NSString stringWithFormat:@"温馨提示：\n1.提现金额须大于%@元，小于%@元\n2.提现收取%@%%的手续费\n3.手续费在到账金额中扣除\n4.提现审核一般在3-5个工作日到账。",self.withdrawModel.min_cash,self.withdrawModel.max_cash,self.withdrawModel.service_ratio];
}

- (UIView *)backView{
    if (_backView == nil) {
        _backView = [[UIView alloc]init];
        _backView.backgroundColor = RGBColorHex(0xec6552);
    }return _backView;
}

- (UIImageView *)imageView1{
    if (_imageView1 == nil) {
        _imageView1 = [[UIImageView alloc]init];
        _imageView1.image = [UIImage imageNamed:@"￥1"];
    }return _imageView1;
}

- (UILabel *)totalNumberLabel{
    if (_totalNumberLabel == nil) {
        _totalNumberLabel = [[UILabel alloc]init];
        _totalNumberLabel.font = [UIFont systemFontOfSize:14];
        _totalNumberLabel.textColor = [UIColor whiteColor];
        _totalNumberLabel.text = @"可提现金额";
    }return _totalNumberLabel;
}

- (UILabel *)todayNumberLabel{
    if (_todayNumberLabel == nil) {
        _todayNumberLabel = [[UILabel alloc]init];
        _todayNumberLabel.font = [UIFont systemFontOfSize:14];
        _todayNumberLabel.textColor = [UIColor whiteColor];
        _todayNumberLabel.text = @"当日额度:60000";
    }return _todayNumberLabel;
}

- (UIImageView *)imageView2{
    if (_imageView2 == nil) {
        _imageView2 = [[UIImageView alloc]init];
        _imageView2.image = [UIImage imageNamed:@"￥1"];
    }return _imageView2;
}

- (UILabel *)totalMoneyLabel{
    if (_totalMoneyLabel == nil) {
        _totalMoneyLabel = [[UILabel alloc]init];
        _totalMoneyLabel.font = [UIFont boldSystemFontOfSize:25];
        _totalMoneyLabel.textColor = [UIColor whiteColor];
        _totalMoneyLabel.text = @"99.99";
    }return _totalMoneyLabel;
}

- (UILabel *)typeLabel{
    if (_typeLabel == nil) {
        _typeLabel = [[UILabel alloc]init];
        _typeLabel.font = [UIFont boldSystemFontOfSize:14];
        _typeLabel.textColor = RGBColorHex(0x1a1a1a);
        _typeLabel.text = @"选择提现方式";
    }return _typeLabel;
}

- (UIButton *)button1{
    if (_button1 == nil) {
        _button1 = [[UIButton alloc]init];
        [_button1 setImage:[UIImage imageNamed:@"radio2"] forState:UIControlStateNormal];
        [_button1 setImage:[UIImage imageNamed:@"radio1"] forState:UIControlStateSelected];
       
    }return _button1;
}

- (UIButton *)zhifubaoButton{
    if (_zhifubaoButton == nil) {
        _zhifubaoButton = [[UIButton alloc]init];
        _zhifubaoButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_zhifubaoButton setTitleColor:RGBColorHex(0x404040) forState:UIControlStateNormal];
        [_zhifubaoButton setTitle:@"支付宝" forState:UIControlStateNormal];
        [_zhifubaoButton setImage:[UIImage imageNamed:@"Alipay"] forState:UIControlStateNormal];
        [_zhifubaoButton setImagePosition:LXMImagePositionLeft spacing:6];
        _zhifubaoButton.tag = 100;
        [_zhifubaoButton addTarget:self action:@selector(typeClick:) forControlEvents:UIControlEventTouchUpInside];
    }return _zhifubaoButton;
}

- (UIButton *)button2{
    if (_button2 == nil) {
        _button2 = [[UIButton alloc]init];
        [_button2 setImage:[UIImage imageNamed:@"radio2"] forState:UIControlStateNormal];
        [_button2 setImage:[UIImage imageNamed:@"radio1"] forState:UIControlStateSelected];
        
    }return _button2;
}

- (UIButton *)wexinButton{
    if (_wexinButton == nil) {
        _wexinButton = [[UIButton alloc]init];
        _wexinButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_wexinButton setTitleColor:RGBColorHex(0x404040) forState:UIControlStateNormal];
        [_wexinButton setTitle:@"微信" forState:UIControlStateNormal];
        [_wexinButton setImage:[UIImage imageNamed:@"WeChat"] forState:UIControlStateNormal];
        _wexinButton.tag =101;
        [_wexinButton setImagePosition:LXMImagePositionLeft spacing:6];
        [_wexinButton addTarget:self action:@selector(typeClick:) forControlEvents:UIControlEventTouchUpInside];
    }return _wexinButton;
}

- (UIButton *)accountButton{
    if (_accountButton== nil) {
        _accountButton = [[UIButton alloc]init];
        _accountButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_accountButton setTitleColor:RGBColorHex(0x404040) forState:UIControlStateNormal];
        [_accountButton setTitle:@"请选择提现账号" forState:UIControlStateNormal];
        [_accountButton setImage:[UIImage imageNamed:@"Alipay"] forState:UIControlStateNormal];
        [_accountButton setImagePosition:LXMImagePositionLeft spacing:17];
    }return _accountButton;
}

- (UIButton *)jumpButton{
    if (_jumpButton == nil) {
        _jumpButton = [[UIButton alloc]init];
        [_jumpButton setImage:[UIImage imageNamed:@"back2"] forState:UIControlStateNormal];
        [_jumpButton addTarget:self action:@selector(jumpAlipay) forControlEvents:UIControlEventTouchUpInside];
    }return _jumpButton;
}

- (UILabel *)promptLabel{
    if (_promptLabel == nil) {
        _promptLabel = [[UILabel alloc]init];
        _promptLabel.font = [UIFont boldSystemFontOfSize:14];
        _promptLabel.textColor = RGBColorHex(0x1a1a1a);
        _promptLabel.text = @"提现金额（单次可提最大金额：20000）";
    }return _promptLabel;
}

- (UIImageView *)imageView3{
    if (_imageView3 == nil) {
        _imageView3 = [[UIImageView alloc]init];
        _imageView3.image = [UIImage imageNamed:@"￥2"];
    }return _imageView3;
}

- (UITextField *)priceTF{
    if (_priceTF == nil) {
        _priceTF = [[UITextField alloc]init];
        [self.priceTF addTarget:self action:@selector(poundageChange) forControlEvents:UIControlEventEditingChanged];
    }return _priceTF;
}

- (UILabel *)serviceChargeLabel{
    if (_serviceChargeLabel == nil) {
        _serviceChargeLabel = [[UILabel alloc]init];
        _serviceChargeLabel.font = [UIFont systemFontOfSize:14];
        _serviceChargeLabel.textColor = RGBColorHex(0x808080);
        _serviceChargeLabel.text = @"手续费:";
    }return _serviceChargeLabel;
}

- (UILabel *)passwordLabel{
    if (_passwordLabel == nil) {
        _passwordLabel = [[UILabel alloc]init];
        _passwordLabel.font = [UIFont systemFontOfSize:14];
        _passwordLabel.textColor = RGBColorHex(0x1a1a1a);
        _passwordLabel.text = @"支付密码：";
    }return _passwordLabel;
}

- (UITextField *)passwordTF{
    if (_passwordTF == nil) {
        _passwordTF = [[UITextField alloc]init];
    }return _passwordTF;
}

- (UIButton *)forgetButton{
    if (_forgetButton == nil) {
        _forgetButton = [[UIButton alloc]init];
        _forgetButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [_forgetButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_forgetButton setTitle:@"前往设置或修改支付密码" forState:UIControlStateNormal];
        [_forgetButton addTarget:self action:@selector(forgetClick) forControlEvents:UIControlEventTouchUpInside];
    }return _forgetButton;
}

- (UIButton *)withdrawalButton{
    if (_withdrawalButton == nil) {
        _withdrawalButton = [[UIButton alloc]init];
        _withdrawalButton.layer.cornerRadius = 3;
        _withdrawalButton.backgroundColor = RGBColorHex(0xd54431);
        _withdrawalButton.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        [_withdrawalButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_withdrawalButton setTitle:@"提交申请" forState:UIControlStateNormal];
        [_withdrawalButton addTarget:self action:@selector(withdrawClick) forControlEvents:UIControlEventTouchUpInside];
    }return _withdrawalButton;
}

- (UILabel *)footerLabel{
    if (_footerLabel == nil) {
        _footerLabel = [[UILabel alloc]init];
        _footerLabel.font = [UIFont systemFontOfSize:11];
        _footerLabel.textColor = RGBColorHex(0x8c8c8c);
        _footerLabel.numberOfLines = 0;
        _footerLabel.text = @"温馨提示：\n1.提现金额须大于1元，小于20000元\n2.提现收取0%的手续费\n3.手续费在到账金额中扣除\n4.提现审核一般在3-5个工作日到账。";
    }return _footerLabel;
}



#pragma mark --方法
//获取手续费
- (void)poundageChange{
    float poundage = self.priceTF.text.floatValue *self.withdrawModel.service_ratio.floatValue/100;
    if (poundage<=self.withdrawModel.min_service_money.floatValue) {
        poundage = self.withdrawModel.min_service_money.floatValue;
    }else if (poundage >= self.withdrawModel.max_service_money.floatValue){
        poundage = self.withdrawModel.max_service_money.floatValue;
    }
    _serviceChargeLabel.text = [NSString stringWithFormat:@"手续费:%f",poundage];
    
}

- (void)jumpAlipay{
    ZFBindAlipayVC *vc = [[ZFBindAlipayVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)typeClick: (UIButton *)btn{
    if (btn.tag == 100) {
        self.button1.selected = YES;
        self.button2.selected = NO;
        [_accountButton setImage:[UIImage imageNamed:@"Alipay"] forState:UIControlStateNormal];
        if (!kStringIsEmpty(self.withdrawModel.alipay)) {
            [_accountButton setTitle:[NSString stringWithFormat:@"%@ %@",self.withdrawModel.realname,self.withdrawModel.alipay] forState:UIControlStateNormal];
        }
    }else{
        self.button1.selected = NO;
        self.button2.selected = YES;
        [_accountButton setImage:[UIImage imageNamed:@"WeChat"] forState:UIControlStateNormal];
         [_accountButton setTitle:@"微信账号已绑定" forState:UIControlStateNormal];
    }
}

- (void)forgetClick{
    ZFForgetPasswordVC *vc = [[ZFForgetPasswordVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)withdrawClick{
    if (self.button1.selected == YES) {
        [http_mine withdrawals:self.passwordTF.text money:self.priceTF.text bank_name:@"支付宝" bank_card:self.withdrawModel.alipay realname:self.withdrawModel.realname success:^(id responseObject) {
            [SVProgressHUD showSuccessWithStatus:@"已提交申请"];
        } failure:^(NSError *error) {
            [SVProgressHUD showErrorWithStatus:error.domain];
        }];
    }else{
        [http_mine withdrawals:self.passwordTF.text money:self.priceTF.text bank_name:@"微信" bank_card:self.withdrawModel.openid realname:nil success:^(id responseObject) {
            [SVProgressHUD showSuccessWithStatus:@"已提交申请"];
        } failure:^(NSError *error) {
            [SVProgressHUD showErrorWithStatus:error.domain];
        }];
    }
    
}
@end
