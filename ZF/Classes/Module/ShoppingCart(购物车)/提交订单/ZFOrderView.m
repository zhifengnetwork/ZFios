//
//  ZFOrderView.m
//  ZF
//
//  Created by weiming zhang on 2019/3/28.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFOrderView.h"
#import "ZFXuXianView.h"
@interface ZFOrderView()
@property (nonatomic, strong)UILabel *shopNameLabel;
@property (nonatomic, strong)UIImageView *jumpImageView2;
@property (nonatomic, strong)UIButton *shopButton;
@property (nonatomic, strong)UILabel *disCountLabel;
@property (nonatomic, strong)UILabel *detailDisCountLabel;
@property (nonatomic, strong)UIImageView *jumpImageView3;
@property (nonatomic, strong)UIButton *disCountButton;
@property (nonatomic, strong)UIImageView *pictureImageView;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *priceLabel;
@property (nonatomic, strong)ZFXuXianView *lineView;
@property (nonatomic, strong)UIImageView *pictureImageView2;
@property (nonatomic, strong)UILabel *nameLabel2;
@property (nonatomic, strong)UILabel *priceLabel2;
@end
@implementation ZFOrderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setup{
    [self addSubview:self.shopNameLabel];
    [self addSubview:self.jumpImageView2];
    [self addSubview:self.shopButton];
    [self addSubview:self.disCountLabel];
    [self addSubview:self.detailDisCountLabel];
    [self addSubview:self.jumpImageView3];
    [self addSubview:self.disCountButton];
    [self addSubview:self.pictureImageView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.priceLabel];
    [self addSubview:self.lineView];
    [self addSubview:self.pictureImageView2];
    [self addSubview:self.nameLabel2];
    [self addSubview:self.priceLabel2];
    [_shopNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(12);
        make.left.equalTo(self).with.offset(10);
    }];
    [_jumpImageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.shopNameLabel.mas_right).with.offset(35);
        make.centerY.equalTo(self.shopNameLabel.mas_centerY);
    }];
    [_shopButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.shopNameLabel.mas_left);
        make.right.equalTo(self.jumpImageView2.mas_right);
        make.bottom.equalTo(self.shopNameLabel.mas_bottom);
        make.height.equalTo(self.shopNameLabel.mas_height);
    }];
    [_disCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(10);
        make.top.equalTo(self.shopButton.mas_bottom).with.offset(14);
    }];
    [_detailDisCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.disCountLabel.mas_right).with.offset(12);
        make.centerY.equalTo(self.disCountLabel.mas_centerY);
    }];
    [_jumpImageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.disCountLabel.mas_centerY);
        make.right.equalTo(self).with.offset(-10);
    }];
    [_disCountButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.disCountLabel.mas_left);
        make.right.equalTo(self.jumpImageView3.mas_right);
        make.bottom.equalTo(self.detailDisCountLabel.mas_bottom);
        make.height.mas_equalTo(15);
    }];
    [_pictureImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(10);
        make.top.equalTo(self.detailDisCountLabel.mas_bottom).with.offset(12);
        make.width.height.mas_equalTo(50);
    }];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.pictureImageView.mas_right).with.offset(15);
        make.right.equalTo(self).with.offset(-10);
        make.top.equalTo(self.detailDisCountLabel.mas_bottom).with.offset(12);
    }];
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).with.offset(12);
        make.right.equalTo(self).with.offset(-10);
    }];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.priceLabel.mas_bottom).with.offset(10);
        make.left.equalTo(self).with.offset(10);
        make.right.equalTo(self).with.offset(-10);
        make.height.mas_equalTo(1);
    }];
    [_pictureImageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(10);
        make.top.equalTo(self.lineView.mas_bottom).with.offset(10);
        make.width.height.mas_equalTo(50);
    }];
    [_nameLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.pictureImageView2.mas_right).with.offset(15);
        make.right.equalTo(self).with.offset(-10);
        make.top.equalTo(self.lineView.mas_bottom).with.offset(10);
    }];
    [_priceLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel2.mas_bottom).with.offset(12);
        make.right.equalTo(self).with.offset(-10);
        make.bottom.equalTo(self).with.offset(-15);
    }];
}

