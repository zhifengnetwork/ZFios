//
//  ZFConfirmationTableCell.m
//  ZF
//
//  Created by apple on 2019/3/5.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFConfirmationTableCell.h"

@interface ZFConfirmationTableCell()

@property (nonatomic, strong) UIImageView* reduceView;
@property (nonatomic, strong) UILabel* numberLabel;
@property (nonatomic, strong) UIImageView* plusView;
@property (nonatomic, strong) UIButton *confirButton;

@end

@implementation ZFConfirmationTableCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.contentView.backgroundColor = RGBColorHex(0xffffff);
    [self.contentView addSubview:self.reduceView];
    [self.contentView addSubview:self.numberLabel];
    [self.contentView addSubview:self.plusView];
    [self.contentView addSubview:self.confirButton];
    
    [_reduceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_reduceView.mas_right).offset(7);
        make.centerY.equalTo(self->_reduceView);
    }];
    
    [_plusView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_numberLabel.mas_right).offset(7);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_confirButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.width.mas_equalTo(95);
        make.height.mas_equalTo(30);
        make.centerY.equalTo(self.contentView);
    }];
    
    //下面横线
    UIView *hLineView = [[UIView alloc] init];
    hLineView.backgroundColor = RGBColorHex(0xBBBBBB);
    [self.contentView addSubview:hLineView];
    
    [hLineView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.mas_equalTo(0);
         make.right.mas_equalTo(-0);
         make.top.equalTo(self->_confirButton.mas_bottom).offset(5);
         make.height.mas_equalTo(0.5f);
     }];
    
}

- (void)confirButtonDidClick
{
    
}


- (UIImageView *)reduceView {
    if (_reduceView == nil) {
        _reduceView = [[UIImageView alloc] init];
        _reduceView.image = [UIImage imageNamed:@"jian"];
    }
    return _reduceView;
}

- (UILabel *)numberLabel {
    if (_numberLabel == nil) {
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.textColor = RGBColorHex(0x333333);
        _numberLabel.font = [UIFont systemFontOfSize:15];
        _numberLabel.text = @"1";
    }
    return _numberLabel;
}

- (UIImageView *)plusView {
    if (_plusView == nil) {
        _plusView = [[UIImageView alloc] init];
        _plusView.image = [UIImage imageNamed:@"jia"];
    }
    return _plusView;
}

- (UIButton *)confirButton {
    if (_confirButton == nil) {
        _confirButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _confirButton.backgroundColor = RGBColorHex(0xFF5722);
        [_confirButton setTitle:@"确认出价" forState:UIControlStateNormal];
        _confirButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_confirButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _confirButton.layer.cornerRadius = 5;
        _confirButton.clipsToBounds = YES;
        [_confirButton addTarget:self action:@selector(confirButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirButton;
}

@end
