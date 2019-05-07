//
//  UMSocialTool.m
//  LK
//
//  Created by ZMac on 2018/5/3.
//  Copyright © 2018年 LKQN. All rights reserved.
//

#import "UMSocialTool.h"
#import <UShareUI/UShareUI.h>
#import <UMCommon/UMCommon.h>


#define UMSocialAppkey    @"5aedc714f29d982abf000295"

#define WXAppID         @"wx5647ea6845751495"
#define WXAppSecret     @"945a502ed26af23029308477759b8c49"

#define WeiboAppleKey   @"1840063191"
#define WeiboAppSecret  @"e3e34eb3e3d1c6c36e0353d035469cbb"
#define WeiboRedirectUrl @"http://lingkeqingnian.com"
#define WeiboRedirectUrlBackup @"https://sns.whalecloud.com/sina2/callback"

#define QQAppID         @"1106882324"
#define QQAppKey        @"VM5rJUWIeAIrvPSI"



@implementation UMSocialShareModel

//重写init
-(instancetype)init
{
    self = [super init];
    if (self)
    {
        self.shareType = ShareTypeUrl;
//        self.title = @"领客青年";
    }
    
    return self;
}

@end



@implementation UMSocialTool

+ (instancetype)sharedManager {
    static UMSocialTool *_manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[self alloc] init];
    });
    
    return _manager;
}


//初始化配置
-(void)initSDK
{
    // U-Share 平台设置
    [self configUSharePlatforms];
    [self confitUShareSettings];
}


- (void)confitUShareSettings
{
    /*
     * 关闭强制验证https，可允许http图片分享，但需要在info.plist设置安全域名
     <key>NSAppTransportSecurity</key>
     <dict>
     <key>NSAllowsArbitraryLoads</key>
     <true/>
     </dict>
     */
    [UMSocialGlobal shareInstance].isUsingHttpsWhenShareContent = NO;
}

