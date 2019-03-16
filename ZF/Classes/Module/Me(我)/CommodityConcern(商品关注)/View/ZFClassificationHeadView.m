//
//  ZFClassificationHeadView.m
//  ZF
//
//  Created by admin on 2019/3/14.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFClassificationHeadView.h"
#import "UIButton+LXMImagePosition.h"

@interface ZFClassificationHeadView ()

@property (nonatomic, strong) UIButton* classButton;
@property (nonatomic, strong) UIButton* couponButton;
@property (nonatomic, strong) UIButton* promotionButton;
@property (nonatomic, strong) UIButton* priceButton;
@property (nonatomic, strong) UIButton* stockButton;

@end

@implementation ZFClassificationHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupUI];
    }
    return self;
}


- (void)setupUI
{
    self.backgroundColor = RGBColorHex(0xffffff);
    [self addSubview:self.classButton];
    [self addSubview:self.couponButton];
    [self addSubview:self.promotionButton];
    [self addSubview:self.priceButton];
    [self addSubview:self.stockButton];
    
    [_classButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.equalTo(self);
    }];
    
    [_couponButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_classButton.mas_right).offset(30);
        make.centerY.equalTo(self->_classButton);
    }];
    
    [_promotionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(15);
        make.left.equalTo(self->_couponButton.mas_right).offset(30);
        make.centerY.equalTo(self);
    }];
    
    [_priceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(15);
        make.left.equalTo(self->_promotionButton.mas_right).offset(30);
        make.centerY.equalTo(self);
    }];
    
    [_stockButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(15);
        make.left.equalTo(self->_priceButton.mas_right).offset(30);
        make.centerY.equalTo(self);
    }];
    
    //下面横线
    UIView *hLineView = [[UIView alloc] init];
    hLineView.backgroundColor = RGBColorHex(0xcccccc);
    [self addSubview:hLineView];
    
    [hLineView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.mas_equalTo(0);
         make.right.mas_equalTo(-0);
         make.bottom.equalTo(self->_classButton.mas_top).offset(-5);
         make.height.mas_equalTo(0.5f);
     }];
    
}

-(void)classButtonDidClick
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ZFClassificationHeadViewDidClick:)])
    {
        [self.delegate ZFClassificationHeadViewDidClick:1];
    }
}

-(void)couponButtonDidClick
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ZFClassificationHeadViewDidClick:)])
    {
        [self.delegate ZFClassificationHeadViewDidClick:2];
    }
}

-(void)promotionButtonDidClick
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ZFClassificationHeadViewDidClick:)])
    {
        [self.delegate ZFClassificationHeadViewDidClick:3];
    }
}

-(void)priceButtonDidClick
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ZFClassificationHeadViewDidClick:)])
    {
        [self.delegate ZFClassificationHeadViewDidClick:4];
    }
}

-(void)stockButtonDidClick
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ZFClassificationHeadViewDidClick:)])
    {
        [self.delegate ZFClassificationHeadViewDidClick:5];
    }
}


- (UIButton *)classButton {
    if (_classButton == nil) {
        _classButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_classButton setTitle:@"分类" forState:UIControlStateNormal];
        [_classButton setImage:[UIImage imageNamed:@"drop-down"] forState:UIControlStateNormal];
        [_classButton setTitleColor:RGBColorHex(0xea4a1e) forState:UIControlStateNormal];
        _classButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [_classButton setImagePosition:LXMImagePositionRight spacing:1];
        [_classButton addTarget:self action:@selector(classButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _classButton;
}

- (UIButton *)couponButton {
    if (_couponButton == nil) {
        _couponButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_couponButton setTitle:@"有券" forState:UIControlStateNormal];
        [_couponButton setTitleColor:RGBColorHex(0xea4a1e) forState:UIControlStateNormal];
        _couponButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [_couponButton addTarget:self action:@selector(couponButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _couponButton;
}

- (UIButton *)promotionButton {
    if (_promotionButton == nil) {
        _promotionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _promotionButton.backgroundColor = RGBColorHex(0xe6e6e6);
        [_promotionButton setTitle:@"促销" forState:UIControlStateNormal];
        [_promotionButton setTitleColor:RGBColorHex(0x151515) forState:UIControlStateNormal];
        _promotionButton.titleLabel.font = [UIFont systemFontOfSize:13];
        _promotionButton.layer.cornerRadius = 7;
        _promotionButton.clipsToBounds = YES;
        [_promotionButton addTarget:self action:@selector(promotionButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _promotionButton;
}

- (UIButton *)priceButton {
    if (_priceButton == nil) {
        _priceButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _priceButton.backgroundColor = RGBColorHex(0xe6e6e6);
        [_priceButton setTitle:@"降价" forState:UIControlStateNormal];
        [_priceButton setTitleColor:RGBColorHex(0x151515) forState:UIControlStateNormal];
        _priceButton.titleLabel.font = [UIFont systemFontOfSize:13];
        _priceButton.layer.cornerRadius = 7;
        _priceButton.clipsToBounds = YES;
        [_priceButton addTarget:self action:@selector(priceButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _priceButton;
}

- (UIButton *)stockButton {
    if (_stockButton == nil) {
        _stockButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _stockButton.backgroundColor = RGBColorHex(0xe6e6e6);
        [_stockButton setTitle:@"有货" forState:UIControlStateNormal];
        [_stockButton setTitleColor:RGBColorHex(0x151515) forState:UIControlStateNormal];
        _stockButton.titleLabel.font = [UIFont systemFontOfSize:13];
        _stockButton.layer.cornerRadius = 7;
        _stockButton.clipsToBounds = YES;
        [_stockButton addTarget:self action:@selector(stockButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _stockButton;
}


@end
