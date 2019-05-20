//
//  ZFWithdrawalsRecordTableCell.m
//  ZF
//
//  Created by admin on 2019/5/20.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFWithdrawalsRecordTableCell.h"
#import "ZFTool.h"

@interface ZFWithdrawalsRecordTableCell()

@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *moneyLabel;
@property (nonatomic, strong) UILabel *serviceLabel;
@property (nonatomic, strong) UILabel *stateLabel;

@end

@implementation ZFWithdrawalsRecordTableCell

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
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.serviceLabel];
    [self.contentView addSubview:self.stateLabel];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_timeLabel.mas_right).offset(35);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_serviceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(230);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.centerY.equalTo(self.contentView);
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

-(void)setWithRecordModel:(ZFWithRecordModel *)withRecordModel
{
    _withRecordModel = withRecordModel;
    
    _timeLabel.text = [ZFTool Rechargedate:_withRecordModel.create_time];
    _moneyLabel.text = _withRecordModel.money;
    _serviceLabel.text = _withRecordModel.taxfee;
    _stateLabel.text = [_withRecordModel getCashText];
}

- (UILabel *)timeLabel {
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textColor = RGBColorHex(0x333333);
        _timeLabel.font = [UIFont systemFontOfSize:14];
    }
    return _timeLabel;
}

- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = RGBColorHex(0x333333);
        _moneyLabel.font = [UIFont systemFontOfSize:14];
    }
    return _moneyLabel;
}

- (UILabel *)serviceLabel {
    if (_serviceLabel == nil) {
        _serviceLabel = [[UILabel alloc] init];
        _serviceLabel.textColor = RGBColorHex(0x333333);
        _serviceLabel.font = [UIFont systemFontOfSize:14];
    }
    return _serviceLabel;
}

- (UILabel *)stateLabel {
    if (_stateLabel == nil) {
        _stateLabel = [[UILabel alloc] init];
        _stateLabel.textColor = RGBColorHex(0x333333);
        _stateLabel.font = [UIFont systemFontOfSize:14];
    }
    return _stateLabel;
}

@end
