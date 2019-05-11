//
//  ZFMyMemberTableCell.m
//  ZF
//
//  Created by admin on 2019/5/11.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFMyMemberTableCell.h"

@interface ZFMyMemberTableCell()

@property (nonatomic, strong) UILabel *userLabel;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *orderLabel;

@end

@implementation ZFMyMemberTableCell

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
    [self.contentView addSubview:self.userLabel];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.orderLabel];
    
    [_userLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(self.contentView);
    }];
    
    [_orderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.mas_equalTo(-10);
    }];
    
}


- (UILabel *)userLabel {
    if (_userLabel == nil) {
        _userLabel = [[UILabel alloc] init];
        _userLabel.textColor = RGBColorHex(0x333333);
        _userLabel.font = [UIFont systemFontOfSize:14];
        _userLabel.text = @"用户ID";
    }
    return _userLabel;
}

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColorHex(0x333333);
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.text = @"名称";
    }
    return _nameLabel;
}

- (UILabel *)orderLabel {
    if (_orderLabel == nil) {
        _orderLabel = [[UILabel alloc] init];
        _orderLabel.textColor = RGBColorHex(0x333333);
        _orderLabel.font = [UIFont systemFontOfSize:14];
        _orderLabel.text = @"订单";
    }
    return _orderLabel;
}

@end
