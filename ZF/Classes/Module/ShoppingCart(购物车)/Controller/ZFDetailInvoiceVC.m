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
    
    [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        self.titleHeight = make.height.mas_equalTo(200);
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
        make.top.equalTo(lineView1.mas_bottom).with.offset(15);
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
        make.height.mas_equalTo(80);
    }];
    
    
}

- (UIView *)titleView{
    if (_titleView == nil) {
        _titleView = [[UIView alloc]init];
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
    }return _contentView;
}
#pragma mark -- 方法
- (void)selectClick: (UIButton *)btn{
    if (btn.tag == 1) {
        btn.selected = YES;
        self.companyButton.selected = YES;
    }else if (btn.tag == 2){
        btn.selected = YES;
        self.personButton.selected = NO;
    }
}
@end
