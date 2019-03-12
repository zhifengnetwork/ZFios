//
//  http_user.h
//  LS
//
//  Created by apple on 2018/12/31.
//  Copyright © 2018 LS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpTool.h"


NS_ASSUME_NONNULL_BEGIN

@interface http_user : NSObject

//用户注册
+(void)signup:(NSString*)username password:(NSString*)password code:(NSString*)code success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//用户登录
+(void)login:(NSString*)username password:(NSString*)password success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//验证码(短信类型，1注册，2登陆；默认1)
+(void)sendCode:(NSString*)mobile type:(NSString*)type success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//获取会员基本信息
+(void)member:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//获取收藏图片
+(void)memberOpusLove:(NSInteger)page success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//获取收藏视频
+(void)memberVideoLove:(NSInteger)page success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//获取VIP价格表
+(void)vip:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//激活卡激活VIP
+(void)activate:(NSString*)code success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;


@end

NS_ASSUME_NONNULL_END