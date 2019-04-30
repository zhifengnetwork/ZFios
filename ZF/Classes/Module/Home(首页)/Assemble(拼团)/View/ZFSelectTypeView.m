//
//  ZFSelectTypeView.m
//  ZF
//
//  Created by weiming zhang on 2019/4/29.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFSelectTypeView.h"
@interface ZFSelectTypeView()
@property (nonatomic, strong)UIImageView *iconImageView;
@property (nonatomic, strong)UILabel *priceLabel;
@property (nonatomic, strong)UILabel *promptLabel;
@property (nonatomic, strong)UIButton *cancelButton;
@property (nonatomic, strong)UILabel *typeLabel;
@property (nonatomic, strong)UIButton *typeButton;
@property (nonatomic, strong)UIButton *typeButton1;
@property (nonatomic, strong)UIButton *typeButton2;
@property (nonatomic, strong)UIButton *typeButton3;
@property (nonatomic, strong)UIButton *typeButton4;
@property (nonatomic, strong)UIButton *typeButton5;
@property (nonatomic, strong)UIButton *typeButton6;
@property (nonatomic, strong)UIButton *typeButton7;

@property (nonatomic, strong)UIButton *oldButton;
@property (nonatomic, strong)UILabel *numberLabel;
@property (nonatomic, strong)UIButton *decreaseButton;
@property (nonatomic, strong)UIButton *numberButton;
@property (nonatomic, strong)UIButton *increaseButton;
@property (nonatomic, strong)UIButton *agreeButton;
@end
@implementation ZFSelectTypeView
NSInteger count = 1;//存储购物车的数量

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.iconImageView];
    [self addSubview:self.priceLabel];
    [self addSubview:self.promptLabel];
    [self addSubview:self.cancelButton];
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = RGBColor(245, 245, 245);
    [self addSubview:lineView];
    [self addSubview:self.typeLabel];
    [self addSubview:self.typeButton];
    [self addSubview:self.typeButton1];
    [self addSubview:self.typeButton2];
    [self addSubview:self.typeButton3];
    [self addSubview:self.typeButton4];
    [self addSubview:self.typeButton5];
    [self addSubview:self.typeButton6];
    [self addSubview:self.typeButton7];
    UIView *lineView1 = [[UIView alloc]init];
    lineView1.backgroundColor = RGBColor(245, 245, 245);
    [self addSubview:lineView1];
    
    [self addSubview:self.numberLabel];
    [self addSubview:self.decreaseButton];
    [self addSubview:self.numberButton];
    [self addSubview:self.increaseButton];
    [self addSubview:self.agreeButton];
    
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(20);
        make.top.equalTo(self).with.offset(-20);
        make.width.height.mas_equalTo(60);
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).with.offset(5.5);
        make.top.equalTo(self).with.offset(6);
    }];
    
    [_promptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).with.offset(5.5);
        make.bottom.equalTo(self.iconImageView.mas_bottom);
    }];
    
    [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(5);
        make.right.equalTo(self).with.offset(-5);
        make.width.height.mas_equalTo(25);
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImageView.mas_bottom).with.offset(13);
        make.left.right.equalTo(self);
        make.height.mas_equalTo(1);
    }];
    
    [_typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).with.offset(13);
        make.left.equalTo(self).with.offset(20);
    }];
    
    [_typeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(62);
        make.height.mas_equalTo(26);
        make.top.equalTo(self.typeLabel.mas_bottom).with.offset(20);
        make.left.equalTo(self).with.offset(20);
    }];
    
    [_typeButton1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(62);
        make.height.mas_equalTo(26);
        make.top.equalTo(self.typeButton.mas_top);
        make.left.equalTo(self.typeButton.mas_right).with.offset(30);
    }];
    
    [_typeButton2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(62);
        make.height.mas_equalTo(26);
        make.top.equalTo(self.typeButton.mas_top);
        make.left.equalTo(self.typeButton1.mas_right).with.offset(30);
    }];
    
    [_typeButton3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(62);
        make.height.mas_equalTo(26);
        make.top.equalTo(self.typeButton.mas_top);
        make.left.equalTo(self.typeButton2.mas_right).with.offset(30);
    }];
    
    [_typeButton4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(62);
        make.height.mas_equalTo(26);
        make.top.equalTo(self.typeButton.mas_bottom).with.offset(23);
        make.left.equalTo(self).with.offset(20);
    }];
    
    [_typeButton5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(62);
        make.height.mas_equalTo(26);
        make.top.equalTo(self.typeButton4.mas_top);
        make.left.equalTo(self.typeButton4.mas_right).with.offset(30);
    }];
    
    [_typeButton6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(62);
        make.height.mas_equalTo(26);
        make.top.equalTo(self.typeButton4.mas_top);
        make.left.equalTo(self.typeButton5.mas_right).with.offset(30);
    }];
    
    [_typeButton7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(62);
        make.height.mas_equalTo(26);
        make.top.equalTo(self.typeButton4.mas_top);
        make.left.equalTo(self.typeButton6.mas_right).with.offset(30);
    }];
    
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.typeButton4.mas_bottom).with.offset(20);
        make.left.right.equalTo(self);
        make.height.mas_equalTo(1);
    }];
    
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(20);
        make.top.equalTo(lineView1).with.offset(13);
    }];
    
    [_increaseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView1.mas_bottom).with.offset(10);
        make.right.equalTo(self).with.offset(-20);
        make.width.height.mas_equalTo(18);
    }];

    [_numberButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.increaseButton.mas_left).with.offset(-1);
        make.top.equalTo(self.increaseButton.mas_top);
        make.width.mas_equalTo(35);
        make.height.mas_equalTo(18);
    }];

    [_decreaseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.increaseButton.mas_top);
        make.right.equalTo(self.numberButton.mas_left).with.offset(-1);
        make.width.height.mas_equalTo(18);
    }];

    [_agreeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.mas_equalTo(46);
    }];
}

