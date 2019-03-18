//
//  BaseCollectionHeadView.m
//  ZF
//
//  Created by apple on 15/03/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "BaseCollectionHeadView.h"
#import "UIView+HJViewStyle.h"

@interface BaseCollectionHeadView()

@property (nonatomic, strong) UIView* bgView;

@end

@implementation BaseCollectionHeadView

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
    [self addSubview:self.bgView];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
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
