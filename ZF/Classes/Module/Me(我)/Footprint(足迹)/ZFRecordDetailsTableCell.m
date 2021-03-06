//
//  ZFRecordDetailsTableCell.m
//  ZF
//
//  Created by apple on 2019/3/12.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFRecordDetailsTableCell.h"


@interface ZFRecordDetailsTableCell()

@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UILabel* moneyLabel;
@property (nonatomic, strong) UILabel* paymentedLabel;
@property (nonatomic, strong) UILabel* evaluateLabel;
@property (nonatomic, strong) UIButton *purchaseButton;

@end

@implementation ZFRecordDetailsTableCell

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
    self.contentView.backgroundColor = TableViewBGColor;
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.paymentedLabel];
    [self.contentView addSubview:self.evaluateLabel];
    [self.contentView addSubview:self.purchaseButton];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(25);
        make.top.mas_equalTo(10);
        make.width.height.mas_equalTo(75);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(15);
        make.right.mas_equalTo(-20);
        make.top.equalTo(self->_iconView.mas_top);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(15);
        make.top.equalTo(self->_titleLabel.mas_bottom).offset(5);
    }];
    
    [_paymentedLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(15);
        make.top.equalTo(self->_moneyLabel.mas_bottom).offset(5);
        make.bottom.equalTo(self->_iconView.mas_bottom);
    }];
    
    [_evaluateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_paymentedLabel.mas_right).offset(15);
        make.centerY.equalTo(self->_paymentedLabel);
    }];
    
    [_purchaseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-25);
        make.width.mas_equalTo(47);
        make.height.mas_equalTo(20);
        make.bottom.equalTo(self->_evaluateLabel.mas_bottom);
    }];
    
}

- (void)setDetailModel:(ZFGoodModel *)detailModel{
    _detailModel = detailModel;
    if (!kStringIsEmpty(detailModel.original_img))
    {
        NSString* str = [NSString stringWithFormat:@"%@%@",ImageUrl,detailModel.original_img];
        [_iconView sd_setImageWithURL:[NSURL URLWithString:str]];
    }
    _titleLabel.text = [NSString stringWithFormat:@"%@",detailModel.goods_name];
    _moneyLabel.text = [NSString stringWithFormat:@"¥ %@",detailModel.shop_price];
    _paymentedLabel.text = [NSString stringWithFormat:@"已付款%ld",(long)detailModel.sales_sum];
    _evaluateLabel.text = [NSString stringWithFormat:@"已评价%ld",(long)detailModel.comment_count];
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
        _titleLabel.textColor = RGBColorHex(0x1a1a1a);
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.numberOfLines = 0;
        _titleLabel.text = @"女式花瓣连衣裙女式花瓣连衣裙";
    }
    return _titleLabel;
}

- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = RGBColorHex(0xe51c23);
        _moneyLabel.font = [UIFont systemFontOfSize:19];
        _moneyLabel.text = @"¥ 399.00";
    }
    return _moneyLabel;
}

- (UILabel *)paymentedLabel {
    if (_paymentedLabel == nil) {
        _paymentedLabel = [[UILabel alloc] init];
        _paymentedLabel.textColor = RGBColorHex(0x666666);
        _paymentedLabel.font = [UIFont systemFontOfSize:12];
        _paymentedLabel.text = @"已付款6";
    }
    return _paymentedLabel;
}

- (UILabel *)evaluateLabel {
    if (_evaluateLabel == nil) {
        _evaluateLabel = [[UILabel alloc] init];
        _evaluateLabel.textColor = RGBColorHex(0x666666);
        _evaluateLabel.font = [UIFont systemFontOfSize:12];
        _evaluateLabel.text = @"已付款10";
    }
    return _evaluateLabel;
}

- (UIButton *)purchaseButton {
    if (_purchaseButton == nil) {
        _purchaseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_purchaseButton setTitle:@"购买" forState:UIControlStateNormal];
        [_purchaseButton setTitleColor:RGBColorHex(0xe51c23) forState:UIControlStateNormal];
        _purchaseButton.titleLabel.font = [UIFont systemFontOfSize:13];
        _purchaseButton.layer.borderWidth = 1.0f;
        _purchaseButton.layer.borderColor = RGBColorHex(0xe51c23).CGColor;
        _purchaseButton.layer.cornerRadius = 3;
        _purchaseButton.clipsToBounds = YES;
        [_purchaseButton addTarget:self action:@selector(purchaseButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _purchaseButton;
}
#pragma mark -- 购买
- (void)purchaseButtonDidClick
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ZFRecordDetailsTableCellDidClick:)])
    {
        [self.delegate ZFRecordDetailsTableCellDidClick:self.detailModel];
    }
}

@end
