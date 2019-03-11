//
//  ZFHomePageTitleHeadView.m
//  ZF
//
//  Created by apple on 2019/3/2.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFHomePageTitleHeadView.h"

@interface ZFHomePageTitleHeadView()

@property (nonatomic, strong) UIImageView* iconView;

@end

@implementation ZFHomePageTitleHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    [self addSubview:self.iconView];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self);
    }];
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"title"];
    }
    return _iconView;
}

@end