- (UIImageView *)iconImageView{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc]init];
        _iconImageView.image =[UIImage imageNamed:@"Picture"];
    }return _iconImageView;
}

- (UILabel *)priceLabel{
    if (_priceLabel == nil) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.font = [UIFont systemFontOfSize:12];
        _priceLabel.textColor = RGBColorHex(0xe82f5c);
        _priceLabel.text = @"￥297-397";
    }return _priceLabel;
}

- (UILabel *)promptLabel{
    if (_promptLabel == nil) {
        _promptLabel = [[UILabel alloc]init];
        _promptLabel.font = [UIFont systemFontOfSize:12];
        _promptLabel.textColor = RGBColorHex(0x333333);
        _promptLabel.text = @"请选择：款式";
    }return _promptLabel;
}

- (UIButton *)cancelButton{
    if (_cancelButton == nil) {
        _cancelButton = [[UIButton alloc]init];
        [_cancelButton setImage:[UIImage imageNamed:@"chacha"] forState:UIControlStateNormal];
        [_cancelButton addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
    }return _cancelButton;
}

- (UILabel *)typeLabel{
    if (_typeLabel == nil) {
        _typeLabel = [[UILabel alloc]init];
        _typeLabel.font = [UIFont systemFontOfSize:12];
        _typeLabel.textColor = RGBColorHex(0x333333);
        _typeLabel.text = @"款式";
    }return _typeLabel;
}

- (UIButton *)typeButton{
    if (_typeButton == nil) {
        _typeButton = [[UIButton alloc]init];
        _typeButton.titleLabel.font = [UIFont systemFontOfSize:12];
        _typeButton.layer.borderWidth = 1;
        _typeButton.tag = 1;
        _typeButton.layer.borderColor = RGBColorHex(0xcccccc).CGColor;
        [_typeButton setTitle:@"红色" forState:UIControlStateNormal];
        [_typeButton setTitleColor:RGBColorHex(0x666666) forState:UIControlStateNormal];
        [_typeButton setTitleColor:RGBColorHex(0xe82f5c) forState:UIControlStateSelected];
        [_typeButton addTarget:self action:@selector(typeChange:) forControlEvents:UIControlEventTouchUpInside];
    }return _typeButton;
}

- (UIButton *)typeButton1{
    if (_typeButton1 == nil) {
        _typeButton1 = [[UIButton alloc]init];
        _typeButton1.titleLabel.font = [UIFont systemFontOfSize:12];
        _typeButton1.layer.borderWidth = 1;
        _typeButton1.tag = 2;
        _typeButton1.layer.borderColor = RGBColorHex(0xcccccc).CGColor;
        [_typeButton1 setTitle:@"黑色" forState:UIControlStateNormal];
        [_typeButton1 setTitleColor:RGBColorHex(0x666666) forState:UIControlStateNormal];
        [_typeButton1 setTitleColor:RGBColorHex(0xe82f5c) forState:UIControlStateSelected];
        [_typeButton1 addTarget:self action:@selector(typeChange:) forControlEvents:UIControlEventTouchUpInside];
    }return _typeButton1;
}

- (UIButton *)typeButton2{
    if (_typeButton2 == nil) {
        _typeButton2 = [[UIButton alloc]init];
        _typeButton2.titleLabel.font = [UIFont systemFontOfSize:12];
        _typeButton2.layer.borderWidth = 1;
        _typeButton2.tag = 3;
        _typeButton2.layer.borderColor = RGBColorHex(0xcccccc).CGColor;
        [_typeButton2 setTitle:@"蓝色" forState:UIControlStateNormal];
        [_typeButton2 setTitleColor:RGBColorHex(0x666666) forState:UIControlStateNormal];
        [_typeButton2 setTitleColor:RGBColorHex(0xe82f5c) forState:UIControlStateSelected];
        [_typeButton2 addTarget:self action:@selector(typeChange:) forControlEvents:UIControlEventTouchUpInside];
    }return _typeButton2;
}

- (UIButton *)typeButton3{
    if (_typeButton3 == nil) {
        _typeButton3 = [[UIButton alloc]init];
        _typeButton3.titleLabel.font = [UIFont systemFontOfSize:12];
        _typeButton3.layer.borderWidth = 1;
        _typeButton3.tag = 4;
        _typeButton3.layer.borderColor = RGBColorHex(0xcccccc).CGColor;
        [_typeButton3 setTitle:@"黄色" forState:UIControlStateNormal];
        [_typeButton3 setTitleColor:RGBColorHex(0x666666) forState:UIControlStateNormal];
        [_typeButton3 setTitleColor:RGBColorHex(0xe82f5c) forState:UIControlStateSelected];
        [_typeButton3 addTarget:self action:@selector(typeChange:) forControlEvents:UIControlEventTouchUpInside];
    }return _typeButton3;
}

- (UIButton *)typeButton4{
    if (_typeButton4 == nil) {
        _typeButton4 = [[UIButton alloc]init];
        _typeButton4.titleLabel.font = [UIFont systemFontOfSize:12];
        _typeButton4.layer.borderWidth = 1;
        _typeButton4.tag = 5;
        _typeButton4.layer.borderColor = RGBColorHex(0xcccccc).CGColor;
        [_typeButton4 setTitle:@"红色" forState:UIControlStateNormal];
        [_typeButton4 setTitleColor:RGBColorHex(0x666666) forState:UIControlStateNormal];
        [_typeButton4 setTitleColor:RGBColorHex(0xe82f5c) forState:UIControlStateSelected];
        [_typeButton4 addTarget:self action:@selector(typeChange:) forControlEvents:UIControlEventTouchUpInside];
    }return _typeButton4;
}

- (UIButton *)typeButton5{
    if (_typeButton5 == nil) {
        _typeButton5 = [[UIButton alloc]init];
        _typeButton5.titleLabel.font = [UIFont systemFontOfSize:12];
        _typeButton5.layer.borderWidth = 1;
        _typeButton5.tag = 6;
        _typeButton5.layer.borderColor = RGBColorHex(0xcccccc).CGColor;
        [_typeButton5 setTitle:@"红色" forState:UIControlStateNormal];
        [_typeButton5 setTitleColor:RGBColorHex(0x666666) forState:UIControlStateNormal];
        [_typeButton5 setTitleColor:RGBColorHex(0xe82f5c) forState:UIControlStateSelected];
        [_typeButton5 addTarget:self action:@selector(typeChange:) forControlEvents:UIControlEventTouchUpInside];
    }return _typeButton5;
}

- (UIButton *)typeButton6{
    if (_typeButton6 == nil) {
        _typeButton6 = [[UIButton alloc]init];
        _typeButton6.titleLabel.font = [UIFont systemFontOfSize:12];
        _typeButton6.layer.borderWidth = 1;
        _typeButton6.tag = 7;
        _typeButton6.layer.borderColor = RGBColorHex(0xcccccc).CGColor;
        [_typeButton6 setTitle:@"红色" forState:UIControlStateNormal];
        [_typeButton6 setTitleColor:RGBColorHex(0x666666) forState:UIControlStateNormal];
        [_typeButton6 setTitleColor:RGBColorHex(0xe82f5c) forState:UIControlStateSelected];
        [_typeButton6 addTarget:self action:@selector(typeChange:) forControlEvents:UIControlEventTouchUpInside];
    }return _typeButton6;
}

- (UIButton *)typeButton7{
    if (_typeButton7 == nil) {
        _typeButton7 = [[UIButton alloc]init];
        _typeButton7.titleLabel.font = [UIFont systemFontOfSize:12];
        _typeButton7.layer.borderWidth = 1;
        _typeButton7.tag = 8;
        _typeButton7.layer.borderColor = RGBColorHex(0xcccccc).CGColor;
        [_typeButton7 setTitle:@"红色" forState:UIControlStateNormal];
        [_typeButton7 setTitleColor:RGBColorHex(0x666666) forState:UIControlStateNormal];
        [_typeButton7 setTitleColor:RGBColorHex(0xe82f5c) forState:UIControlStateSelected];
        [_typeButton7 addTarget:self action:@selector(typeChange:) forControlEvents:UIControlEventTouchUpInside];
    }return _typeButton7;
}

- (UILabel *)numberLabel{
    if (_numberLabel == nil) {
        _numberLabel = [[UILabel alloc]init];
        _numberLabel.font = [UIFont systemFontOfSize:12];
        _numberLabel.textColor = RGBColorHex(0x333333);
        _numberLabel.text = @"数量";
    }return _numberLabel;
}

- (UIButton *)decreaseButton{
    if (_decreaseButton == nil) {
        _decreaseButton = [[UIButton alloc]init];
        _decreaseButton.backgroundColor = RGBColorHex(0xf5f5f5);
        _decreaseButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_decreaseButton setTitleColor:RGBColorHex(0x333333) forState:UIControlStateNormal];
        [_decreaseButton setTitle:@"-" forState:UIControlStateNormal];
        [_decreaseButton addTarget:self action:@selector(NumberChange:) forControlEvents:UIControlEventTouchUpInside];
    }return _decreaseButton;
}

