//
//  ZFConfirmOrderVC.m
//  ZF
//
//  Created by weiming zhang on 2019/3/26.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFConfirmOrderVC.h"

@interface ZFConfirmOrderVC ()
@property (nonatomic, strong)UIView *addressView;
@property (nonatomic, strong)UIView *orderView;
@property (nonatomic, strong)UIView *otherView;
@end

@implementation ZFConfirmOrderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup{
    
    self.title =@"确定订单";
    self.navigationItem.leftBarButtonItem.image = [UIImage imageNamed:@"Back"];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor blackColor];
    
    self.navigationController.navigationBar.translucent  = YES; // 导航栏透明
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    [self.navigationController.navigationBar setBackgroundColor:RGBColorHex(0x747474)];
    [self.view addSubview:self.addressView];
    [self.view addSubview:self.orderView];
    [self.view addSubview:self.otherView];
//    _addressView mas_makeConstraints:^(MASConstraintMaker *make) {
//        <#code#>
//    }
}

@end
