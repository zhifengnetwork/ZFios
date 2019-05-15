//
//  ZFBalanceControllerCell.m
//  ZF
//
//  Created by admin on 2019/5/15.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFBalanceControllerCell.h"
#import "UIView+HJViewStyle.h"

@interface ZFBalanceControllerCell()

@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* moneyLabel;

@end

@implementation ZFBalanceControllerCell

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
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.moneyLabel];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(26);
        make.centerX.equalTo(self.contentView).offset(-20);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self->_nameLabel.mas_right).offset(10);
        make.centerY.equalTo(self->_nameLabel);
    }];
    
}

-(void)setUserInfo:(UserInfoModel *)userInfo
{
    _userInfo = userInfo;
    
    _moneyLabel.text = _userInfo.user_money;
}


- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:15];
        _nameLabel.textColor = RGBColorHex(0x151515);
        _nameLabel.text = @"余额";
    }
    return _nameLabel;
}

- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.font = [UIFont systemFontOfSize:15];
        _moneyLabel.textColor = RGBColorHex(0xff007e);
        _moneyLabel.text = @"3000";
    }
    return _moneyLabel;
}

@end
