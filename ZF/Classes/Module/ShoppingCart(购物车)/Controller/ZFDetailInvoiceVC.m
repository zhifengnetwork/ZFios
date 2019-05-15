//
//  ZFDetailInvoiceVC.m
//  ZF
//
//  Created by weiming zhang on 2019/5/15.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFDetailInvoiceVC.h"

@interface ZFDetailInvoiceVC ()
@property (nonatomic, strong)UIView *titleView;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)MASConstraint *titleHeight;

@property (nonatomic, strong)UIButton *personButton;
@property (nonatomic, strong)UIButton *companyButton;

@property (nonatomic, strong)UILabel *contentLabel;
@property (nonatomic, strong)UIView *contentView;
@property (nonatomic, strong)MASConstraint *contentHeight;
@property (nonatomic, strong)UITextField *companyTF;
@property (nonatomic, strong)UITextField *identifyTF;
@property (nonatomic, strong)UILabel *promptLabel;

@property (nonatomic, strong)UIButton *detailButton;
@property (nonatomic, strong)UIButton *categoriesButton;
@property (nonatomic, strong)UIButton *noButton;
@property (nonatomic, strong)UIButton *agreeButton;
@end

@implementation ZFDetailInvoiceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发票信息";
    [self setup];
}

- (void)setup{
    [self.view addSubview:self.titleView];
    [self.titleView addSubview:self.titleLabel];
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = RGBColorHex(0xcccccc);
    [self.titleView addSubview:lineView];
    [self.titleView addSubview:self.personButton];
    [self.titleView addSubview:self.companyButton];
    UIView *lineView1 = [[UIView alloc]init];
    lineView1.backgroundColor = RGBColorHex(0xcccccc);
    [self.titleView addSubview:lineView1];
    
    [self.view addSubview:self.contentLabel];
    UIView *lineView2 = [[UIView alloc]init];
    lineView2.backgroundColor = RGBColorHex(0xcccccc);
    [self.view addSubview:lineView2];
    [self.view addSubview:self.contentView];
    [self.contentView addSubview:self.companyTF];
    [self.contentView addSubview:self.identifyTF];
    [self.contentView addSubview:self.promptLabel];
    
    [self.view addSubview:self.detailButton];
    [self.view addSubview:self.categoriesButton];
    [self.view addSubview:self.noButton];
    [self.view addSubview:self.agreeButton];
    
    [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        self.titleHeight = make.height.mas_equalTo(110);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(20);
        make.left.equalTo(self.view).with.offset(40);
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(15);
        make.left.equalTo(self.view).with.offset(20);
        make.right.equalTo(self.view).with.offset(-20);
        make.height.mas_equalTo(1);
    }];
    
    [_personButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_left);
        make.top.equalTo(lineView.mas_bottom).with.offset(15);
        
    }];
    
    [_companyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.personButton.mas_right).with.offset(20);
        make.top.equalTo(lineView.mas_bottom).with.offset(15);
    }];
    
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.personButton.mas_bottom).with.offset(15);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(2);
    }];
    
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleView.mas_bottom).with.offset(15);
        make.left.equalTo(self.view).with.offset(20);
    }];
    
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentLabel.mas_bottom).with.offset(15);
        make.left.equalTo(self.view).with.offset(20);
        make.right.equalTo(self.view).with.offset(-20);
        make.height.mas_equalTo(1);
    }];
    
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView2);
        make.left.equalTo(lineView2.mas_left);
        make.right.equalTo(lineView2.mas_right);
        self.contentHeight = make.height.mas_equalTo(130);
    }];
    
    [_companyTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).with.offset(15);
        make.left.equalTo(self.contentView).with.offset(20);
        make.right.equalTo(self.contentView).with.offset(-20);
        make.height.mas_equalTo(30);
    }];
    
    [_identifyTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.companyTF.mas_bottom).with.offset(15);
        make.left.equalTo(self.contentView).with.offset(20);
        make.right.equalTo(self.contentView).with.offset(-20);
        make.height.mas_equalTo(30);
    }];
    
    [_promptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.identifyTF.mas_bottom).with.offset(5);
        make.left.equalTo(self.contentView).with.offset(20);
        make.right.equalTo(self.contentView).with.offset(-20);
    }];
    
    [_detailButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_bottom).with.offset(5);
        make.left.equalTo(self.view).with.offset(20);
    }];
    
    [_categoriesButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.detailButton.mas_right).with.offset(10);
        make.centerY.equalTo(self.detailButton.mas_centerY);
    }];
    
    [_noButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.categoriesButton.mas_right).with.offset(10);
        make.centerY.equalTo(self.detailButton.mas_centerY);
    }];
    
    [_agreeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.detailButton.mas_bottom).with.offset(15);
        make.left.equalTo(self.view).with.offset(25);
        make.right.equalTo(self.view).with.offset(-25);
        make.height.mas_equalTo(20);
    }];
    
}

