//
//  ZFSecondkillMerTableCell.m
//  ZF
//
//  Created by apple on 2019/3/7.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFSecondkillMerTableCell.h"

@interface ZFSecondkillMerTableCell()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* secondLabel;
@property (nonatomic, strong) UILabel* secondTimeLabel;
@property (nonatomic, strong) UILabel* timeLabel;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UILabel* moneyLabel;
@property (nonatomic, strong) UILabel* money2Label;
@property (nonatomic, strong) UILabel* salesLabel;
@property (nonatomic, strong) UILabel* stockLabel;

@end

@implementation ZFSecondkillMerTableCell

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
    self.contentView.backgroundColor = RGBColorHex(0xf3f5f7);
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.secondLabel];
    [self.contentView addSubview:self.bgView];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.secondTimeLabel];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.money2Label];
    [self.contentView addSubview:self.salesLabel];
    [self.contentView addSubview:self.stockLabel];
    

    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(112);
        make.height.mas_equalTo(42);
        make.top.mas_equalTo(16);
        make.right.mas_equalTo(-10);
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(5);
        make.top.equalTo(self->_bgView.mas_top).offset(5);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(15);
    }];
    
    [_secondLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.equalTo(self->_nameLabel.mas_bottom).offset(5);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(17);
    }];
    
    [_secondTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->_bgView.mas_right).offset(-5);
        make.bottom.equalTo(self->_bgView.mas_bottom).offset(-5);
    }];
    
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.equalTo(self->_secondLabel.mas_bottom).offset(5);
        make.right.mas_equalTo(-10);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.equalTo(self->_titleLabel.mas_bottom).offset(20);
    }];
    
    [_money2Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.equalTo(self->_moneyLabel);
    }];
    
    [_salesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.equalTo(self->_moneyLabel.mas_bottom).offset(15);
    }];
    
    [_stockLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self->_salesLabel);
        make.left.equalTo(self->_salesLabel.mas_right).offset(20);
    }];
    
}

-(UIView *)bgView
{
    if(_bgView==nil)
    {
        _bgView = [[UIView alloc]initWithFrame:CGRectZero];
        _bgView.backgroundColor = RGBColorHex(0xf3f5f7);
        _bgView.layer.borderWidth = 1.0f;
        _bgView.layer.borderColor = RGBColorHex(0xe60b30).CGColor;
    }
    return _bgView;
}

- (UILabel *)timeLabel {
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textColor = RGBColorHex(0xe60b30);
        _timeLabel.font = [UIFont systemFontOfSize:12];
        _timeLabel.text = @"距离秒杀开始";
    }
    return _timeLabel;
}

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColorHex(0x333333);
        _nameLabel.font = [UIFont systemFontOfSize:16];
        _nameLabel.text = @"Apple/p iphone XR";
    }
    return _nameLabel;
}

- (UILabel *)secondLabel {
    if (_secondLabel == nil) {
        _secondLabel = [[UILabel alloc] init];
        _secondLabel.textColor = RGBColorHex(0xe60b30);
        _secondLabel.font = [UIFont systemFontOfSize:12];
        _secondLabel.layer.borderWidth = 1.0f;
        _secondLabel.layer.borderColor = RGBColorHex(0xe60b30).CGColor;
        _secondLabel.text = @"  秒杀 ";
    }
    return _secondLabel;
}

- (UILabel *)secondTimeLabel {
    if (_secondTimeLabel == nil) {
        _secondTimeLabel = [[UILabel alloc] init];
        _secondTimeLabel.textColor = RGBColorHex(0xe60b30);
        _secondTimeLabel.font = [UIFont systemFontOfSize:12];
        _secondTimeLabel.text = @"00:00:00:00";
    }
    return _secondTimeLabel;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0x666666);
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.text = @"苹果 iphone XR 移动联通电信4G双卡双待苹果 iphone XR ";
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = RGBColorHex(0xe60b30);
        _moneyLabel.font = [UIFont systemFontOfSize:16];
        _moneyLabel.text = @"¥ 7999";
    }
    return _moneyLabel;
}

- (UILabel *)money2Label {
    if (_money2Label == nil) {
        _money2Label = [[UILabel alloc] init];
        _money2Label.textColor = RGBColorHex(0x999999);
        _money2Label.font = [UIFont systemFontOfSize:10];
        _money2Label.text = @"市场价格 ¥7999";
    }
    return _money2Label;
}

- (UILabel *)salesLabel {
    if (_salesLabel == nil) {
        _salesLabel = [[UILabel alloc] init];
        _salesLabel.textColor = RGBColorHex(0x999999);
        _salesLabel.font = [UIFont systemFontOfSize:10];
        _salesLabel.text = @"销量：1W+";
    }
    return _salesLabel;
}

- (UILabel *)stockLabel {
    if (_stockLabel == nil) {
        _stockLabel = [[UILabel alloc] init];
        _stockLabel.textColor = RGBColorHex(0x999999);
        _stockLabel.font = [UIFont systemFontOfSize:10];
        _stockLabel.text = @"当前库存：1+件";
    }
    return _stockLabel;
}


@end
