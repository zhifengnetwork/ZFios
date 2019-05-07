//
//  AppDelegate.m
//  ZF
//
//  Created by apple on 2019/02/25.
//  Copyright © 2019 LS. All rights reserved.
//

#import "AppDelegate.h"
#import "SVProgressHUD.h"
#import "TabBarControllerConfig.h"
#import "BaseNaviViewController.h"
#import "ZFLoginVC.h"
#import "HttpTool.h"
#import "ZFTool.h"
#import "UserInfoModel.h"
#import <SDWebImage/SDWebImageManager.h>
#import "UMSocialTool.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //设置svp最小时间
    [SVProgressHUD setMinimumDismissTimeInterval:1.0f];
    
    //SDWebImage referer(防盗链)
    SDWebImageDownloader *dmanager = [SDWebImageManager sharedManager].imageDownloader;
    [dmanager setValue:MainUrl forHTTPHeaderField:@"referer"];
    
    //设置主域名
    HttpTool *httptool = [HttpTool sharedManager];
    [httptool setMainUrl:MainUrl];
    
    [self to_MainVC];
    [self BaseSetup];
    
    // U-Share 平台设置
    [[UMSocialTool sharedManager] initSDK];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


//跳到登录界面
-(void)to_LoginVC
{
    ZFLoginVC *loginVC = [[ZFLoginVC alloc] init];
    BaseNaviViewController *navController = [[BaseNaviViewController alloc] initWithRootViewController:loginVC];
    self.window.rootViewController = navController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}

//根据用户信息选择主界面
-(void)to_MainVC
{
    //判断用户信息是否存在
    UserInfoModel* userInfo = [UserInfoModel readUserInfo];
    if (kObjectIsEmpty(userInfo))
    {
        //[self to_HomeVC];
        [self to_LoginVC];
    }
    else
    {
        [self to_HomeVC];
    }
}

//跳到主界面
-(void)to_HomeVC
{
    TabBarControllerConfig *tabBarControllerConfig = [[TabBarControllerConfig alloc] init];
    BaseTabBarController *tabBarController = tabBarControllerConfig.tabBarController;
    [self.window setRootViewController:tabBarController];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}


-(void)BaseSetup
{
    //用户登录注册成功
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleUserLoginRegisterNotification:) name:UserLoginRegisterNotification object:nil];
    
    //状态栏的文字颜色(Info.plist 文件中添加 View controller-based status bar appearance 设置为 NO)
    //[UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    //    // 导航条上标题的颜色字体
    //    [UINavigationBar appearance].titleTextAttributes = @{
    //                                                         NSForegroundColorAttributeName : [UIColor whiteColor],
    //                                                         NSFontAttributeName : [UIFont systemFontOfSize:18]
    //                                                         };
    //导航条上UIBarButtonItem颜色
    //[UINavigationBar appearance].tintColor = [UIColor whiteColor];
    //导航条的背景颜色
    [[UINavigationBar appearance] setBackgroundImage:[ZFTool Color2Image:[UIColor whiteColor]] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    
    if (@available(ios 11.0,*)) {
        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        UITableView.appearance.estimatedRowHeight = 0;
        UITableView.appearance.estimatedSectionFooterHeight = 0;
        UITableView.appearance.estimatedSectionHeaderHeight = 0;
    }
}


//用户登录注册成功
- (void)handleUserLoginRegisterNotification:(NSNotification *)notification
{
    //进入主界面
    [self to_HomeVC];
}


// 支持所有iOS系统
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
    BOOL result = [[UMSocialTool sharedManager]setCallbackWithOpenURL:url sourceApplication:sourceApplication annotation:annotation];
    if (!result) {
        // 其他如支付等SDK的回调
    }
//    //　先调用友盟，然后调用微信清册信息
//    /****************       注册微信支付信息    *****************/
//    [WXApi handleOpenURL:url delegate:[WXApiManager sharedManager]];
//    /****************       注册支付宝支付信息    *****************/
//    if ([url.host isEqualToString:@"safepay"]) {
//        //跳转支付宝钱包进行支付，处理支付结果
//        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
//            NSLog(@"result = %@",resultDic);
//        }];
//    }
    else if([url.host isEqualToString:@"assoc"])
    {
        [self to_MainVC];
    }
    return result;
}

// NOTE: 9.0以后使用新API接口
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options
{
//    if ([url.host isEqualToString:@"safepay"]) {
//        //跳转支付宝钱包进行支付，处理支付结果
//        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
//            NSLog(@"result = %@",resultDic);
//        }];
//    }
//    else if([url.host isEqualToString:@"assoc"])
//    {
//        [self to_MainVC];
//    }
//    else
    {
        BOOL result = [[UMSocialTool sharedManager] setCallbackWithHandleOpenURL:url options:options];
        if (!result) {
            // 其他如支付等SDK的回调
        }
    }
    return YES;
    
//    return [WXApi handleOpenURL:url delegate:[WXApiManager sharedManager]];
}



@end
