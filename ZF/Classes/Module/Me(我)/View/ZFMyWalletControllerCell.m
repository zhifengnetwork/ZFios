//
//  ZFMyWalletControllerCell.m
//  ZF
//
//  Created by admin on 2019/3/18.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFMyWalletControllerCell.h"
#import "UIView+HJViewStyle.h"

@interface ZFMyWalletControllerCell()

@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* numberLabel;

@end

@implementation ZFMyWalletControllerCell

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
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.numberLabel];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(70);
        make.top.mas_equalTo(5);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_iconView.mas_bottom).offset(5);
        make.centerX.equalTo(self->_iconView);
    }];
    
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make){
         make.top.equalTo(self->_nameLabel.mas_bottom).offset(5);
         make.centerX.equalTo(self->_nameLabel);
     }];
    
}


-(void)setTitle:(NSString *)title
{
    _title = title;
    _nameLabel.text = _title;
}

-(void)setIconName:(NSString *)iconName
{
    _iconName = iconName;
    _iconView.image = [UIImage imageNamed:_iconName];
}

- (void)setNumber:(NSString *)number
{
    _number = number;
    _numberLabel.text = _number;
}


- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"JF1"];
    }
    return _iconView;
}

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:12];
        _nameLabel.textColor = RGBColorHex(0x151515);
        _nameLabel.text = @"积分";
    }
    return _nameLabel;
}

- (UILabel *)numberLabel {
    if (_numberLabel == nil) {
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.font = [UIFont systemFontOfSize:15];
        _numberLabel.textColor = RGBColorHex(0xfe2306);
        _numberLabel.text = @"3000";
    }
    return _numberLabel;
}

@end
