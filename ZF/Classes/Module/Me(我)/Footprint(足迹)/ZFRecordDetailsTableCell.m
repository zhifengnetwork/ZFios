//
//  ZFRecordDetailsTableCell.m
//  ZF
//
//  Created by apple on 2019/3/12.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFRecordDetailsTableCell.h"

@interface ZFRecordDetailsTableCell()

@property (nonatomic, strong) UIView *bgView;
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
    [self.contentView addSubview:self.bgView];
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.paymentedLabel];
    [self.contentView addSubview:self.evaluateLabel];
    [self.contentView addSubview:self.purchaseButton];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(191);
    }];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(25);
        make.top.mas_equalTo(10);
        make.width.height.mas_equalTo(75);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(15);
        make.top.equalTo(self->_iconView.mas_top);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(15);
        make.top.equalTo(self->_titleLabel.mas_bottom).offset(10);
    }];
    
    [_paymentedLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(15);
        make.top.equalTo(self->_moneyLabel.mas_bottom).offset(10);
        make.bottom.equalTo(self->_iconView.mas_bottom);
    }];
    
    [_evaluateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_paymentedLabel.mas_right).offset(15);
        make.centerY.equalTo(self->_paymentedLabel);
    }];
    
    [_purchaseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->_bgView.mas_right).offset(-10);
        make.bottom.equalTo(self->_evaluateLabel.mas_bottom);
    }];
    
}

-(UIView *)bgView
{
    if(_bgView==nil)
    {
        _bgView = [[UIView alloc]initWithFrame:CGRectZero];
        _bgView.backgroundColor = RGBColorHex(0xffffff);
        _bgView.clipsToBounds = YES;
        _bgView.layer.cornerRadius = 5.0f;
    }
    return _bgView;
}

//- (UILabel *)nameLabel {
//    if (_nameLabel == nil) {
//        _nameLabel = [[UILabel alloc] init];
//        _nameLabel.textColor = RGBColorHex(0x0f0f0f);
//        _nameLabel.font = [UIFont systemFontOfSize:15];
//        _nameLabel.text = @"张三";
//    }
//    return _nameLabel;
//}
//
//- (UILabel *)phoneLabel {
//    if (_phoneLabel == nil) {
//        _phoneLabel = [[UILabel alloc] init];
//        _phoneLabel.textColor = RGBColorHex(0x0f0f0f);
//        _phoneLabel.font = [UIFont systemFontOfSize:15];
//        _phoneLabel.text = @"18649509302";
//    }
//    return _phoneLabel;
//}
//
//- (UILabel *)addressLabel {
//    if (_addressLabel == nil) {
//        _addressLabel = [[UILabel alloc] init];
//        _addressLabel.textColor = RGBColorHex(0x424242);
//        _addressLabel.font = [UIFont systemFontOfSize:12];
//        _addressLabel.text = @"广东省广州市白云区";
//    }
//    return _addressLabel;
//}


- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"modify"];
        //头像点击事件
        _iconView.userInteractionEnabled = YES;
        UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        [_iconView addGestureRecognizer:singleTap];
    }
    return _iconView;
}
//
//- (void)handleSingleTap:(UITouch *)touch
//{
//    if (self.delegate && [self.delegate respondsToSelector:@selector(ZFAddressManagementTableCellDidClick)])
//    {
//        [self.delegate ZFAddressManagementTableCellDidClick];
//    }
//}

@end
