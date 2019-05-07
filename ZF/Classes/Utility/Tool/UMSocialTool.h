//
//  UMSocialTool.h
//  LK
//
//  Created by ZMac on 2018/5/3.
//  Copyright © 2018年 LKQN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UMShare/UMShare.h>


typedef enum
{
    ShareTypeText = 0,      // 分享文本
    ShareTypeImage = 1,     // 分享图片
    ShareTypeTextImage = 2, // 分享图文（支持新浪微博）
    ShareTypeUrl = 3,       // 分享网页
    ShareTypeMusic = 4,     // 分享音乐
    ShareTypeVideo = 5,     // 分享视频
    ShareTypeWeChatEM = 6,  // 分享微信表情
    ShareTypeWeChatApp = 7, // 分享微信小程序
} ShareType;


//友盟分享model
@interface UMSocialShareModel : NSObject

@property (nonatomic, assign) ShareType shareType;

@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* desc;
@property (nonatomic, copy) NSString* url;


@end



/**
 友盟工具类(v6.9.1)
 */
@interface UMSocialTool : NSObject

+ (instancetype)sharedManager;

//初始化配置
-(void)initSDK;

//设置系统回调
- (BOOL)setCallbackWithOpenURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;

//设置系统回调new
- (BOOL)setCallbackWithHandleOpenURL:(NSURL *)url options:(NSDictionary*)options;

//第三方平台登录获取用户信息
- (void)getUserInfoForPlatform:(UMSocialPlatformType)platformType currentViewController:(id)currentViewController
                    completion:(UMSocialRequestCompletionHandler)completion;

//显示分享UI
- (void)showShareUI:(UMSocialShareModel*)shareModel currentViewController:(id)currentViewController
         completion:(UMSocialRequestCompletionHandler)completion;

//显示分享群社UI
- (void)showShareGroupUI:(UMSocialShareModel*)shareModel currentViewController:(id)currentViewController
         completion:(UMSocialRequestCompletionHandler)completion;


/**
 *  平台是否安装
 *
 *  @param platformType 平台类型 @see UMSocialPlatformType
 *
 *  @return YES 代表安装，NO 代表未安装
 *  @note 调用前请检查是否配置好平台相关白名单: http://dev.umeng.com/social/ios/quick-integration#1_3
 *  在判断QQ空间的App的时候，QQApi判断会出问题
 */
-(BOOL) isInstall:(UMSocialPlatformType)platformType;

/**
 *  当前平台是否支持分享
 *
 *  @param platformType 平台类型 @see UMSocialPlatformType
 *
 *  @return YES代表支持，NO代表不支持
 */
-(BOOL) isSupport:(UMSocialPlatformType)platformType;

@end
