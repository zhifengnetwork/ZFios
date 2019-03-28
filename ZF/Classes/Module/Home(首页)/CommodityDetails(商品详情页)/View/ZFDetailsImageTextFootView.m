//
//  ZFDetailsImageTextFootView.m
//  ZF
//
//  Created by apple on 28/03/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFDetailsImageTextFootView.h"
#import "UIButton+LXMImagePosition.h"


@interface ZFDetailsImageTextFootView ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation ZFDetailsImageTextFootView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.button];
    
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    
}

-(void)buttonDidClick
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ZFDetailsImageTextFootViewDidClick)])
    {
        [self.delegate ZFDetailsImageTextFootViewDidClick];
    }
}


- (UIButton *)button
{
    if (_button == nil) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button setTitle:@"展开" forState:UIControlStateNormal];
        [_button setTitleColor:RGBColorHex(0x2E2E2E) forState:UIControlStateNormal];
        _button.titleLabel.font = [UIFont systemFontOfSize:13];
        [_button setImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
        [_button setImagePosition:LXMImagePositionRight spacing:10];
        [_button addTarget:self action:@selector(buttonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

@end
