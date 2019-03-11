//
//  ZFPicturesDisplayingHeadView.m
//  ZF
//
//  Created by apple on 2019/2/28.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFPicturesDisplayingHeadView.h"

@interface ZFPicturesDisplayingHeadView()

@property (nonatomic, strong) UIImageView* iconView;

@end

@implementation ZFPicturesDisplayingHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        [self setup];
    }
    return self;
}

- (void)setup
{
    [self addSubview:self.iconView];
    
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"haibao4"];
        _iconView.clipsToBounds = YES;
        _iconView.layer.cornerRadius = 3.0f;
    }
    return _iconView;
}


@end
