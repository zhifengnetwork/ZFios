//
//  ZFBounceView.m
//  ZF
//
//  Created by weiming zhang on 2019/3/15.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFBounceView.h"
#import "ZFBounceCell.h"
@interface ZFBounceView()
@property (nonatomic, strong)UIView *contentView;
@end
@implementation ZFBounceView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)awakeFromNib{
    [super awakeFromNib];
    [self setup];
}
- (void)setup{
    self.frame = CGRectMake(0, 0, LL_ScreenWidth, LL_ScreenHeight);
    self.backgroundColor = [UIColor blackColor];
    self.alpha = 0.2;
    
    _contentView = [[UIView alloc]init];
    _contentView.backgroundColor =RGBColorHex(0xffffff);
}
- (void)showAlert{
    UIWindow *appWindow = [[UIApplication sharedApplication]keyWindow];
    [appWindow addSubview:self];
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissAlert)]];
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0.5;
    }];
    
    //设置弹出界面
    [appWindow addSubview:_contentView];
    
    
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self);

        make.height.mas_equalTo(344);
    }];
    self.contentView.transform = CGAffineTransformMakeTranslation(0.01, LL_ScreenWidth);
    [UIView animateWithDuration:0.3 animations:^{
        self.contentView.transform = CGAffineTransformMakeTranslation(0.01, 0.01);
    }];
    
    self.contentView.layer.cornerRadius = 10;
    
    
    ZFBounceCell *cell = [[ZFBounceCell alloc]init];
    [self.contentView addSubview:cell];
    [cell mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.contentView);
    }];
    [cell setup];
    
}

- (void)dismissAlert{
    [UIView animateWithDuration:0.3 animations:^{
        self.contentView.transform = CGAffineTransformMakeTranslation(0.01, LL_ScreenWidth);
        self.contentView.alpha = 0.2;
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        [self.contentView removeFromSuperview];
    }];
    
    
}



@end
