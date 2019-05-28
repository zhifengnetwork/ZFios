//
//  AppDelegate.h
//  ZF
//
//  Created by apple on 2019/2/25.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXApi.h"



@interface AppDelegate : UIResponder <UIApplicationDelegate, WXApiDelegate>

@property (strong, nonatomic) UIWindow *window;

//跳到登录界面
-(void)to_LoginVC;

@end

