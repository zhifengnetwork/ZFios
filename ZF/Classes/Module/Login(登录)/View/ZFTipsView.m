//
//  ZFTipsTableCell.m
//  ZF
//
//  Created by apple on 2019/2/25.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFTipsView.h"

@interface ZFTipsView()

@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel* titleLabel;

@end


@implementation ZFTipsView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = RGBColorHex(0xFFE8CB);
        [self setup];
    }
    return self;
}

- (void)setup
{
    [self addSubview:self.iconView];
    [self addSubview:self.titleLabel];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.equalTo(self);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(21);
    }];
    
    
}

-(void)setTitle:(NSString *)title
{
    _title = title;
    _titleLabel.text = _title;
}


- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"icon_authentication_company"];
        _iconView.clipsToBounds = YES;
    }
    return _iconView;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0x333333);
        _titleLabel.font = [UIFont systemFontOfSize:24];
        _titleLabel.text = @"您的账号已被注册";
    }
    return _titleLabel;
}

@end
