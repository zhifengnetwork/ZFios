//
//  ZFMyIntegralTableCell.m
//  ZF
//
//  Created by admin on 2019/3/19.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFMyIntegralTableCell.h"

@interface ZFMyIntegralTableCell()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *integralLabel;
@property (nonatomic, strong) UILabel *numberLabel;
@property (nonatomic, strong) UILabel *timeLabel;

@end

@implementation ZFMyIntegralTableCell

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
    [self.contentView addSubview:self.bgView];
    [self.contentView addSubview:self.integralLabel];
    [self.contentView addSubview:self.numberLabel];
    [self.contentView addSubview:self.timeLabel];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(30);
        make.top.mas_equalTo(30);
    }];
    
    [_integralLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(45);
        make.centerY.equalTo(self->_bgView);
    }];
    
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self->_bgView);
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->_bgView.mas_right).offset(-25);
        make.centerY.equalTo(self->_bgView);
    }];
    
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    _integralLabel.text = _title;
}

- (UILabel *)integralLabel {
    if (_integralLabel == nil) {
        _integralLabel = [[UILabel alloc] init];
        _integralLabel.textColor = RGBColorHex(0xff8348);
        _integralLabel.font = [UIFont systemFontOfSize:14];
        _integralLabel.text = @"签到积分";
    }
    return _integralLabel;
}


- (UILabel *)numberLabel {
    if (_numberLabel == nil) {
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.textColor = RGBColorHex(0xff8348);
        _numberLabel.font = [UIFont systemFontOfSize:14];
        _numberLabel.text = @"+2分";
    }
    return _numberLabel;
}

- (UILabel *)timeLabel {
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textColor = RGBColorHex(0xff8348);
        _timeLabel.font = [UIFont systemFontOfSize:14];
        _timeLabel.text = @"系统时间....";
    }
    return _timeLabel;
}

-(UIView *)bgView
{
    if(_bgView==nil)
    {
        _bgView = [[UIView alloc]initWithFrame:CGRectZero];
        _bgView.backgroundColor = RGBColorHex(0xffecbb);
        _bgView.layer.cornerRadius = 15.0f;
        _bgView.clipsToBounds = YES;
    }
    return _bgView;
}

@end
