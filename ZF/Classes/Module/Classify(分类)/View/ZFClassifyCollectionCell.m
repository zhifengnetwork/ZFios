//
//  ZFClassifyCollectionCell.m
//  ZF
//
//  Created by apple on 22/03/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFClassifyCollectionCell.h"

@interface ZFClassifyCollectionCell ()

@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel* nameLabel;

@end


@implementation ZFClassifyCollectionCell

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
    self.contentView.backgroundColor = RGBColorHex(0xffffff);
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.nameLabel];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(80);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_iconView.mas_bottom);
        make.centerX.equalTo(self->_iconView);
    }];
}


- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"huazhuang"];
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
