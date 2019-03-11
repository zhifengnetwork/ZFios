//
//  ZFSpikeDetailsTableCell.m
//  ZF
//
//  Created by apple on 2019/3/2.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFSpikeDetailsTableCell.h"
#import "UIImageView+WebCache.h"

@interface ZFSpikeDetailsTableCell()

@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UILabel* discountLabel;
@property (nonatomic, strong) UILabel* moneyLabel;
@property (nonatomic, strong) UILabel* money2Label;
@property (nonatomic, strong) UILabel* numberLabel;
@property (nonatomic, strong) UIButton* grabOnceButton;

@end

@implementation ZFSpikeDetailsTableCell

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
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.discountLabel];
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.money2Label];
    [self.contentView addSubview:self.numberLabel];
    [self.contentView addSubview:self.grabOnceButton];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(8);
        make.top.mas_equalTo(15);
        make.width.height.mas_equalTo(100);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(13);
        make.top.equalTo(self->_iconView.mas_top);
        make.right.mas_equalTo(-30);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(13);
        make.top.equalTo(self->_nameLabel.mas_bottom).offset(8);
        make.right.mas_equalTo(-30);
    }];
    
    [_discountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(13);
        make.top.equalTo(self->_titleLabel.mas_bottom).offset(5);
        make.width.mas_equalTo(35);
        make.height.mas_equalTo(17);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(13);
        make.top.equalTo(self->_discountLabel.mas_bottom).offset(7);
    }];
    
    [_money2Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(13);
        make.bottom.equalTo(self->_iconView.mas_bottom);
    }];
    
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_money2Label.mas_right).offset(53);
        make.centerY.equalTo(self->_money2Label);
    }];
    
    [_grabOnceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-8);
        make.bottom.mas_equalTo(-25);
        make.width.mas_equalTo(72);
        make.height.mas_equalTo(30);
    }];
    
    //横线
    UIView *hLine2View = [[UIView alloc] init];
    hLine2View.backgroundColor = RGBColorHex(0x999999);
    [self.contentView addSubview:hLine2View];
    
    [hLine2View mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.centerY.centerX.equalTo(self->_money2Label);
         make.width.mas_equalTo(30);
         make.height.mas_equalTo(0.5);
     }];
    
    //下面横线
    UIView *hLineView = [[UIView alloc] init];
    hLineView.backgroundColor = RGBColorHex(0xE8E8E8);
    [self.contentView addSubview:hLineView];
    
    [hLineView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.mas_equalTo(0);
         make.right.mas_equalTo(-0);
         make.bottom.equalTo(self.contentView);
         make.height.mas_equalTo(0.5f);
     }];
}

- (void)grabOnceButtonDidClick
{
    
}


- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"KK"];
    }
    return _iconView;
}


- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColorHex(0x333333);
        _nameLabel.font = [UIFont systemFontOfSize:15];
        _nameLabel.text = @"修身百搭个性v领上衣t恤";
    }
    return _nameLabel;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0x666666);
        _titleLabel.font = [UIFont systemFontOfSize:11];
        _titleLabel.text = @"短袖T恤女2019夏季新款韩版纯色";
    }
    return _titleLabel;
}

- (UILabel *)discountLabel {
    if (_discountLabel == nil) {
        _discountLabel = [[UILabel alloc] init];
        _discountLabel.textColor = RGBColorHex(0xe8305c);
        _discountLabel.font = [UIFont systemFontOfSize:11];
        _discountLabel.layer.borderWidth = 1.0f;
        _discountLabel.layer.borderColor = RGBColorHex(0xE8315D).CGColor;
        _discountLabel.text = @" 4.6折";
    }
    return _discountLabel;
}

- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = RGBColorHex(0xf80505);
        _moneyLabel.font = [UIFont systemFontOfSize:12];
        _moneyLabel.text = @"¥ 145";
    }
    return _moneyLabel;
}

- (UILabel *)money2Label {
    if (_money2Label == nil) {
        _money2Label = [[UILabel alloc] init];
        _money2Label.textColor = RGBColorHex(0x999999);
        _money2Label.font = [UIFont systemFontOfSize:10];
        _money2Label.text = @"¥ 189";
    }
    return _money2Label;
}

- (UILabel *)numberLabel {
    if (_numberLabel == nil) {
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.textColor = RGBColorHex(0x999999);
        _numberLabel.font = [UIFont systemFontOfSize:10];
        _numberLabel.text = @"仅剩100件";
    }
    return _numberLabel;
}


- (UIButton *)grabOnceButton {
    if (_grabOnceButton == nil) {
        _grabOnceButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _grabOnceButton.backgroundColor = RGBColorHex(0xFF5722);
        [_grabOnceButton setTitle:@"马上抢" forState:UIControlStateNormal];
        _grabOnceButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_grabOnceButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _grabOnceButton.layer.cornerRadius = 4;
        _grabOnceButton.clipsToBounds = YES;
        [_grabOnceButton addTarget:self action:@selector(grabOnceButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _grabOnceButton;
}

@end
