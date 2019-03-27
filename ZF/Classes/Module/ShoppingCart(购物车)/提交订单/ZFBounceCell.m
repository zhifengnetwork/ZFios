
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
  
- (void)setup{
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.superview);
        make.height.mas_equalTo(self.frame.size.height);
    }];
    
    UILabel *address = [[UILabel alloc]init];
    [self addSubview:address];
    address.font = [UIFont systemFontOfSize:14];
    address.text = [NSString stringWithFormat:@"收货地址"];
    address.textColor = RGBColorHex(0x0f0f0f);
    
    UIButton *addAddress = [[UIButton alloc]init];
    [self addSubview:addAddress];
    [addAddress setImage:[UIImage imageNamed:@"down_r"] forState:UIControlStateNormal];
    [addAddress setTitle:@"请添加收货地址" forState:UIControlStateNormal];
    [addAddress setTitleColor:RGBColorHex(0xee4141) forState:UIControlStateNormal];
    addAddress.titleLabel.font = [UIFont systemFontOfSize:14];
    [addAddress addTarget:self action:@selector(createAddress) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *view1 = [[UIView alloc]init];
    [self addSubview:view1];
    view1.backgroundColor = RGBColorHex(0xf5f5f5);
    
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
    [address mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).with.offset(16);
    }];
    [addAddress mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(16);
        make.right.equalTo(self).with.offset(-16);
    }];
    //设置按钮里面控件的位置
    [addAddress setTitleEdgeInsets:UIEdgeInsetsMake(0,  -addAddress.imageView.frame.size.width - 12, 0, addAddress.imageView.frame.size.width + 12)];
    [addAddress setImageEdgeInsets:UIEdgeInsetsMake(0 , addAddress.titleLabel.bounds.size.width, 0,
                                                    -  addAddress.titleLabel.bounds.size.width)];
    
    
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(address.mas_bottom).with.offset(16);
        make.left.mas_equalTo(self).with.offset(16);
        make.right.mas_equalTo(self).with.offset(-16);
        make.height.mas_equalTo(1);
    }];
    [express mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(address.mas_left);
        make.top.equalTo(view1.mas_bottom).with.offset(16);
    }];
    
    [addExpress mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view1.mas_bottom).with.offset(16);
        make.right.equalTo(self).with.offset(-16);
    }];
    [addExpress setTitleEdgeInsets:UIEdgeInsetsMake(0,  -addExpress.imageView.frame.size.width - 12, 0, addExpress.imageView.frame.size.width + 12)];
    [addExpress setImageEdgeInsets:UIEdgeInsetsMake(0 , addExpress.titleLabel.bounds.size.width, 0,
                                                    -  addExpress.titleLabel.bounds.size.width)];
    
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(express.mas_bottom).with.offset(16);
        make.left.mas_equalTo(self).with.offset(16);
        make.right.mas_equalTo(self).with.offset(-16);
        make.height.mas_equalTo(1);
    }];
    [coupon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(address.mas_left);
        make.top.equalTo(view2.mas_bottom).with.offset(16);
    }];
    [addCoupon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view2.mas_bottom).with.offset(16);
        make.right.equalTo(self).with.offset(-16);
    }];
    [addCoupon setTitleEdgeInsets:UIEdgeInsetsMake(0,  -addCoupon.imageView.frame.size.width - 12, 0, addCoupon.imageView.frame.size.width + 12)];
    [addCoupon setImageEdgeInsets:UIEdgeInsetsMake(0 , addCoupon.titleLabel.bounds.size.width, 0,
                                                    -  addCoupon.titleLabel.bounds.size.width)];
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(coupon.mas_bottom).with.offset(16);
        make.left.mas_equalTo(self).with.offset(16);
        make.right.mas_equalTo(self).with.offset(-16);
        make.height.mas_equalTo(1);
    }];
    [redPacket mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(address.mas_left);
        make.top.equalTo(view3.mas_bottom).with.offset(16);
    }];
    [addRedPacket mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view3.mas_bottom).with.offset(16);
        make.right.equalTo(self).with.offset(-16);
    }];
    [addRedPacket setTitleEdgeInsets:UIEdgeInsetsMake(0,  -addRedPacket.imageView.frame.size.width - 12, 0, addRedPacket.imageView.frame.size.width + 12)];
    [addRedPacket setImageEdgeInsets:UIEdgeInsetsMake(0 , addRedPacket.titleLabel.bounds.size.width, 0,
                                                   -  addRedPacket.titleLabel.bounds.size.width)];
    [view4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(redPacket.mas_bottom).with.offset(16);
        make.left.mas_equalTo(self).with.offset(16);
        make.right.mas_equalTo(self).with.offset(-16);
        make.height.mas_equalTo(1);
    }];
    [totalPayNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(address.mas_left);
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
        make.left.equalTo(address.mas_left);
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
//新建地址
- (void)createAddress{
    
//    ZFCreateAddressView *createview = [[ZFCreateAddressView alloc]initWithFrame:CGRectMake(0,LL_ScreenHeight - 389, LL_ScreenWidth, 389)];
//    TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:createview preferredStyle:TYAlertControllerStyleActionSheet];
//    alertController.backgoundTapDismissEnable = YES;
//    [[self currentViewController] presentViewController:alertController animated:YES completion:nil];

}
//同意协议
- (void)agreeProtocol: (UIButton *)button{
    button.selected = !button.selected;
    if (button.selected == YES) {
        [self.submit setBackgroundImage:[UIImage imageNamed:@"submit"] forState:UIControlStateNormal];
        self.submit.enabled = YES;
    }else{
        [self.submit setBackgroundImage:nil forState:UIControlStateNormal];
//        [self.submit setBackgroundColor:RGBColorHex(0xd9d9d9)];
        self.submit.enabled = NO;
    }
}
//提交订单，调到选择支付方式页面
- (void)submitOrder{
    if (self.submit.enabled ) {
        ZFSelectPayView *payView = [[ZFSelectPayView alloc]initWithFrame:CGRectMake(0, LL_ScreenHeight - 367, LL_ScreenWidth, 367)];
        TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:payView preferredStyle:TYAlertControllerStyleActionSheet];
        alertController.backgoundTapDismissEnable = YES;
        [[self currentViewController] presentViewController:alertController animated:YES completion:nil];
    }
    
}
@end

