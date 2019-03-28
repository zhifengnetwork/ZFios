
//
//  ZFBounceCell.m
//  ZF
//
//  Created by weiming zhang on 2019/3/15.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFBounceCell.h"
#import "ZFCreateAddressView.h"
#import "ZFHarvestAddressView.h"
#import "TYAlertController.h"
#import "ZFSelectPayView.h"

@interface ZFBounceCell()
@property (nonatomic, weak)UIButton *submit;

@end
@implementation ZFBounceCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setup{
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.superview);
        make.height.mas_equalTo(self.frame.size.height);
    }];
    
    UILabel *express = [[UILabel alloc]init];
    [self addSubview:express];
    express.font = [UIFont systemFontOfSize:14];
    express.text = [NSString stringWithFormat:@"配送"];
    express.textColor = RGBColorHex(0x0f0f0f);
    
    UIButton *addExpress = [[UIButton alloc]init];
    [self addSubview:addExpress];
    [addExpress setImage:[UIImage imageNamed:@"down_b"] forState:UIControlStateNormal];
    [addExpress setTitle:@"第三方快递" forState:UIControlStateNormal];
    [addExpress setTitleColor:RGBColorHex(0x0f0f0f) forState:UIControlStateNormal];
    addExpress.titleLabel.font = [UIFont systemFontOfSize:14];
    
    UIView *view2 = [[UIView alloc]init];
    [self addSubview:view2];
    view2.backgroundColor = RGBColorHex(0xf5f5f5);
    
    UILabel *coupon = [[UILabel alloc]init];
    [self addSubview:coupon];
    coupon.font = [UIFont systemFontOfSize:14];
    coupon.text = [NSString stringWithFormat:@"优惠券"];
    coupon.textColor = RGBColorHex(0x0f0f0f);
    
    UIButton *addCoupon = [[UIButton alloc]init];
    [self addSubview:addCoupon];
    [addCoupon setImage:[UIImage imageNamed:@"down_b"] forState:UIControlStateNormal];
    [addCoupon setTitle:@"暂无可用" forState:UIControlStateNormal];
    [addCoupon setTitleColor:RGBColorHex(0x666666) forState:UIControlStateNormal];
    addCoupon.titleLabel.font = [UIFont systemFontOfSize:14];
    
    UIView *view3 = [[UIView alloc]init];
    [self addSubview:view3];
    view3.backgroundColor = RGBColorHex(0xf5f5f5);
    
    UILabel *redPacket = [[UILabel alloc]init];
    [self addSubview:redPacket];
    redPacket.font = [UIFont systemFontOfSize:14];
    redPacket.text = [NSString stringWithFormat:@"红包"];
    redPacket.textColor = RGBColorHex(0x0f0f0f);
    
    UIButton *addRedPacket = [[UIButton alloc]init];
    [self addSubview:addRedPacket];
    [addRedPacket setImage:[UIImage imageNamed:@"down_b"] forState:UIControlStateNormal];
    [addRedPacket setTitle:@"暂无可用" forState:UIControlStateNormal];
    [addRedPacket setTitleColor:RGBColorHex(0x666666) forState:UIControlStateNormal];
    addRedPacket.titleLabel.font = [UIFont systemFontOfSize:14];
    
    UIView *view4 = [[UIView alloc]init];
    [self addSubview:view4];
    view4.backgroundColor = RGBColorHex(0xf5f5f5);
    
    UILabel *totalPayNumber = [[UILabel alloc]init];
    [self addSubview:totalPayNumber];
    totalPayNumber.font = [UIFont systemFontOfSize:14];
    totalPayNumber.text = [NSString stringWithFormat:@"应付总额"];
    totalPayNumber.textColor = RGBColorHex(0x0f0f0f);
    
    UILabel *price = [[UILabel alloc]init];
    [self addSubview:price];
    price.font = [UIFont boldSystemFontOfSize:18];
    price.text = [NSString stringWithFormat:@"￥ 1476.00"];
    price.textColor = RGBColorHex(0xee4141);
    
    UIView *view5 = [[UIView alloc]init];
    [self addSubview:view5];
    view5.backgroundColor = RGBColorHex(0xf5f5f5);
    
    UIButton *agreeBtn = [[UIButton alloc]init];
    [self addSubview:agreeBtn];
    [agreeBtn setImage:[UIImage imageNamed:@"option"] forState:UIControlStateNormal];
    [agreeBtn setImage:[UIImage imageNamed:@"option_s"] forState:UIControlStateSelected];
    [agreeBtn addTarget:self action:@selector(agreeProtocol:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *protocol = [[UILabel alloc]init];
    [self addSubview:protocol];
    protocol.text = [NSString stringWithFormat:@"本人同意并接受协议"];
    protocol.font = [UIFont systemFontOfSize:12];
    protocol.textColor = RGBColorHex(0x858585);
    
    UIButton *submit = [[UIButton alloc]init];
    [self addSubview:submit];
    self.submit = submit;
    [submit setTitle:@"提交订单" forState:UIControlStateNormal];
    [submit setBackgroundColor:RGBColorHex(0xd9d9d9)];
    [submit setTintColor:RGBColorHex(0xffffff)];
    submit.titleLabel.font = [UIFont systemFontOfSize:17];
    self.submit.enabled = NO;
    [submit addTarget:self action:@selector(submitOrder) forControlEvents:UIControlEventTouchUpInside];
    
    
#pragma mark --设置控件的约束
    
    [view4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(redPacket.mas_bottom).with.offset(16);
        make.left.mas_equalTo(self).with.offset(16);
        make.right.mas_equalTo(self).with.offset(-16);
        make.height.mas_equalTo(1);
    }];
    [totalPayNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).with.offset(16);
        make.top.equalTo(view4.mas_bottom).with.offset(16);
    }];
    [price mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(-16);
        make.top.equalTo(view4.mas_bottom).with.offset(16);
    }];
    [view5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(totalPayNumber.mas_bottom).with.offset(16);
        make.left.mas_equalTo(self).with.offset(16);
        make.right.mas_equalTo(self).with.offset(-16);
        make.height.mas_equalTo(1);
    }];
    [agreeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).with.offset(16);
        make.top.equalTo(view5.mas_bottom).with.offset(16);
    }];
    [protocol mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(agreeBtn.mas_right).with.offset(12);
        make.centerY.equalTo(agreeBtn.mas_centerY);
        make.top.equalTo(view5.mas_bottom).with.offset(16);
    }];
    [submit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.equalTo(@49);
    }];
    
}
- (UIViewController *)currentViewController{
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (1) {
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = ((UITabBarController *)vc).selectedViewController;
        }
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController *)vc).visibleViewController;
        }
        if (vc.presentedViewController) {
            vc = vc.presentedViewController;
        }else{
            break;
        }
    }
    return vc;
}
#pragma mark --按钮方法

@end

