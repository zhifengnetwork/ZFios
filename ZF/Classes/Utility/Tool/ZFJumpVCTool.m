//
//  ZFJumpVCTool.m
//  LK
//
//  Created by ZMac on 2018/5/3.
//  Copyright © 2018年 LKQN. All rights reserved.
//

#import "ZFJumpVCTool.h"
#import "UserInfoModel.h"
#import "MJExtension.h"
#import "SVProgressHUD.h"
#import "UMSocialTool.h"
#import "http_user.h"

@implementation ZFJumpVCTool

+ (instancetype)sharedManager {
    static ZFJumpVCTool *_manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[self alloc] init];
    });
    
    return _manager;
}

//第三方登录type 2:微信 1:QQ 3:新浪 4:手机
+(void)to_ThirdpartyLogin:(int)type srcVC:(UIViewController*)vc
{
    if (type==1)
    {
        [[UMSocialTool sharedManager] getUserInfoForPlatform:UMSocialPlatformType_QQ currentViewController:nil completion:^(id result, NSError *error)
         {
             if(error)
             {
                 [SVProgressHUD showErrorWithStatus:error.localizedDescription];
                 return;
             }
             
             //获取QQ用户信息成功
             [ZFJumpVCTool getUserInfo_success:type userInfo:result srcVC:vc];
         }];
    }
    else if (type==2)
    {
        [[UMSocialTool sharedManager] getUserInfoForPlatform:UMSocialPlatformType_WechatSession currentViewController:nil completion:^(id result, NSError *error)
         {
             if(error)
             {
                 [SVProgressHUD showInfoWithStatus:error.domain];
                 return;
             }
             
             //获取微信用户信息成功
             [ZFJumpVCTool getUserInfo_success:type userInfo:result srcVC:vc];
         }];
        
    }
    else if (type==3)
    {
        [[UMSocialTool sharedManager] getUserInfoForPlatform:UMSocialPlatformType_Sina currentViewController:nil completion:^(id result, NSError *error)
         {
             if(error)
             {
                 [SVProgressHUD showErrorWithStatus:error.localizedDescription];
                 return;
             }
             
             //获取weibo用户信息成功
             [ZFJumpVCTool getUserInfo_success:type userInfo:result srcVC:vc];
         }];
    }
}


+(void)getUserInfo_success:(int)type userInfo:(UMSocialUserInfoResponse *)resp srcVC:(UIViewController*)vc
{
    // 第三方登录数据(为空表示平台未提供)
    // 授权数据
    NSLog(@" uid: %@", resp.uid);
    NSLog(@" openid: %@", resp.openid);
    NSLog(@" accessToken: %@", resp.accessToken);
    NSLog(@" refreshToken: %@", resp.refreshToken);
    NSLog(@" expiration: %@", resp.expiration);
    // 用户数据
    NSLog(@" name: %@", resp.name);
    NSLog(@" iconurl: %@", resp.iconurl);
    NSLog(@" gender: %@", resp.unionGender);
    // 第三方平台SDK原始数据
    NSLog(@" originalResponse: %@", resp.originalResponse);
    
    //组装自己的userInfo
    UserInfoModel* userInfo = [[UserInfoModel alloc]init];
//    userInfo.uuid = resp.uid;
//    userInfo.account_type = [NSString stringWithFormat:@"%d",type];
//    userInfo.nickname = resp.name;
//    userInfo.head_url = resp.iconurl;
//    userInfo.city = @"00";
//    userInfo.openid = resp.openid;
//    userInfo.gender = resp.unionGender;
    
    //调用第三方登录
    [ZFJumpVCTool to_getByUuid:userInfo srcVC:vc];
    
    //    //使用高德地图定位
    //    [[AMapTool sharedManager] startOneLocation:^(NSString *city, NSError *error)
    //     {
    //         if (error)
    //         {
    //             [SVProgressHUD showErrorWithStatus:error.localizedDescription];
    //             return;
    //         }
    //
    //         //组装自己的userInfo
    //         UserInfoModel* userInfo = [[UserInfoModel alloc]init];
    //         userInfo.uuid = resp.uid;
    //         userInfo.account_type = [NSString stringWithFormat:@"%d",type];
    //         userInfo.nickname = resp.name;
    //         userInfo.head_url = resp.iconurl;
    //         userInfo.city = city;
    //
    //         //调用第三方登录
    //         [ZFJumpVCTool to_getByUuid:userInfo srcVC:vc];
    //
    //     }];
    
}

