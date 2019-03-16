//
//  BaseBgviewTableCell.m
//  ZF
//
//  Created by admin on 2019/3/16.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "BaseBgviewTableCell.h"

@interface BaseBgviewTableCell()

@end

@implementation BaseBgviewTableCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setup];
    }
    return self;
}

- (void)mySetup
{
    self.contentView.backgroundColor = RGBColorHex(0xffffff);
    [self.contentView addSubview:self.bgView];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
}

- (void)setup
{
    
}



-(UIView *)bgView
{
    if(_bgView==nil)
    {
        _bgView = [[UIView alloc]initWithFrame:CGRectZero];
        _bgView.backgroundColor = [UIColor whiteColor];
        _bgView.clipsToBounds = YES;
        _bgView.layer.cornerRadius = 13.0f;
    }
    return _bgView;
}


@end
