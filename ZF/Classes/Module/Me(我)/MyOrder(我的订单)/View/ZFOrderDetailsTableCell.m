//
//  ZFOrderDetailsTableCell.m
//  ZF
//
//  Created by admin on 2019/3/21.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFOrderDetailsTableCell.h"
#import "UIImageView+WebCache.h"

@interface ZFOrderDetailsTableCell()

@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UILabel* colourLabel;
@property (nonatomic, strong) UILabel* sizeLabel;
@property (nonatomic, strong) UILabel* moneyLabel;
@property (nonatomic, strong) UIButton *seeButton;

@end

@implementation ZFOrderDetailsTableCell

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
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.colourLabel];
    [self.contentView addSubview:self.sizeLabel];
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.seeButton];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(14);
        make.width.height.mas_equalTo(80);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(13);
        make.top.mas_equalTo(14);
        make.right.mas_equalTo(-10);
    }];
    
    [_colourLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(13);
        make.centerY.equalTo(self->_iconView);
    }];
    
    [_sizeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_colourLabel.mas_right).offset(10);
        make.centerY.equalTo(self->_colourLabel);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(13);
        make.top.equalTo(self->_colourLabel.mas_bottom).offset(10);
    }];
    
    [_seeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.bottom.equalTo(self->_iconView.mas_bottom);
    }];
    
    //下面横线
    UIView *hLineView = [[UIView alloc] init];
    hLineView.backgroundColor = RGBColorHex(0xE3E3E3);
    [self.contentView addSubview:hLineView];
    
    [hLineView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.equalTo(self->_iconView.mas_left);
         make.right.equalTo(self->_seeButton.mas_right);
         make.top.equalTo(self->_iconView.mas_bottom).offset(5);
         make.height.mas_equalTo(0.5f);
     }];
    
}

- (void)seeButtonDidClick
{
    
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"image"];
        _iconView.clipsToBounds = YES;
        _iconView.layer.cornerRadius = 3.0f;
    }
    return _iconView;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0x151515);
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.numberOfLines = 0;
        _titleLabel.text = @"女式花瓣连衣裙女式花瓣连衣裙女式花瓣连衣裙女式花瓣连衣裙";
    }
    return _titleLabel;
}

- (UILabel *)colourLabel {
    if (_colourLabel == nil) {
        _colourLabel = [[UILabel alloc] init];
        _colourLabel.textColor = RGBColorHex(0x151515);
        _colourLabel.font = [UIFont systemFontOfSize:12];
        _colourLabel.numberOfLines = 0;
        _colourLabel.text = @"颜色:蓝色";
    }
    return _colourLabel;
}

- (UILabel *)sizeLabel {
    if (_sizeLabel == nil) {
        _sizeLabel = [[UILabel alloc] init];
        _sizeLabel.textColor = RGBColorHex(0x151515);
        _sizeLabel.font = [UIFont systemFontOfSize:12];
        _sizeLabel.numberOfLines = 0;
        _sizeLabel.text = @"尺寸:M码";
    }
    return _sizeLabel;
}

- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = RGBColorHex(0x646464);
        _moneyLabel.font = [UIFont systemFontOfSize:15];
        _moneyLabel.text = @"¥ 399 × 2";
    }
    return _moneyLabel;
}


- (UIButton *)seeButton {
    if (_seeButton == nil) {
        _seeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_seeButton setTitle:@"查看产品使用说明" forState:UIControlStateNormal];
        [_seeButton setTitleColor:RGBColorHex(0x6f6f6f) forState:UIControlStateNormal];
        _seeButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_seeButton addTarget:self action:@selector(seeButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _seeButton;
}

- (void)setOrderModel:(ZFOrdersModel *)orderModel{
    _orderModel = orderModel;
    if (!kStringIsEmpty(_orderModel.original_img))
    {
        NSString* str = [NSString stringWithFormat:@"%@%@",ImageUrl,_orderModel.original_img];
        [_iconView sd_setImageWithURL:[NSURL URLWithString:str]];
    }
    _titleLabel.text = [NSString stringWithFormat:@"%@",_orderModel.goods_name];
    _colourLabel.text = [NSString stringWithFormat:@"%@",_orderModel.spec_key_name];
    _sizeLabel.hidden = YES;
    _moneyLabel.text = [NSString stringWithFormat:@"¥ %@ × %ld",_orderModel.final_price,_orderModel.goods_num];
    
}
@end
