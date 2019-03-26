//
//  ZFAskEveryoneHeadTableCell.m
//  ZF
//
//  Created by admin on 2019/3/26.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFAskEveryoneHeadTableCell.h"

@interface ZFAskEveryoneHeadTableCell()

@property (nonatomic, strong) UILabel* askLabel;
@property (nonatomic, strong) UIImageView* iconView;

@end

@implementation ZFAskEveryoneHeadTableCell

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
    [self.contentView addSubview:self.askLabel];
    [self.contentView addSubview:self.iconView];
    
    [_askLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.centerY.equalTo(self.contentView);
    }];
    
}

- (UILabel *)askLabel {
    if (_askLabel == nil) {
        _askLabel = [[UILabel alloc] init];
        _askLabel.textColor = RGBColorHex(0x000000);
        _askLabel.font = [UIFont systemFontOfSize:13];
        _askLabel.text = @"问大家 (34)";
    }
    return _askLabel;
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"arrow"];
    }
    return _iconView;
}

@end