- (UIView *)titleView{
    if (_titleView == nil) {
        _titleView = [[UIView alloc]init];
        _titleView.clipsToBounds = YES;
    }return _titleView;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.text = @"发票抬头";
    }return _titleLabel;
}

- (UIButton *)personButton{
    if (_personButton == nil) {
        _personButton = [[UIButton alloc]init];
        _personButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_personButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_personButton setTitle:@"个人" forState:UIControlStateNormal];
        [_personButton setImage:[UIImage imageNamed:@"option_b"] forState:UIControlStateNormal];
        [_personButton setImage:[UIImage imageNamed:@"option_s"] forState:UIControlStateSelected];
        [_personButton addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
        _personButton.tag = 1;
    }return _personButton;
}

- (UIButton *)companyButton{
    if (_companyButton == nil) {
        _companyButton = [[UIButton alloc]init];
        _companyButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_companyButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_companyButton setTitle:@"单位" forState:UIControlStateNormal];
        [_companyButton setImage:[UIImage imageNamed:@"option_b"] forState:UIControlStateNormal];
        [_companyButton setImage:[UIImage imageNamed:@"option_s"] forState:UIControlStateSelected];
        [_companyButton addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
        _companyButton.tag = 2;
    }return _companyButton;
}

- (UILabel *)contentLabel{
    if (_contentLabel == nil) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.font = [UIFont systemFontOfSize:15];
        _contentLabel.textColor = [UIColor blackColor];
        _contentLabel.text = @"发票内容";
    }return _contentLabel;
}

- (UIView *)contentView{
    if (_contentView == nil) {
        _contentView = [[UIView alloc]init];
        _contentView.clipsToBounds= YES;
    }return _contentView;
}

- (UITextField *)companyTF{
    if (_companyTF == nil) {
        _companyTF = [[UITextField alloc]init];
        _companyTF.layer.borderWidth = 1;
        _companyTF.layer.borderColor = RGBColorHex(0xcccccc).CGColor;
        _companyTF.placeholder = @"请填写单位名称";
        _companyTF.font = [UIFont systemFontOfSize:13];
        _companyTF.textColor = RGBColorHex(0x4d4d4d);
    }return _companyTF;
}

- (UITextField *)identifyTF{
    if (_identifyTF == nil) {
        _identifyTF = [[UITextField alloc]init];
        _identifyTF.layer.borderWidth = 1;
        _identifyTF.layer.borderColor = RGBColorHex(0xcccccc).CGColor;
        _identifyTF.placeholder = @"请在此填写纳税人识别号";
        _identifyTF.font = [UIFont systemFontOfSize:13];
        _identifyTF.textColor = RGBColorHex(0x4d4d4d);
    }return _identifyTF;
}

- (UILabel *)promptLabel{
    if (_promptLabel == nil) {
        _promptLabel = [[UILabel alloc]init];
        _promptLabel.font = [UIFont systemFontOfSize:14];
        _promptLabel.textColor = [UIColor redColor];
        _promptLabel.text = @"开企业抬头发票，请准确填写对应的“纳税人识别号”，以免影响您的发票报销.";
        _promptLabel.numberOfLines = 0;
    }return _promptLabel;
}

