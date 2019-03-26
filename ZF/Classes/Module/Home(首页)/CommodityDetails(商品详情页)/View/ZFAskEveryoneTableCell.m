//
//  ZFAskEveryoneTableCell.m
//  ZF
//
//  Created by admin on 2019/3/26.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFAskEveryoneTableCell.h"

@interface ZFAskEveryoneTableCell()

@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UILabel* answerLabel;

@end

@implementation ZFAskEveryoneTableCell

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
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.answerLabel];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(8);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_answerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.centerY.equalTo(self.contentView);
    }];
    
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"Wen"];
    }
    return _iconView;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0x0f0f0f);
        _titleLabel.font = [UIFont systemFontOfSize:11];
        _titleLabel.text = @"这个价位是官方正品吗？";
    }
    return _titleLabel;
}

- (UILabel *)answerLabel {
    if (_answerLabel == nil) {
        _answerLabel = [[UILabel alloc] init];
        _answerLabel.textColor = RGBColorHex(0x808080);
        _answerLabel.font = [UIFont systemFontOfSize:10];
        _answerLabel.text = @"1个回答";
    }
    return _answerLabel;
}

@end