- (void)configUSharePlatforms
{
    //Appkey
    [UMConfigure initWithAppkey:UMSocialAppkey channel:@"AppStore"];
    
    /* 设置微信的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:WXAppID appSecret:WXAppSecret redirectURL:@"http://mobile.umeng.com/social"];
    /*
     * 移除相应平台的分享，如微信收藏
     */
    //[[UMSocialManager defaultManager] removePlatformProviderWithPlatformTypes:@[@(UMSocialPlatformType_WechatFavorite)]];
    /* 设置分享到QQ互联的appID
     * U-Share SDK为了兼容大部分平台命名，统一用appKey和appSecret进行参数设置，而QQ平台仅需将appID作为U-Share的appKey参数传进即可。
     */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:QQAppID  appSecret:QQAppKey redirectURL:@"http://mobile.umeng.com/social"];
    /* 设置新浪的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:WeiboAppleKey appSecret:WeiboAppSecret redirectURL:WeiboRedirectUrl];
}


//设置系统回调
- (BOOL)setCallbackWithOpenURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
}

//设置系统回调new
- (BOOL)setCallbackWithHandleOpenURL:(NSURL *)url options:(NSDictionary*)options
{
    return [[UMSocialManager defaultManager] handleOpenURL:url options:options];
}


//第三方平台登录获取用户信息
- (void)getUserInfoForPlatform:(UMSocialPlatformType)platformType currentViewController:(id)currentViewController
                    completion:(UMSocialRequestCompletionHandler)completion
{
    
    //调用友盟SDK获取
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:platformType currentViewController:currentViewController completion:completion];
    
//    [[UMSocialManager defaultManager] getUserInfoWithPlatform:platformType currentViewController:nil completion:^(id result, NSError *error) {
//        UMSocialUserInfoResponse *resp = result;
//        // 第三方登录数据(为空表示平台未提供)
//        // 授权数据
//        NSLog(@" uid: %@", resp.uid);
//        NSLog(@" openid: %@", resp.openid);
//        NSLog(@" accessToken: %@", resp.accessToken);
//        NSLog(@" refreshToken: %@", resp.refreshToken);
//        NSLog(@" expiration: %@", resp.expiration);
//        // 用户数据
//        NSLog(@" name: %@", resp.name);
//        NSLog(@" iconurl: %@", resp.iconurl);
//        NSLog(@" gender: %@", resp.unionGender);
//        // 第三方平台SDK原始数据
//        NSLog(@" originalResponse: %@", resp.originalResponse);
//    }];
}


//显示分享UI
- (void)showShareUI:(UMSocialShareModel*)shareModel currentViewController:(id)currentViewController
         completion:(UMSocialRequestCompletionHandler)completion
{
    //显示分享面板
    ZWeakSelf
    [UMSocialShareUIConfig shareInstance].shareTitleViewConfig.isShow = NO;
    [UMSocialUIManager setPreDefinePlatforms:@[@(UMSocialPlatformType_WechatSession),@(UMSocialPlatformType_WechatTimeLine),@(UMSocialPlatformType_Sina),@(UMSocialPlatformType_QQ)]];
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo)
    {
        // 根据获取的platformType确定所选平台进行下一步操作
        if (shareModel.shareType==ShareTypeUrl)
        {
            [weakSelf shareWebPageToPlatformType:platformType shareModel:shareModel currentViewController:currentViewController completion:completion];
        }
    }];
}

//显示分享群社UI
- (void)showShareGroupUI:(UMSocialShareModel*)shareModel currentViewController:(id)currentViewController
              completion:(UMSocialRequestCompletionHandler)completion
{
    //显示分享面板
    ZWeakSelf
    [UMSocialShareUIConfig shareInstance].shareTitleViewConfig.isShow = NO;
    double dleft = kScreenWidth*0.5-70;
    [UMSocialShareUIConfig shareInstance].sharePageScrollViewConfig.shareScrollViewPageMarginLeft = dleft;
    [UMSocialUIManager setPreDefinePlatforms:@[@(UMSocialPlatformType_WechatSession),@(UMSocialPlatformType_WechatTimeLine)]];
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo)
     {
         // 根据获取的platformType确定所选平台进行下一步操作
         if (shareModel.shareType==ShareTypeUrl)
         {
             [weakSelf shareWebPageToPlatformType:platformType shareModel:shareModel currentViewController:currentViewController completion:completion];
         }
     }];
}


- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType shareModel:(UMSocialShareModel*)shareModel currentViewController:(id)currentViewController
                        completion:(UMSocialRequestCompletionHandler)completion
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //创建网页内容对象
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:shareModel.title descr:shareModel.desc thumImage:[UIImage imageNamed:@"icon_logo"]];
    //设置网页地址
    shareObject.webpageUrl = shareModel.url;
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:currentViewController completion:^(id data, NSError *error)
    {
        if (completion)
        {
            completion(data,error);
        }
        
        if (error) {
            NSLog(@"************Share fail with error %@*********",error);
        }else{
            NSLog(@"response data is %@",data);
        }
    }];
}


/**
 *  平台是否安装
 *
 *  @param platformType 平台类型 @see UMSocialPlatformType
 *
 *  @return YES 代表安装，NO 代表未安装
 *  @note 调用前请检查是否配置好平台相关白名单: http://dev.umeng.com/social/ios/quick-integration#1_3
 *  在判断QQ空间的App的时候，QQApi判断会出问题
 */
-(BOOL) isInstall:(UMSocialPlatformType)platformType
{
    return [[UMSocialManager defaultManager] isInstall:platformType];
}

/**
 *  当前平台是否支持分享
 *
 *  @param platformType 平台类型 @see UMSocialPlatformType
 *
 *  @return YES代表支持，NO代表不支持
 */
-(BOOL) isSupport:(UMSocialPlatformType)platformType
{
    return [[UMSocialManager defaultManager] isSupport:platformType];
}




@end