- (UILabel *)shopNameLabel{
    if (_shopNameLabel == nil) {
        _shopNameLabel = [[UILabel alloc]init];
        _shopNameLabel.font = [UIFont boldSystemFontOfSize:14];
        _shopNameLabel.textColor = RGBColorHex(0x333333);
        _shopNameLabel.text = @"ZF智丰自营旗舰店";
    }
    return _shopNameLabel;
}
- (UIImageView *)jumpImageView2{
    if (_jumpImageView2 == nil) {
        _jumpImageView2 = [[UIImageView alloc]init];
        [_jumpImageView2 setImage:[UIImage imageNamed:@"arrow"]];
    }
    return _jumpImageView2;
}
- (UIButton *)shopButton{
    if (_shopButton == nil) {
        _shopButton = [[UIButton alloc]init];
        [_shopButton addTarget:self action:@selector(jumpShop) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shopButton;
}
- (UILabel *)disCountLabel{
    if (_disCountLabel == nil) {
        _disCountLabel = [[UILabel alloc]init];
        _disCountLabel.font = [UIFont systemFontOfSize:10];
        _disCountLabel.textColor = RGBColorHex(0xe51c23);
        _disCountLabel.text = @"满赠";
    }
    return _disCountLabel;
}
- (UILabel *)detailDisCountLabel{
    if (_detailDisCountLabel == nil) {
        _detailDisCountLabel = [[UILabel alloc]init];
        _detailDisCountLabel.font = [UIFont systemFontOfSize:11];
        _detailDisCountLabel.textColor = RGBColorHex(0x4d4d4d);
        _detailDisCountLabel.text = @"已购物4500.00元，可领取赠品";
    }
    return _detailDisCountLabel;
}
- (UIImageView *)jumpImageView3{
    if (_jumpImageView3 == nil) {
        _jumpImageView3 = [[UIImageView alloc]init];
        [_jumpImageView3 setImage:[UIImage imageNamed:@"arrow"]];
    }
    return _jumpImageView3;
}
- (UIButton *)disCountButton{
    if (_disCountButton == nil) {
        _disCountButton = [[UIButton alloc]init];
        [_disCountButton addTarget:self action:@selector(jumpDisCount) forControlEvents:UIControlEventTouchUpInside];
    }
    return _disCountButton;
}
- (UIImageView *)pictureImageView{
    if (_pictureImageView == nil) {
        _pictureImageView = [[UIImageView alloc]init];
    }
    return _pictureImageView;
}
- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = [UIFont systemFontOfSize:11];
        _nameLabel.textColor = RGBColorHex(0x4d4d4d);
        _nameLabel.text = @"Apple iphone XS 128G 金色 移动联通电信4G手机  旗舰店专营";
        _nameLabel.lineBreakMode = 0;
        _nameLabel.numberOfLines = 0;
    }
    return _nameLabel;
}
- (UILabel *)priceLabel{
    if (_priceLabel == nil) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.font = [UIFont boldSystemFontOfSize:13];
        _priceLabel.textColor = RGBColorHex(0x1a1a1a);
        _priceLabel.text = @"￥4900.00";
    }
    return _priceLabel;
}
- (ZFXuXianView *)lineView{
    if (_lineView == nil) {
        _lineView = [[ZFXuXianView alloc]init];
        _lineView.backgroundColor = RGBColorHex(0xf2f2f2);
    }
    return _lineView;
}
- (UIImageView *)pictureImageView2{
    if (_pictureImageView2 == nil) {
        _pictureImageView2 = [[UIImageView alloc]init];
    }
    return _pictureImageView2;
}
- (UILabel *)nameLabel2{
    if (_nameLabel2 == nil) {
        _nameLabel2 = [[UILabel alloc]init];
        _nameLabel2.font = [UIFont systemFontOfSize:11];
        _nameLabel2.textColor = RGBColorHex(0x4d4d4d);
        _nameLabel2.text = @"Apple iphone XS 128G 金色 移动联通电信4G手机  旗舰店专营";
        _nameLabel2.lineBreakMode = 0;
        _nameLabel2.numberOfLines = 0;
    }
    return _nameLabel2;
}
- (UILabel *)priceLabel2{
    if (_priceLabel2 == nil) {
        _priceLabel2 = [[UILabel alloc]init];
        _priceLabel2.font = [UIFont boldSystemFontOfSize:13];
        _priceLabel2.textColor = RGBColorHex(0x1a1a1a);
        _priceLabel2.text = @"￥4900.00";
    }
    return _priceLabel2;
}
//跳转到店铺界面
- (void)jumpShop{
    
}
//领取赠品
- (void)jumpDisCount{
    
}
@end
