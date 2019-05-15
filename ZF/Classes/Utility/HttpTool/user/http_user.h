//
//  http_user.h
//  LS
//
//  Created by apple on 2018/12/31.
//  Copyright © 2018 LS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpTool.h"
#import "UserInfoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface http_user : NSObject

//用户注册
+(void)userReg:(UserInfoModel*)userInfo success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//发送短信
+(void)validateCode:(NSString*)type scene:(NSString*)scene mobile:(NSString*)mobile success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//用户登录
+(void)login:(NSString*)username password:(NSString*)password success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//验证码(短信类型，1注册，2登陆；默认1)
+(void)sendCode:(NSString*)mobile type:(NSString*)type success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//获取用户基本信息
+(void)userinfo:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;



/**
 订单列表
 
 @param type 0全部订单 1:待支付 2:待收货 3:待评价 4:待发货
 */
+(void)order_list:(NSInteger)type success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;


/**
 订单详情
 */
+(void)order_detail:(NSInteger)order_id success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//取消订单接口
//订单ID    order_id
+(void)CancelOrder:(NSInteger)order_id success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//确认收货
//订单ID    order_id
+(void)order_confirm:(NSInteger)order_id success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//获取物流信息接口
+(void)express_detail:(NSInteger)order_id success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

/**
 订单评论接口
 @param order_id 订单ID
 @param info 评论信息,json格式
 */
+(void)order_common:(NSInteger)order_id info:(NSString*)info success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;
//评论-上传图片接口
//file 图片
+(void)common_upload_pic:(NSString*)pic success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;
/**
 找回密码验证码比对
 */
+(void)FindPwdCheckSms:(NSString*)mobile code:(NSString*)code success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

/**
 找回密码
 */
+(void)FindPwd:(NSString*)mobile password:(NSString*)password password2:(NSString*)password2 success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;


/**
 微信登录
 */
+(void)weixin_login:(NSString*)code success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;


/**
 签到
 */
+(void)AppSign:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;


/**
 获取签到的日期列表
 */
+(void)AppGetSignDay:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

@end

NS_ASSUME_NONNULL_END
