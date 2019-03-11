//
//  ZFClassificationTableCell.m
//  ZF
//
//  Created by apple on 2019/2/28.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFClassificationTableCell.h"

@interface ZFClassificationTableCell()

@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel* nameLabel;

@end

@implementation ZFClassificationTableCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.contentView.backgroundColor = RGBColorHex(0xf3f5f7);;
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.nameLabel];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(25);
        make.top.mas_equalTo(10);
        make.width.height.mas_equalTo(40);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_iconView.mas_bottom).offset(4);
        make.centerX.equalTo(self->_iconView);
    }];
    
}

-(void)setTitle:(NSString *)title
{
    _title = title;
    _nameLabel.text = _title;
}

-(void)setIconName:(NSString *)iconName
{
    _iconName = iconName;
    _iconView.image = [UIImage imageNamed:_iconName];
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"jx"];
    }
    return _iconView;
}

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColorHex(0x434343);
        _nameLabel.font = [UIFont systemFontOfSize:12];
        _nameLabel.text = @"精选";
    }
    return _nameLabel;
}


@end
