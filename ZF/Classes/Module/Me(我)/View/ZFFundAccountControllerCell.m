//
//  ZFFundAccountControllerCell.m
//  ZF
//
//  Created by admin on 2019/3/18.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFFundAccountControllerCell.h"
#import "UIView+HJViewStyle.h"
#import "UIButton+LXMImagePosition.h"

@interface ZFFundAccountControllerCell()

@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* moneyLabel;
@property (nonatomic, strong) UILabel* yuanLabel;
@property (nonatomic, strong) UIButton* moreButton;

@end

@implementation ZFFundAccountControllerCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setup];
    }
    return self;
}


- (void)setup
{
    [self addSubview:self.titleLabel];
    [self addSubview:self.nameLabel];
    [self addSubview:self.moneyLabel];
    [self addSubview:self.yuanLabel];
    [self addSubview:self.moreButton];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.centerY.equalTo(self);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_titleLabel.mas_right).offset(44);
        make.centerY.equalTo(self);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_nameLabel.mas_right).offset(23);
        make.centerY.equalTo(self);
    }];
    
    [_yuanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_moneyLabel.mas_right);
        make.centerY.equalTo(self);
    }];
    
    [_moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.centerY.equalTo(self);
    }];
}

-(void)moreButtonDidClick
{
    
}


- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0x151515);
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.text = @"公益基金账户";
    }
    return _titleLabel;
}

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColorHex(0x151515);
        _nameLabel.font = [UIFont systemFontOfSize:12];
        _nameLabel.text = @"李艳小";
    }
    return _nameLabel;
}

- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = RGBColorHex(0xff0000);
        _moneyLabel.font = [UIFont systemFontOfSize:12];
        _moneyLabel.text = @"1000.00";
    }
    return _moneyLabel;
}

- (UILabel *)yuanLabel {
    if (_yuanLabel == nil) {
        _yuanLabel = [[UILabel alloc] init];
        _yuanLabel.textColor = RGBColorHex(0x151515);
        _yuanLabel.font = [UIFont systemFontOfSize:12];
        _yuanLabel.text = @"元";
    }
    return _yuanLabel;
}

- (UIButton *)moreButton {
    if (_moreButton == nil) {
        _moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_moreButton setTitle:@"查看名单" forState:UIControlStateNormal];
        [_moreButton setImage:[UIImage imageNamed:@"ZJT"] forState:UIControlStateNormal];
        [_moreButton setTitleColor:RGBColorHex(0x151515) forState:UIControlStateNormal];
        _moreButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_moreButton setImagePosition:LXMImagePositionRight spacing:6];
        [_moreButton addTarget:self action:@selector(moreButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moreButton;
}


@end
