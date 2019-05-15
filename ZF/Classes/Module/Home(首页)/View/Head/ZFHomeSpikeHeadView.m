//
//  ZFHomeSpikeHeadView.m
//  ZF
//
//  Created by apple on 2019/3/4.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFHomeSpikeHeadView.h"
#import "ZFTool.h"


@interface ZFHomeSpikeHeadView()

@property (nonatomic, strong) UIImageView* iconView;
//@property (strong , nonatomic)UILabel *timeLabel;
//@property (nonatomic, strong) UIImageView* iconView2;
//
//@property (strong, nonatomic)  UILabel *hourLabel;
//@property (strong, nonatomic)  UILabel *minuteLabel;
//@property (strong, nonatomic)  UILabel *secondLabel;
//@property (strong, nonatomic)  UILabel *mLabel;
//@property (strong, nonatomic)  UILabel *sLabel;

@property (strong , nonatomic) UIButton *moreButton;

@end

@implementation ZFHomeSpikeHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    [self addSubview:self.iconView];
//    [self addSubview:self.timeLabel];
//    [self addSubview:self.iconView2];
    [self addSubview:self.moreButton];
//    [self addSubview:self.hourLabel];
//    [self addSubview:self.minuteLabel];
//    [self addSubview:self.secondLabel];
//    [self addSubview:self.mLabel];
//    [self addSubview:self.sLabel];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.mas_equalTo(25);
    }];
    
//    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self);
//        make.left.equalTo(self->_iconView.mas_right).offset(24);
//    }];
//
//    [_iconView2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self);
//        make.left.equalTo(self->_timeLabel.mas_right).offset(12);
//    }];
//
//    [_hourLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self);
//        make.left.equalTo(self->_iconView2.mas_right).offset(8);
//    }];
//
//    [_minuteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self);
//        make.left.equalTo(self->_hourLabel.mas_right).offset(5);
//    }];
//
//    [_secondLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self);
//        make.left.equalTo(self->_minuteLabel.mas_right).offset(5);
//    }];
//
//    [_mLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self);
//        make.left.equalTo(self->_hourLabel.mas_right);
//    }];
//
//    [_sLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self);
//        make.left.equalTo(self->_minuteLabel.mas_right);
//    }];
    
    [_moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.mas_equalTo(-10);
    }];
}

//-(void)setTimeString:(NSString *)timeString
//{
//    _timeString = timeString;
//    NSArray* array = [ZFTool strToArr:_timeString Separator:@":"];
//    if (array.count>2)
//    {
//        self.hourLabel.text = array[0];
//        self.minuteLabel.text = array[1];
//        self.secondLabel.text = array[2];
//    }
//}


- (void)moreButtonClick
{
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(ZFHomeSpikeHeadViewDidClick)])
    {
        [self.delegate ZFHomeSpikeHeadViewDidClick];
    }
}


- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"miaosa1"];
    }
    return _iconView;
}

//- (UILabel *)timeLabel {
//    if (_timeLabel == nil) {
//        _timeLabel = [[UILabel alloc] init];
//        _timeLabel.textColor = RGBColor(21,21,21);
//        _timeLabel.font = [UIFont systemFontOfSize:11];
//        _timeLabel.text = @"剩余时间";
//    }
//    return _timeLabel;
//}
//
//- (UIImageView *)iconView2 {
//    if (_iconView2 == nil) {
//        _iconView2 = [[UIImageView alloc] init];
//        _iconView2.image = [UIImage imageNamed:@"nz"];
//    }
//    return _iconView2;
//}
//
//-(UILabel *)hourLabel
//{
//    if (_hourLabel==nil) {
//        _hourLabel = [[UILabel alloc] init];
//        _hourLabel.textColor = [UIColor redColor];
//        _hourLabel.font = [UIFont systemFontOfSize:15];
//        _hourLabel.text = @"00";
//        _hourLabel.layer.borderWidth = 0.5f;
//        _hourLabel.layer.borderColor = [UIColor blackColor].CGColor;
//    }
//    return _hourLabel;
//}
//
//-(UILabel *)minuteLabel
//{
//    if (_minuteLabel==nil) {
//        _minuteLabel = [[UILabel alloc] init];
//        _minuteLabel.textColor = [UIColor redColor];
//        _minuteLabel.font = [UIFont systemFontOfSize:15];
//        _minuteLabel.text = @"00";
//        _minuteLabel.layer.borderWidth = 0.5f;
//        _minuteLabel.layer.borderColor = [UIColor blackColor].CGColor;
//    }
//    return _minuteLabel;
//}
//
//-(UILabel *)secondLabel
//{
//    if (_secondLabel==nil) {
//        _secondLabel = [[UILabel alloc] init];
//        _secondLabel.textColor = [UIColor redColor];
//        _secondLabel.font = [UIFont systemFontOfSize:15];
//        _secondLabel.text = @"00";
//        _secondLabel.layer.borderWidth = 0.5f;
//        _secondLabel.layer.borderColor = [UIColor blackColor].CGColor;
//    }
//    return _secondLabel;
//}
//
//-(UILabel *)mLabel
//{
//    if (_mLabel==nil) {
//        _mLabel = [[UILabel alloc] init];
//        _mLabel.textColor = [UIColor blackColor];
//        _mLabel.font = [UIFont systemFontOfSize:15];
//        _mLabel.text = @":";
//    }
//    return _mLabel;
//}
//
//-(UILabel *)sLabel
//{
//    if (_sLabel==nil) {
//        _sLabel = [[UILabel alloc] init];
//        _sLabel.textColor = [UIColor blackColor];
//        _sLabel.font = [UIFont systemFontOfSize:15];
//        _sLabel.text = @":";
//    }
//    return _sLabel;
//}


-(UIButton*)moreButton
{
    if (_moreButton==nil) {
        _moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_moreButton setTitle:@"更多好货 >" forState:UIControlStateNormal];
        [_moreButton setTitleColor:RGBColor(21, 21, 21) forState:UIControlStateNormal];
        _moreButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_moreButton addTarget:self action:@selector(moreButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _moreButton;
}

@end
