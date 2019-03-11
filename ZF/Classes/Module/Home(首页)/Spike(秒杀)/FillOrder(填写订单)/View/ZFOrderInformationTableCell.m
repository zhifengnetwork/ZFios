//
//  ZFOrderInformationTableCell.m
//  ZF
//
//  Created by apple on 2019/3/6.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFOrderInformationTableCell.h"

@interface ZFOrderInformationTableCell()

@property (nonatomic, strong) UILabel* brandLabel;
@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UILabel* moneyLabel;
@property (nonatomic, strong) UILabel* money2Label;
@property (nonatomic, strong) UILabel *numberLabel;

@end

@implementation ZFOrderInformationTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setup];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setup
{
    self.contentView.backgroundColor = RGBColorHex(0xffffff);
    [self.contentView addSubview:self.brandLabel];
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.money2Label];
    [self.contentView addSubview:self.numberLabel];
    
    [_brandLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(10);
    }];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.equalTo(self->_brandLabel.mas_bottom).offset(12);
        make.width.height.mas_equalTo(69);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-100);
        make.left.equalTo(self->_iconView.mas_right).offset(11);
        make.top.equalTo(self->_brandLabel.mas_bottom).offset(12);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-50);
        make.left.equalTo(self->_iconView.mas_right).offset(11);
        make.bottom.equalTo(self->_iconView.mas_bottom);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.top.equalTo(self->_nameLabel.mas_top);
    }];
    
    [_money2Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.top.equalTo(self->_moneyLabel.mas_bottom).offset(10);
    }];
    
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.bottom.equalTo(self->_titleLabel.mas_bottom);
    }];
    
    //下面横线
    UIView *hLineView = [[UIView alloc] init];
    hLineView.backgroundColor = RGBColorHex(0xcccccc);
    [self.contentView addSubview:hLineView];
    
    [hLineView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.mas_equalTo(0);
         make.right.mas_equalTo(-0);
         make.top.equalTo(self->_iconView.mas_bottom).offset(15);
         make.height.mas_equalTo(0.5f);
     }];
    
}


- (UILabel *)brandLabel {
    if (_brandLabel == nil) {
        _brandLabel = [[UILabel alloc] init];
        _brandLabel.textColor = RGBColorHex(0x333333);
        _brandLabel.font = [UIFont systemFontOfSize:16];
        _brandLabel.text = @"品牌：水果超市";
    }
    return _brandLabel;
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"snank"];
        _iconView.clipsToBounds = YES;
        _iconView.layer.cornerRadius = 3.0f;
    }
    return _iconView;
}

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColorHex(0x333333);
        _nameLabel.font = [UIFont systemFontOfSize:12];
        _nameLabel.text = @"现代简约可拆洗布沙发客厅整套家具 单人位(单拍不发货)";
        _nameLabel.numberOfLines = 0;
    }
    return _nameLabel;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0x999999);
        _titleLabel.font = [UIFont systemFontOfSize:11];
        _titleLabel.text = @"现代简约可拆洗布沙发客厅整套家具";
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = RGBColorHex(0xff5722);
        _moneyLabel.font = [UIFont systemFontOfSize:13];
        _moneyLabel.text = @"¥ 128";
    }
    return _moneyLabel;
}

- (UILabel *)money2Label {
    if (_money2Label == nil) {
        _money2Label = [[UILabel alloc] init];
        _money2Label.textColor = RGBColorHex(0x999999);
        _money2Label.font = [UIFont systemFontOfSize:10];
        _money2Label.text = @"¥ 138";
    }
    return _money2Label;
}

- (UILabel *)numberLabel {
    if (_numberLabel == nil) {
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.textColor = RGBColorHex(0x666666);
        _numberLabel.font = [UIFont systemFontOfSize:12];
        _numberLabel.text = @"×2";
    }
    return _numberLabel;
}


@end
