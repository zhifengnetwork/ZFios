//
//  ZFBottomOrderTableCell.m
//  ZF
//
//  Created by admin on 2019/3/21.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFBottomOrderTableCell.h"

@interface ZFBottomOrderTableCell()

@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* numberLabel;
@property (nonatomic, strong) UILabel* moneyLabel;
@property (nonatomic, strong) UIButton *deliverButton;
@property (nonatomic, strong) UIButton *orderButton;

@end

@implementation ZFBottomOrderTableCell

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
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.numberLabel];
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.deliverButton];
    [self.contentView addSubview:self.orderButton];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(12);
    }];
    
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_nameLabel.mas_right).offset(115);
        make.top.mas_equalTo(12);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.bottom.equalTo(self->_numberLabel.mas_bottom);
    }];
    
    [_deliverButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_numberLabel.mas_bottom).offset(8);
        make.right.equalTo(self->_orderButton.mas_right).offset(13);
    }];
    
    [_orderButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.top.equalTo(self->_moneyLabel.mas_bottom).offset(8);
    }];
    
}

- (void)deliverButtonDidClick
{
    
}

- (void)orderButtonDidClick
{
    
}



- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColorHex(0x6f6f6f);
        _nameLabel.font = [UIFont systemFontOfSize:12];
        _nameLabel.text = @"欧欧记";
    }
    return _nameLabel;
}

- (UILabel *)numberLabel {
    if (_numberLabel == nil) {
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.textColor = RGBColorHex(0x6f6f6f);
        _numberLabel.font = [UIFont systemFontOfSize:12];
        _numberLabel.text = @"共2件 应付总额";
    }
    return _numberLabel;
}

- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = RGBColorHex(0xE51C23);
        _moneyLabel.font = [UIFont systemFontOfSize:14];
        _moneyLabel.text = @"¥ 399.00";
    }
    return _moneyLabel;
}

- (UIButton *)deliverButton {
    if (_deliverButton == nil) {
        _deliverButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deliverButton setTitle:@"提醒发货" forState:UIControlStateNormal];
        [_deliverButton setTitleColor:RGBColorHex(0xe51c23) forState:UIControlStateNormal];
        _deliverButton.titleLabel.font = [UIFont systemFontOfSize:12];
        _deliverButton.backgroundColor = RGBColorHex(0xFFCDCF);
        [_deliverButton addTarget:self action:@selector(deliverButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deliverButton;
}

- (UIButton *)orderButton {
    if (_orderButton == nil) {
        _orderButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_orderButton setTitle:@"取消订单" forState:UIControlStateNormal];
        [_orderButton setTitleColor:RGBColorHex(0xFF5600) forState:UIControlStateNormal];
        _orderButton.titleLabel.font = [UIFont systemFontOfSize:12];
        _orderButton.backgroundColor = RGBColorHex(0xFDDECF);
        [_orderButton addTarget:self action:@selector(orderButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _orderButton;
}


@end
