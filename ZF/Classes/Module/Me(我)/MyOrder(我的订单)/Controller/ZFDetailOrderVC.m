//
//  ZFDetailOrderVC.m
//  ZF
//
//  Created by weiming zhang on 2019/5/10.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFDetailOrderVC.h"

@interface ZFDetailOrderVC ()
@property (nonatomic, strong)UILabel *orderStatus;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *phoneLabel;
@property (nonatomic, strong)UILabel *addressLabel;
@end

@implementation ZFDetailOrderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的订单";
    
    UIImage *imgRight = [UIImage imageNamed:@"All"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[imgRight imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(moreButtonDidClick)];
    [self setup];
}

- (void)moreButtonDidClick
{
    
}

- (void)setup{
    UIView *view1 = [[UIView alloc]init];
    view1.backgroundColor = RGBColorHex(0xfde6e6);
    [self.view addSubview:view1];
    [view1 addSubview:self.orderStatus];
    
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(50);
    }];
//    _orderStatus mas_makeConstraints:^(MASConstraintMaker *make) {
//        <#code#>
//    }
}
@end
