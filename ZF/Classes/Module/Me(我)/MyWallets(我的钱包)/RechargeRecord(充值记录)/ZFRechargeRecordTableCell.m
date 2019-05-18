//
//  ZFRechargeRecordTableCell.m
//  ZF
//
//  Created by admin on 2019/5/18.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFRechargeRecordTableCell.h"
#import "ZFTool.h"

@interface ZFRechargeRecordTableCell()

@property (nonatomic, strong) UILabel *methodLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *moneyLabel;
@property (nonatomic, strong) UILabel *stateLabel;

@end

@implementation ZFRechargeRecordTableCell

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
    [self.contentView addSubview:self.methodLabel];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.stateLabel];
    
    [_methodLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_methodLabel.mas_right).offset(50);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_timeLabel.mas_right).offset(40);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.centerY.equalTo(self.contentView);
    }];
    
}

-(void)setRechargeRecordModel:(ZFRechargeRecordModel *)rechargeRecordModel
{
    _rechargeRecordModel = rechargeRecordModel;
    
    _methodLabel.text = _rechargeRecordModel.pay_name;
    _timeLabel.text = _rechargeRecordModel.ctime;
    _timeLabel.text = [ZFTool Rechargedate:_rechargeRecordModel.ctime];
    _moneyLabel.text = _rechargeRecordModel.account;
    _stateLabel.text = [_rechargeRecordModel getStatusText];
}


- (UILabel *)methodLabel {
    if (_methodLabel == nil) {
        _methodLabel = [[UILabel alloc] init];
        _methodLabel.textColor = RGBColorHex(0x333333);
        _methodLabel.font = [UIFont systemFontOfSize:14];
        _methodLabel.text = @"支付方式";
    }
    return _methodLabel;
}

- (UILabel *)timeLabel {
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textColor = RGBColorHex(0x333333);
        _timeLabel.font = [UIFont systemFontOfSize:14];
        _timeLabel.text = @"日期";
    }
    return _timeLabel;
}

- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = RGBColorHex(0x333333);
        _moneyLabel.font = [UIFont systemFontOfSize:14];
        _moneyLabel.text = @"金额";
    }
    return _moneyLabel;
}

- (UILabel *)stateLabel {
    if (_stateLabel == nil) {
        _stateLabel = [[UILabel alloc] init];
        _stateLabel.textColor = RGBColorHex(0x333333);
        _stateLabel.font = [UIFont systemFontOfSize:14];
        _stateLabel.text = @"状态";
    }
    return _stateLabel;
}

@end
