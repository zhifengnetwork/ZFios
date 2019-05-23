//
//  ZFSpellNumberTableCell.m
//  ZF
//
//  Created by apple on 2019/3/6.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFSpellNumberTableCell.h"

@interface ZFSpellNumberTableCell()

@property (nonatomic, strong) UILabel* titleLabel;

@end

@implementation ZFSpellNumberTableCell

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
    [self.contentView addSubview:self.titleLabel];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self.contentView);
    }];
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0x999999);
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.text = @"仅显示6个正在拼单的人";
    }
    return _titleLabel;
}

- (void)setNumber:(NSInteger)number{
    _number = number;
    _titleLabel.text = [NSString stringWithFormat:@"仅显示%ld个正在拼单的人",number];
}

@end
