//
//  ZFMyWalletHeadView.m
//  ZF
//
//  Created by apple on 2019/3/2.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFMyWalletHeadView.h"

@interface ZFMyWalletHeadView()

@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* moneyLabel;

@end

@implementation ZFMyWalletHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    self.backgroundColor = TableViewBGColor;
    [self addSubview:self.iconView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.moneyLabel];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(15);
        make.height.mas_equalTo(155);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_iconView.mas_top).offset(42);
        make.centerX.equalTo(self->_iconView);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_nameLabel.mas_bottom).offset(11);
        make.centerX.equalTo(self->_iconView);
    }];
    
}

- (void)setOrderModel:(ZFOrdersModel *)orderModel
{
    _orderModel = orderModel;
    if (kStringIsEmpty(orderModel.user_money) == NO) {
        _moneyLabel.text = [NSString stringWithFormat:@"¥%@",_orderModel.user_money];
    }
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"tupian1"];
    }
    return _iconView;
}

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColorHex(0xffffff);
        _nameLabel.font = [UIFont systemFontOfSize:15];
        _nameLabel.text = @"可用余额";
    }
    return _nameLabel;
}

- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = RGBColorHex(0xffffff);
        _moneyLabel.font = [UIFont systemFontOfSize:15];
    }
    return _moneyLabel;
}


@end
