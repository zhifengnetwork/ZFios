//
//  ZFAddressManagementTableCell.m
//  ZF
//
//  Created by apple on 2019/3/12.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFAddressManagementTableCell.h"

@interface ZFAddressManagementTableCell()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* phoneLabel;
@property (nonatomic, strong) UILabel* addressLabel;
@property (nonatomic, strong) UIImageView* iconView;

@end

@implementation ZFAddressManagementTableCell

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
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.phoneLabel];
    [self.contentView addSubview:self.addressLabel];
    [self.contentView addSubview:self.iconView];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(66);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(15);
        make.top.equalTo(self->_bgView.mas_top).offset(15);
    }];
    
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_nameLabel.mas_right).offset(15);
        make.top.equalTo(self->_bgView.mas_top).offset(15);
    }];
    
    [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(15);
        make.top.equalTo(self->_nameLabel.mas_bottom).offset(8);
    }];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->_bgView.mas_right).offset(-15);
        make.centerY.equalTo(self->_bgView);
    }];
    
}

- (void)setAddressEditModel:(ZFAddressEditModel *)addressEditModel
{
    _addressEditModel = addressEditModel;
    
    _nameLabel.text = _addressEditModel.consignee;
    _phoneLabel.text = _addressEditModel.mobile;
    _addressLabel.text = _addressEditModel.address;
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

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColorHex(0x0f0f0f);
        _nameLabel.font = [UIFont systemFontOfSize:15];
        _nameLabel.text = @"张三";
    }
    return _nameLabel;
}

- (UILabel *)phoneLabel {
    if (_phoneLabel == nil) {
        _phoneLabel = [[UILabel alloc] init];
        _phoneLabel.textColor = RGBColorHex(0x0f0f0f);
        _phoneLabel.font = [UIFont systemFontOfSize:15];
        _phoneLabel.text = @"18649509302";
    }
    return _phoneLabel;
}

- (UILabel *)addressLabel {
    if (_addressLabel == nil) {
        _addressLabel = [[UILabel alloc] init];
        _addressLabel.textColor = RGBColorHex(0x424242);
        _addressLabel.font = [UIFont systemFontOfSize:12];
        _addressLabel.text = @"广东省广州市白云区";
    }
    return _addressLabel;
}


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

- (void)handleSingleTap:(UITouch *)touch
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ZFAddressManagementTableCellDidClick:)])
    {
        [self.delegate ZFAddressManagementTableCellDidClick:self.addressEditModel];
    }
}


@end
