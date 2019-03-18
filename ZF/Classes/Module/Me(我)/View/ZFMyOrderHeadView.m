//
//  ZFMyOrderHeadView.m
//  ZF
//
//  Created by apple on 08/03/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFMyOrderHeadView.h"
#import "UIView+HJViewStyle.h"


@interface ZFMyOrderHeadView()

@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UIButton* moreButton;

@end

@implementation ZFMyOrderHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setup];
    }
    return self;
}


- (void)setup
{
    [self addSubview:self.nameLabel];
    [self addSubview:self.moreButton];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.centerY.equalTo(self);
    }];
    
    [_moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.centerY.equalTo(self);
    }];
}

-(void)moreButtonDidClick
{
    
}


- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:15];
        _nameLabel.text = @"我的订单";
    }
    return _nameLabel;
}

- (UIButton *)moreButton {
    if (_moreButton == nil) {
        _moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_moreButton setTitle:@"查看更多订单 >" forState:UIControlStateNormal];
        [_moreButton setTitleColor:RGBColorHex(0x000000) forState:UIControlStateNormal];
        _moreButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_moreButton addTarget:self action:@selector(moreButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moreButton;
}


@end
