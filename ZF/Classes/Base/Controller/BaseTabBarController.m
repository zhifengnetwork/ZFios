//
//  BaseTabBarController.m
//  LS
//
//  Created by ZMac on 2018/11/30.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "BaseTabBarController.h"
#import "UserInfoModel.h"
#import "AppDelegate.h"


@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //用户在其它设备登录的通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleUserInvalidTokenNotification:)
                                                 name:UserInvalidTokenNotification
                                               object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)handleUserInvalidTokenNotification:(NSNotification *)notification
{
    // 归档
    [UserInfoModel removeUserInfo];
    
    //登录
    AppDelegate* app = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    [app to_LoginVC];
}

@end