//调用第三方登录接口
+(void)to_getByUuid:(UserInfoModel*)userInfo srcVC:(UIViewController*)vc
{
    //[SVProgressHUD showWithStatus:@"正在加载"];
    [http_user weixin_login:nil success:^(id responseObject)
     {
         // [SVProgressHUD showSuccessWithStatus:@"认证成功"];
         [ZFJumpVCTool getByUuid_success:responseObject srcVC:vc];
         
     } failure:^(NSError *error) {
         
         [SVProgressHUD showInfoWithStatus:error.domain];
     }];
}

+(void)getByUuid_success:(id)responseObject srcVC:(UIViewController*)srcVC
{
    //第三方uuid登录成功
    UserInfoModel* userInfo = [UserInfoModel mj_objectWithKeyValues:responseObject];
    
        [userInfo saveUserInfo];
        //进入领客青年
//        [[NSNotificationCenter defaultCenter] postNotificationName:UserInfoSuccessNotification object:self];
    
}

//第三方账号绑定type 2:微信 1:QQ 3:新浪
+(void)to_ThirdpartyBind:(int)type srcVC:(UIViewController*)vc
{
    if (type==1)
    {
        [[UMSocialTool sharedManager] getUserInfoForPlatform:UMSocialPlatformType_QQ currentViewController:nil completion:^(id result, NSError *error)
         {
             if(error)
             {
                 [SVProgressHUD showErrorWithStatus:error.localizedDescription];
                 return;
             }
             
             //获取QQ用户信息成功
             [ZFJumpVCTool getBindUserInfo_success:type userInfo:result srcVC:vc];
         }];
    }
    else if (type==2)
    {
        [[UMSocialTool sharedManager] getUserInfoForPlatform:UMSocialPlatformType_WechatSession currentViewController:nil completion:^(id result, NSError *error)
         {
             if(error)
             {
                 [SVProgressHUD showInfoWithStatus:error.domain];
                 return;
             }
             
             //获取微信用户信息成功
             [ZFJumpVCTool getBindUserInfo_success:type userInfo:result srcVC:vc];
         }];
        
    }
    else if (type==3)
    {
        [[UMSocialTool sharedManager] getUserInfoForPlatform:UMSocialPlatformType_Sina currentViewController:nil completion:^(id result, NSError *error)
         {
             if(error)
             {
                 [SVProgressHUD showErrorWithStatus:error.localizedDescription];
                 return;
             }
             
             //获取weibo用户信息成功
             [ZFJumpVCTool getBindUserInfo_success:type userInfo:result srcVC:vc];
         }];
    }
}

+(void)getBindUserInfo_success:(int)type userInfo:(UMSocialUserInfoResponse *)resp srcVC:(UIViewController*)vc
{
    // 第三方登录数据(为空表示平台未提供)
    // 授权数据
    NSLog(@" uid: %@", resp.uid);
    NSLog(@" openid: %@", resp.openid);
    NSLog(@" accessToken: %@", resp.accessToken);
    NSLog(@" refreshToken: %@", resp.refreshToken);
    NSLog(@" expiration: %@", resp.expiration);
    // 用户数据
    NSLog(@" name: %@", resp.name);
    NSLog(@" iconurl: %@", resp.iconurl);
    NSLog(@" gender: %@", resp.unionGender);
    // 第三方平台SDK原始数据
    NSLog(@" originalResponse: %@", resp.originalResponse);
    
    //组装自己的userInfo
    UserInfoModel* userInfo = [[UserInfoModel alloc]init];
//    userInfo.uuid = resp.uid;
//    userInfo.account_type = [NSString stringWithFormat:@"%d",type];
//    userInfo.nickname = resp.name;
//    userInfo.head_url = resp.iconurl;
//    userInfo.city = @"00";
//    userInfo.openid = resp.openid;
//    userInfo.gender = resp.unionGender;
    
    //调用第三方登录
//    [ZFJumpVCTool to_Bind:userInfo srcVC:vc];
}

//调用第三方登录接口
//+(void)to_Bind:(UserInfoModel*)userInfo srcVC:(UIViewController*)vc
//{
//    [http_user_login bindingWX:userInfo success:^(id responseObject)
//     {
//         [ZFJumpVCTool to_Bind_success:responseObject srcVC:vc];
//
//     } failure:^(NSError *error) {
//
//         [SVProgressHUD showInfoWithStatus:error.domain];
//     }];
//}
//
//+(void)to_Bind_success:(id)responseObject srcVC:(UIViewController*)srcVC
//{
//    //绑定成功
//
//    //进入领客青年
//    [[NSNotificationCenter defaultCenter] postNotificationName:UserBindSuccessNotification object:self];
//
//}


@end
