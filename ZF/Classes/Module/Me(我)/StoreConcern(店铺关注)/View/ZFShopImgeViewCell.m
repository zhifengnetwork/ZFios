//
//  ZFShopImgeViewCell.m
//  ZF
//
//  Created by admin on 2019/3/15.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFShopImgeViewCell.h"
#import "UIImageView+WebCache.h"

@interface ZFShopImgeViewCell()

@property (nonatomic, strong) UIImageView* iconView;

@end

@implementation ZFShopImgeViewCell

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
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo(90);
    }];
    
}


- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"image"];
        _iconView.clipsToBounds = YES;
        _iconView.layer.cornerRadius = 3.0f;
    }
    return _iconView;
}


@end
