//
//  BaseCollectionCell.m
//  ZF
//
//  Created by apple on 15/03/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "BaseCollectionCell.h"
#import "UIView+HJViewStyle.h"

@interface BaseCollectionCell()

@property (nonatomic, strong) UIView* bgView;

@end

@implementation BaseCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self mySetup];
        [self setup];
    }
    return self;
}

- (void)mySetup
{
    [self.contentView addSubview:self.bgView];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    
    //切圆角
    _bgView.cornerRadius = 15;
}

- (void)setup
{
    
}



- (UIView *)bgView {
    if (_bgView == nil) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}


@end
