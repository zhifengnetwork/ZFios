//
//  ZFDetailBalanceTableCell.m
//  ETH
//
//  Created by admin on 2019/4/18.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ZFDetailBalanceTableCell.h"

@interface ZFDetailBalanceTableCell()

@property (nonatomic, strong) UILabel* numberLabel;
@property (nonatomic, strong) UILabel* moneyLabel;
@property (nonatomic, strong) UILabel* timeLabel;
@property (nonatomic, strong) UILabel* titleLabel;

@end

@implementation ZFDetailBalanceTableCell

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
    [self.contentView addSubview:self.numberLabel];
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.titleLabel];
    
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(10);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.equalTo(self->_numberLabel.mas_bottom).offset(5);
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.equalTo(self->_moneyLabel.mas_bottom).offset(5);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.equalTo(self->_timeLabel.mas_bottom).offset(5);
    }];
    
    //下面横线
    UIView *hLineView = [[UIView alloc] init];
    hLineView.backgroundColor = RGBColorHex(0xcccccc);
    [self.contentView addSubview:hLineView];
    
    [hLineView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.mas_equalTo(0);
         make.right.mas_equalTo(-0);
         make.bottom.equalTo(self.contentView);
         make.height.mas_equalTo(0.5f);
     }];
    
}

-(void)setDetailBalanceModel:(ZFDetailBalanceModel *)detailBalanceModel
{
    _detailBalanceModel = detailBalanceModel;
    
    _numberLabel.text = [NSString stringWithFormat:@"订单编号：%@",_detailBalanceModel.order_sn];
    _moneyLabel.text = [NSString stringWithFormat:@"变动金额：%@",_detailBalanceModel.user_money];
    _timeLabel.text = [NSString stringWithFormat:@"变动时间：%@",_detailBalanceModel.change_time];
    _titleLabel.text = [NSString stringWithFormat:@"描述：%@",_detailBalanceModel.desc];
}

- (UILabel *)numberLabel {
    if (_numberLabel == nil) {
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.textColor = RGBColorHex(0x151515);
        _numberLabel.font = [UIFont systemFontOfSize:12];
        _numberLabel.text = @"订单编号：123455";
    }
    return _numberLabel;
}

- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = RGBColorHex(0x151515);
        _moneyLabel.font = [UIFont systemFontOfSize:12];
        _moneyLabel.text = @"变动金额：78.00";
    }
    return _moneyLabel;
}

- (UILabel *)timeLabel {
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textColor = RGBColorHex(0x151515);
        _timeLabel.font = [UIFont systemFontOfSize:12];
        _timeLabel.text = @"变动时间：2019-05-05 17:11:05";
    }
    return _timeLabel;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0x151515);
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.text = @"描述：分销所得佣金";
    }
    return _titleLabel;
}

@end
