//
//  ZFEmptyCartView.m
//  ZF
//
//  Created by weiming zhang on 2019/3/19.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFEmptyCartView.h"
@interface ZFEmptyCartView()
//@property (nonatomic, weak)UIImageView *imageView;
//@property (nonatomic, weak)UILabel *label;
//@property (nonatomic, weak)
@end
@implementation ZFEmptyCartView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self =[super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}
- (void)awakeFromNib{
    [super awakeFromNib];
    [self setup];
}
- (void)setup{
    
    UIImageView *imageView = [[UIImageView alloc]init];
    [imageView setImage:[UIImage imageNamed:@"shopping_cart"]];
    [self addSubview:imageView];
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"购物车还空着呢！";
    [label setTextColor:RGBColorHex(0xcccccc)];
    [label setFont:[UIFont systemFontOfSize:12]];
    [self addSubview:label];
    
    UILabel *label2 = [[UILabel alloc]init];
    label2.text = @"快去挑选自己心仪的物品吧~";
    [label2 setTextColor:RGBColorHex(0xcccccc)];
    [label2 setFont:[UIFont systemFontOfSize:12]];
    [self addSubview:label2];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).with.offset(88);
        make.centerX.equalTo(self.mas_centerX);
    }];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(imageView.mas_bottom).with.offset(20);
        make.centerX.equalTo(self.mas_centerX);
    }];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(label.mas_bottom).with.offset(5);
        make.centerX.equalTo(self.mas_centerX);
    }];
}

@end
