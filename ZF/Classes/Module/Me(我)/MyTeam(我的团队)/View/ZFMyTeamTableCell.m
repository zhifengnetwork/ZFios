//
//  ZFMyTeamTableCell.m
//  ZF
//
//  Created by admin on 2019/3/19.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFMyTeamTableCell.h"


@interface ZFMyTeamTableCell()

@property (nonatomic, strong) UILabel *myLabel;
@property (nonatomic, strong) UILabel *agentLabel;
@property (nonatomic, strong) UILabel *moneyLabel;
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UIView *hLineView;

@end

@implementation ZFMyTeamTableCell

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
    self.contentView.backgroundColor = RGBColorHex(0xe7eff7);
    [self.contentView addSubview:self.myLabel];
    [self.contentView addSubview:self.agentLabel];
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.hLineView];
    
    [_myLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(22);
        make.top.mas_equalTo(8);
    }];
    
    [_agentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(22);
        make.top.equalTo(self->_myLabel.mas_bottom).offset(3);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(self.contentView);
    }];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.mas_equalTo(-22);
    }];
    
    [_hLineView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.right.mas_equalTo(0);
         make.bottom.equalTo(self.contentView);
         make.height.mas_equalTo(0.5f);
     }];
    _hLineView.hidden = NO;
    
}


- (void)setName:(NSString *)name
{
    _name = name;
    _myLabel.text = _name;
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    _agentLabel.text = _title;
}


- (UILabel *)myLabel {
    if (_myLabel == nil) {
        _myLabel = [[UILabel alloc] init];
        _myLabel.textColor = RGBColorHex(0x333333);
        _myLabel.font = [UIFont systemFontOfSize:16];
        _myLabel.text = @"我的";
    }
    return _myLabel;
}


- (UILabel *)agentLabel {
    if (_agentLabel == nil) {
        _agentLabel = [[UILabel alloc] init];
        _agentLabel.textColor = RGBColorHex(0x999999);
        _agentLabel.font = [UIFont systemFontOfSize:10];
        _agentLabel.text = @"省代理";
    }
    return _agentLabel;
}

- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = RGBColorHex(0x333333);
        _moneyLabel.font = [UIFont systemFontOfSize:14];
        _moneyLabel.text = @"¥673,222";
    }
    return _moneyLabel;
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"xia"];
    }
    return _iconView;
}

-(UIView *)hLineView
{
    if (_hLineView)
    {
        //下面横线
        _hLineView = [[UIView alloc] init];
        _hLineView.backgroundColor = RGBColorHex(0xcccccc);
    }
    return _hLineView;
}

@end
