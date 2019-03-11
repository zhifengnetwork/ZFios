//
//  ZFTopLineFootView.m
//  ZF
//
//  Created by apple on 2019/3/4.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFTopLineFootView.h"

@interface ZFTopLineFootView()

@property (nonatomic, strong) UIImageView* iconView;

@end

@implementation ZFTopLineFootView

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
        make.centerY.equalTo(self);
        make.left.mas_equalTo(10);
    }];
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"toutiao"];
    }
    return _iconView;
}
@end
