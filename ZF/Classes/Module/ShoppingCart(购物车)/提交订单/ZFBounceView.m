//
//  ZFBounceView.m
//  ZF
//
//  Created by weiming zhang on 2019/3/15.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFBounceView.h"
#import "ZFBounceCell.h"
@interface ZFBounceView()<UIGestureRecognizerDelegate>
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
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self);
        
        make.height.mas_equalTo(self.frame.size.height);
    }];

    self.layer.cornerRadius = 10;
    self.backgroundColor =RGBColorHex(0xffffff);
    //设置弹出界面
    ZFBounceCell *cell = [[ZFBounceCell alloc]initWithFrame:CGRectMake(0, self.frame.size.height - 344, LL_ScreenWidth, 344)];
    [self addSubview:cell];
    [cell setup];
    
}




@end
