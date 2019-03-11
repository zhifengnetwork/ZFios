//
//  ZFAddressTableCell.m
//  ZF
//
//  Created by apple on 2019/3/6.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFAddressTableCell.h"

@interface ZFAddressTableCell()

@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* telephoneLabel;
@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel* addressLabel;
@property (nonatomic, strong) UIImageView* nextView;

@end

@implementation ZFAddressTableCell

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
    [self.contentView addSubview:self.telephoneLabel];
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.addressLabel];
    [self.contentView addSubview:self.nextView];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.top.mas_equalTo(15);
    }];
    
    [_telephoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(15);
        make.left.equalTo(self->_nameLabel.mas_right).offset(20);
        
    }];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.equalTo(self->_nameLabel.mas_bottom).offset(13);
    }];
    
    [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(5);
        make.top.equalTo(self->_nameLabel.mas_bottom).offset(13);
    }];
    
    [_nextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-25);
        make.centerY.equalTo(self.contentView);
    }];
    
}

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColorHex(0x333333);
        _nameLabel.font = [UIFont systemFontOfSize:16];
        _nameLabel.text = @"潘多拉";
    }
    return _nameLabel;
}

- (UILabel *)telephoneLabel {
    if (_telephoneLabel == nil) {
        _telephoneLabel = [[UILabel alloc] init];
        _telephoneLabel.textColor = RGBColorHex(0x333333);
        _telephoneLabel.font = [UIFont systemFontOfSize:16];
        _telephoneLabel.text = @"13689828976";
    }
    return _telephoneLabel;
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"dingwei"];
    }
    return _iconView;
}


- (UILabel *)addressLabel {
    if (_addressLabel == nil) {
        _addressLabel = [[UILabel alloc] init];
        _addressLabel.textColor = RGBColorHex(0x333333);
        _addressLabel.font = [UIFont systemFontOfSize:13];
        _addressLabel.text = @"广州市白云区荣新路73号";
    }
    return _addressLabel;
}

- (UIImageView *)nextView {
    if (_nextView == nil) {
        _nextView = [[UIImageView alloc] init];
        _nextView.image = [UIImage imageNamed:@"youjiantou"];
    }
    return _nextView;
}


@end
