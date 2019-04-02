//
//  StaticTableCell.m
//  LS
//
//  Created by apple on 2019/02/25.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "StaticTableCell.h"

@implementation StaticTableCell

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
    [self.contentView addSubview:self.leftLabel];
    [self.contentView addSubview:self.left2Label];
    [self.contentView addSubview:self.middleLabel];
    [self.contentView addSubview:self.rightLabel];
    [self.contentView addSubview:self.right2Label];
    [self.contentView addSubview:self.leftIconView];
    [self.contentView addSubview:self.rightIconView];
    [self.contentView addSubview:self.bLineView];
    
    [_leftIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(LeadingTrailingMargin);
        make.centerY.equalTo(self.contentView);
    }];
    _leftIconView.hidden =  YES;
    
    [_leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(LeadingTrailingMargin);
        make.centerY.equalTo(self.contentView);
    }];
    _leftLabel.hidden =  YES;
    
    [_left2Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_leftIconView.mas_right).offset(10);
        make.centerY.equalTo(self.contentView);
    }];
    _left2Label.hidden =  YES;
    
    [_middleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.centerY.equalTo(self.contentView);
    }];
    _middleLabel.hidden = YES;
    
    [_rightIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-LeadingTrailingMargin);
        make.centerY.equalTo(self.contentView);
    }];
    _rightIconView.hidden = YES;
    
    [_rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-LeadingTrailingMargin);
        make.centerY.equalTo(self.contentView);
    }];
    _rightLabel.hidden = YES;
    
    [_right2Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->_rightIconView.mas_left).offset(-10);
        make.centerY.equalTo(self.contentView);
    }];
    _right2Label.hidden = YES;
    
    [_bLineView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.right.bottom.equalTo(self.contentView);
         make.height.mas_equalTo(0.5f);
     }];
    
}

- (UILabel *)leftLabel {
    if (_leftLabel == nil) {
        _leftLabel = [[UILabel alloc] init];
        _leftLabel.textColor = RGBColor(46, 46, 46);
        _leftLabel.font = [UIFont systemFontOfSize:15];
        _leftLabel.text = @"";
    }
    return _leftLabel;
}

- (UILabel *)left2Label {
    if (_left2Label == nil) {
        _left2Label = [[UILabel alloc] init];
        _left2Label.textColor = RGBColor(46, 46, 46);
        _left2Label.font = [UIFont systemFontOfSize:15];
        _left2Label.text = @"";
    }
    return _left2Label;
}

- (UILabel *)middleLabel {
    if (_middleLabel == nil) {
        _middleLabel = [[UILabel alloc] init];
        _middleLabel.textColor = RGBColor(46, 46, 46);
        _middleLabel.font = [UIFont systemFontOfSize:15];
        _middleLabel.text = @"";
    }
    return _middleLabel;
}

- (UILabel *)rightLabel {
    if (_rightLabel == nil) {
        _rightLabel = [[UILabel alloc] init];
        _rightLabel.textColor = RGBColor(46, 46, 46);
        _rightLabel.font = [UIFont systemFontOfSize:15];
        _rightLabel.text = @"";
    }
    return _rightLabel;
}

- (UILabel *)right2Label {
    if (_right2Label == nil) {
        _right2Label = [[UILabel alloc] init];
        _right2Label.textColor = RGBColor(46, 46, 46);
        _right2Label.font = [UIFont systemFontOfSize:15];
        _right2Label.text = @"";
    }
    return _right2Label;
}

- (UIImageView *)leftIconView
{
    if (_leftIconView == nil) {
        _leftIconView = [[UIImageView alloc] init];
    }
    return _leftIconView;
}

- (UIImageView *)rightIconView
{
    if (_rightIconView == nil) {
        _rightIconView = [[UIImageView alloc] init];
        _rightIconView.image = [UIImage imageNamed:@"icon-right-arrows"];
    }
    return _rightIconView;
}


-(UIView*)bLineView
{
    if (_bLineView==nil)
    {
        //下面横线
        _bLineView = [[UIView alloc] init];
        _bLineView.backgroundColor = RGBColor(224, 224, 224);
    }
    
    return _bLineView;
}


@end