- (UIButton *)detailButton{
    if (_detailButton == nil) {
        _detailButton = [[UIButton alloc]init];
        _detailButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_detailButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_detailButton setTitle:@"商品明细" forState:UIControlStateNormal];
        [_detailButton setImage:[UIImage imageNamed:@"option_b"] forState:UIControlStateNormal];
        [_detailButton setImage:[UIImage imageNamed:@"option_s"] forState:UIControlStateSelected];
        [_detailButton addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
        _detailButton.tag = 5;
    }return _detailButton;
}

- (UIButton *)categoriesButton{
    if (_categoriesButton == nil) {
        _categoriesButton = [[UIButton alloc]init];
        _categoriesButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_categoriesButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_categoriesButton setTitle:@"商品类别" forState:UIControlStateNormal];
        [_categoriesButton setImage:[UIImage imageNamed:@"option_b"] forState:UIControlStateNormal];
        [_categoriesButton setImage:[UIImage imageNamed:@"option_s"] forState:UIControlStateSelected];
        [_categoriesButton addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
        _categoriesButton.tag = 6;
    }return _categoriesButton;
}

- (UIButton *)noButton{
    if (_noButton == nil) {
        _noButton = [[UIButton alloc]init];
        _noButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_noButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_noButton setTitle:@"商品类别" forState:UIControlStateNormal];
        [_noButton setImage:[UIImage imageNamed:@"option_b"] forState:UIControlStateNormal];
        [_noButton setImage:[UIImage imageNamed:@"option_s"] forState:UIControlStateSelected];
        [_noButton addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
        _noButton.tag = 7;
    }return _noButton;
}

- (UIButton *)agreeButton{
    if (_agreeButton == nil) {
        _agreeButton = [[UIButton alloc]init];
        _agreeButton.backgroundColor = [UIColor redColor];
        _agreeButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_agreeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_agreeButton setTitle:@"确认" forState:UIControlStateNormal];
        [_agreeButton addTarget:self action:@selector(agreeClick) forControlEvents:UIControlEventTouchUpInside];
    }return _agreeButton;
}

#pragma mark -- 方法
- (void)selectClick: (UIButton *)btn{
    if (btn.tag == 1) {
        btn.selected = YES;
        self.companyButton.selected = NO;
        
        [self.contentHeight uninstall];
        [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
            self.contentHeight = make.height.mas_equalTo(0);
        }];
    }else if (btn.tag == 2){
        btn.selected = YES;
        self.personButton.selected = NO;
        
        [self.contentHeight uninstall];
        [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
            self.contentHeight = make.height.mas_equalTo(130);
        }];
         
    }else if (btn.tag == 5){
        btn.selected = YES;
        self.categoriesButton.selected = NO;
        self.noButton.selected = NO;
        [self.titleHeight uninstall];
        [self.titleView mas_updateConstraints:^(MASConstraintMaker *make) {
            
            self.titleHeight = make.height.mas_equalTo(110);
        }];
        if (self.companyButton.selected == YES) {
            [self selectClick:self.companyButton];
        }
    }else if (btn.tag == 6){
        btn.selected = YES;
        self.detailButton.selected = NO;
        self.noButton.selected = NO;
        
        [self.titleHeight uninstall];
        [self.titleView mas_updateConstraints:^(MASConstraintMaker *make) {
            
            self.titleHeight = make.height.mas_equalTo(110);
        }];
        if (self.companyButton.selected == YES) {
            [self selectClick:self.companyButton];
        }
    }else{
        btn.selected =YES;
        self.detailButton.selected = NO;
        self.categoriesButton.selected = NO;
        [self.titleHeight uninstall];
        [self.titleView mas_updateConstraints:^(MASConstraintMaker *make) {
            
            self.titleHeight = make.height.mas_equalTo(0);
        }];
        [self.contentHeight uninstall];
        [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
            self.contentHeight = make.height.mas_equalTo(0);
        }];
    }
}

- (void)agreeClick{
    
}
@end
