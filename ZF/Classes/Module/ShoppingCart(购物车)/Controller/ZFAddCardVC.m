//
//  ZFAddCardVC.m
//  ZF
//
//  Created by weiming zhang on 2019/3/28.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFAddCardVC.h"

@interface ZFAddCardVC ()
@property (nonatomic, strong)UIView *titleView;
@property (nonatomic, strong)UIButton *backButton;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UIView *cardView;
@property (nonatomic, strong)UILabel *cardLabel;
@property (nonatomic, strong)UITextField *cardNumberTF;
@property (nonatomic, strong)UIButton *addButton;
@end

@implementation ZFAddCardVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup{
    
    self.view.backgroundColor = RGBColorHex(0xf4f4f4);
    [self.view addSubview:self.titleView];
    [self.titleView addSubview:self.backButton];
    [self.titleView addSubview:self.titleLabel];
    [self.view addSubview:self.cardView];
    [self.cardView addSubview:self.cardLabel];
    [self.cardView addSubview:self.cardNumberTF];
    [self.view addSubview:self.addButton];
    [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(0);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(64);
    }];
    [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(16);
        make.bottom.equalTo(self.titleView).with.offset(-15);
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.titleView.mas_centerX);
        make.bottom.equalTo(self.titleView).with.offset(-15);
    }];
    [_cardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(16);
        make.right.equalTo(self.view).with.offset(-16);
        make.top.equalTo(self.titleView.mas_bottom).with.offset(20);
        make.height.mas_equalTo(45);
    }];
    [_cardLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.cardView).with.offset(15);
        make.width.mas_equalTo(30);
        make.centerY.equalTo(self.cardView.mas_centerY);
    }];
    [_cardNumberTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.cardLabel.mas_right).with.offset(15);
        make.top.bottom.right.equalTo(self.cardView);
    }];
    [_addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cardView.mas_bottom).with.offset(20);
        make.left.equalTo(self.view).with.offset(16);
        make.right.equalTo(self.view).with.offset(-16);
        make.height.mas_equalTo(40);
    }];
}
- (UIView *)titleView{
    if (_titleView == nil) {
        _titleView = [[UIView alloc]init];
        _titleView.backgroundColor = [UIColor whiteColor];
    }
    return _titleView;
}
- (UIButton *)backButton{
    if (_backButton == nil) {
        _backButton = [[UIButton alloc]init];
        [_backButton setImage:[UIImage imageNamed:@"Back"] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}
- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:19];
        _titleLabel.textColor = RGBColorHex(0x0f0f0f);
        _titleLabel.text = @"添加银行卡";
    }
    return _titleLabel;
}
- (UIView *)cardView{
    if (_cardView == nil) {
        _cardView = [[UIView alloc]init];
        _cardView.layer.cornerRadius = 5;
        _cardView.backgroundColor = RGBColorHex(0xffffff);
    }
    return _cardView;
}
- (UILabel *)cardLabel{
    if (_cardLabel == nil) {
        _cardLabel = [[UILabel alloc]init];
        _cardLabel.font = [UIFont systemFontOfSize:12];
        _cardLabel.textColor = RGBColorHex(0x333333);
        _cardLabel.text = @"卡号";
    }
    return _cardLabel;
}
- (UITextField *)cardNumberTF{
    if (_cardNumberTF == nil) {
        _cardNumberTF = [[UITextField alloc]init];
        _cardNumberTF.placeholder = @"请输入银行卡号";
        [_cardNumberTF setValue:RGBColorHex(0xb3b3b3) forKeyPath:@"_placeholderLabel.textColor"];
        [_cardNumberTF setValue:[UIFont systemFontOfSize:12] forKeyPath:@"_placeholderLabel.font"];
    }
    return _cardNumberTF;
}
- (UIButton *)addButton{
    if (_addButton == nil) {
        _addButton = [[UIButton alloc]init];
        _addButton.layer.cornerRadius = 5;
        _addButton.backgroundColor = RGBColorHex(0xe51c23);
        _addButton.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        [_addButton setTitleColor:RGBColorHex(0xffffff) forState:UIControlStateNormal];
        [_addButton setTitle:@"点击添加" forState:UIControlStateNormal];
        [_addButton addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addButton;
}
#pragma mark -- 方法
- (void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)add{
    
}
@end
