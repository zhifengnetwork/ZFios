//
//  ZFPublicTitleTableCell.m
//  ZF
//
//  Created by admin on 2019/3/19.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFPublicTitleTableCell.h"

@interface ZFPublicTitleTableCell()

@property (nonatomic, strong) UILabel *myLabel;
@property (nonatomic, strong) UILabel *publicLabel;
@property (nonatomic, strong) UILabel *timeLabel;

@end

@implementation ZFPublicTitleTableCell

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
    [self.contentView addSubview:self.myLabel];
    [self.contentView addSubview:self.publicLabel];
    [self.contentView addSubview:self.timeLabel];
    
    [_myLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_publicLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(self.contentView);
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-40);
        make.centerY.equalTo(self.contentView);
    }];
    
}

- (UILabel *)myLabel {
    if (_myLabel == nil) {
        _myLabel = [[UILabel alloc] init];
        _myLabel.textColor = RGBColorHex(0x333333);
        _myLabel.font = [UIFont systemFontOfSize:12];
        _myLabel.text = @"我的公益基金";
    }
    return _myLabel;
}


- (UILabel *)publicLabel {
    if (_publicLabel == nil) {
        _publicLabel = [[UILabel alloc] init];
        _publicLabel.textColor = RGBColorHex(0x333333);
        _publicLabel.font = [UIFont systemFontOfSize:12];
        _publicLabel.text = @"公益捐赠10次";
    }
    return _publicLabel;
}

- (UILabel *)timeLabel {
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textColor = RGBColorHex(0x333333);
        _timeLabel.font = [UIFont systemFontOfSize:12];
        _timeLabel.text = @"公益时长";
    }
    return _timeLabel;
}


@end
