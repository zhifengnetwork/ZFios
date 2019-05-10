//
//  ZFDetailOrderVC.m
//  ZF
//
//  Created by weiming zhang on 2019/5/10.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFDetailOrderVC.h"

@interface ZFDetailOrderVC ()

@end

@implementation ZFDetailOrderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的订单";
    
    UIImage *imgRight = [UIImage imageNamed:@"All"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[imgRight imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(moreButtonDidClick)];
}

- (void)moreButtonDidClick
{
    
}

@end