- (UIButton *)numberButton{
    if (_numberButton == nil) {
        _numberButton = [[UIButton alloc]init];
        _numberButton.backgroundColor = RGBColorHex(0xeaeaea);
        _numberButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_numberButton setTitleColor:RGBColorHex(0x333333) forState:UIControlStateNormal];
        [_numberButton setTitle:@"1" forState:UIControlStateNormal];
    }return _numberButton;
}

- (UIButton *)increaseButton{
    if (_increaseButton == nil) {
        _increaseButton = [[UIButton alloc]init];
        _increaseButton.backgroundColor = RGBColorHex(0xeaeaea);
        _increaseButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_increaseButton setTitleColor:RGBColorHex(0x333333) forState:UIControlStateNormal];
        [_increaseButton setTitle:@"+" forState:UIControlStateNormal];
        [_increaseButton addTarget:self action:@selector(NumberChange:) forControlEvents:UIControlEventTouchUpInside];
    }return _increaseButton;
}

- (UIButton *)agreeButton{
    if (_agreeButton == nil) {
        _agreeButton = [[UIButton alloc]init];
        [_agreeButton setBackgroundImage:[UIImage imageNamed:@"agree"] forState:UIControlStateNormal];
        _agreeButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_agreeButton setTitle:@"确认" forState:UIControlStateNormal];
        [_agreeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_agreeButton addTarget:self action:@selector(agreeClick) forControlEvents:UIControlEventTouchUpInside];
    }return _agreeButton;
}
#pragma mark --方法

- (void)typeChange: (UIButton *)btn{
    btn.selected = YES;
    btn.layer.borderColor = RGBColorHex(0xe82f5c).CGColor;
    
    if (_oldButton.tag !=btn.tag) {
        _oldButton.layer.borderColor = RGBColorHex(0xcccccc).CGColor;
        _oldButton.selected = NO;
        _oldButton = btn;
    }else{
        _oldButton = btn;
    }
    
}

- (void)NumberChange: (UIButton *)btn{
    
    if (btn == self.decreaseButton) {
        count--;
        if (count <= 0) {
            count = 0;
        }
    }else{
        count++;
    }
    [self.numberButton setTitle:[NSString stringWithFormat:@"%ld",(long)count] forState:UIControlStateNormal];
}

//获取当前控制器
- (UIViewController *)currentViewController{
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (1) {
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = ((UITabBarController *)vc).selectedViewController;
        }
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController *)vc).visibleViewController;
        }
        if (vc.presentedViewController) {
            vc = vc.presentedViewController;
        }else{
            break;
        }
    }
    return vc;
}

- (void)cancelClick{
    [[self currentViewController]dismissViewControllerAnimated:YES completion:nil];
}

- (void)agreeClick{
    //确认
}
@end
