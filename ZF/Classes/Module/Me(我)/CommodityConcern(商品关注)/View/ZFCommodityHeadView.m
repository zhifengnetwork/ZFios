//
//  ZFCommodityHeadView.m
//  ZF
//
//  Created by admin on 2019/3/14.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFCommodityHeadView.h"

@interface ZFCommodityHeadView ()


@property (nonatomic, strong) UIView *leftLine;
@property (nonatomic, strong) UIView *rightLine;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation ZFCommodityHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    self.backgroundColor = RGBColorHex(0xf3f5f7);
    [self addSubview:self.leftLine];
    [self addSubview:self.titleLabel];
    [self addSubview:self.rightLine];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(17);
        make.centerX.equalTo(self);
    }];
    
    [_leftLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self->_titleLabel);
        make.right.equalTo(self->_titleLabel.mas_left).offset(-10);
        make.left.mas_equalTo(10);
        make.width.mas_equalTo(111);
        make.height.mas_equalTo(0.5);
    }];
    
    [_rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self->_titleLabel);
        make.left.equalTo(self->_titleLabel.mas_right).offset(5);
        make.right.mas_equalTo(-10);
        make.width.mas_equalTo(111);
        make.height.mas_equalTo(0.5);
    }];
    
}


- (void)setTitle:(NSString *)title
{
    _title = title;
    _titleLabel.text = _title;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0x151515);
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.text = @"猜您喜欢的商品";
    }
    return _titleLabel;
}

- (UIView *)leftLine {
    if (_leftLine == nil) {
        _leftLine = [[UIView alloc] init];
        _leftLine.backgroundColor = RGBColorHex(0xBBBBBB);
    }
    return _leftLine;
}

- (UIView *)rightLine {
    if (_rightLine == nil) {
        _rightLine = [[UIView alloc] init];
        _rightLine.backgroundColor = RGBColorHex(0xBBBBBB);
    }
    return _rightLine;
}


@end
