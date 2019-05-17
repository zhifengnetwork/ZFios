
//
//  ZFBindAlipayVC.m
//  ZF
//
//  Created by weiming zhang on 2019/5/17.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFBindAlipayVC.h"
#import "http_mine.h"
#import "SVProgressHUD.h"


@interface ZFBindAlipayVC ()
@property (nonatomic, strong)UILabel *accountLabel;
@property (nonatomic, strong)UITextField *accountTF;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UITextField *nameTF;
@property (nonatomic, strong)UIButton *agreeButton;


@end

@implementation ZFBindAlipayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title= @"支付宝提现";
    [self setup];
}

- (void)setup{
    [self.view addSubview:self.accountLabel];
    [self.view addSubview:self.accountTF];
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = RGBColorHex(0xdcdcdc);
    [self.view addSubview:lineView];
    [self.view addSubview:self.nameLabel];
    [self.view addSubview:self.nameTF];
    UIView *lineView1 = [[UIView alloc]init];
    lineView1.backgroundColor = RGBColorHex(0xdcdcdc);
    [self.view addSubview:lineView1];
    [self.view addSubview:self.agreeButton];
    
    [_accountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.view).with.offset(12);
    }];
    
    [_accountTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(100);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(25);
        make.centerY.equalTo(self.accountLabel.mas_centerY);
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.accountLabel.mas_bottom).with.offset(13);
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.height.mas_equalTo(1);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).with.offset(12);
        make.left.equalTo(self.view).with.offset(12);
    }];
    
    [_nameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(100);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(25);
        make.centerY.equalTo(self.nameLabel.mas_centerY);
    }];
    
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).with.offset(13);
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.height.mas_equalTo(1);
    }];
    
    [_agreeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView1.mas_bottom).with.offset(60);
        make.left.equalTo(self.view).with.offset(32.5);
        make.right.equalTo(self.view).with.offset(-32.5);
        make.height.mas_equalTo(30);
    }];
}

- (UILabel *)accountLabel{
    if (_accountLabel == nil) {
        _accountLabel = [[UILabel alloc]init];
        _accountLabel.font = [UIFont boldSystemFontOfSize:14];
        _accountLabel.textColor = RGBColorHex(0x1a1a1a);
        _accountLabel.text = @"支付宝账号：";
    }return _accountLabel;
}

- (UITextField *)accountTF{
    if (_accountTF == nil) {
        _accountTF = [[UITextField alloc]init];
        _accountTF.textColor = RGBColorHex(0x808080);
    }return _accountTF;
}

- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = [UIFont boldSystemFontOfSize:14];
        _nameLabel.textColor = RGBColorHex(0x1a1a1a);
        _nameLabel.text = @" 真实姓名：";
    }return _nameLabel;
}

- (UITextField *)nameTF{
    if (_nameTF == nil) {
        _nameTF = [[UITextField alloc]init];
        _nameTF.textColor = RGBColorHex(0x808080);
    }return _nameTF;
}

- (UIButton *)agreeButton{
    if (_agreeButton == nil) {
        _agreeButton = [[UIButton alloc]init];
        _agreeButton.layer.cornerRadius = 3;
        _agreeButton.backgroundColor = RGBColorHex(0xd54431);
        _agreeButton.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        [_agreeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_agreeButton setTitle:@"确定" forState:UIControlStateNormal];
        [_agreeButton addTarget:self action:@selector(bindClick) forControlEvents:UIControlEventTouchUpInside];
    }return _agreeButton;
}

#pragma mark --方法
- (void)bindClick{
    [http_mine BindZfb:self.accountTF.text realname:self.nameTF.text success:^(id responseObject) {
        [SVProgressHUD showSuccessWithStatus:@"绑定成功"];
        [self.navigationController popViewControllerAnimated:YES];
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.domain];
    }];
}
@end
