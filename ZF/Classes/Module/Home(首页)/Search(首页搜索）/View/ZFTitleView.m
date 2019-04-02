//
//  ZFTitleView.m
//  ZF
//
//  Created by weiming zhang on 2019/4/1.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFTitleView.h"

@implementation ZFTitleView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    self.center = CGPointMake(self.superview.center.x, self.center.y);
}
- (void)setup{
    UIImageView *searchImage = [[UIImageView alloc]init];
    [searchImage setImage:[UIImage imageNamed:@"search"]];
    [self addSubview:searchImage];
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.text = @"新款连衣裙";
    _titleLabel.font = [UIFont systemFontOfSize:12];
    _titleLabel.textColor = RGBColorHex(0x333333);
    [self addSubview:self.titleLabel];
    
    [searchImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(15);
        make.centerY.equalTo(self.mas_centerY);
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(searchImage.mas_right).with.offset(15);
        make.centerY.equalTo(self.mas_centerY);
    }];
}
@end
