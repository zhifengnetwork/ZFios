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

//获取用户基本信息
+(void)userinfo:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;



/**
 订单列表
 
 @param type 0所有 1:待支付(非货到付款) 2:部分发货(非货到付款) 3:待收货 4:待评价
 5:已取消 6:已完成 7:已作废 8:待发货’,货到付款 9:待发货’,货到付款
 @param ReqSuccess <#ReqSuccess description#>
 @param ReqFailure <#ReqFailure description#>
 */
+(void)order_list:(NSInteger)type success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;


/**
 订单详情
 */
+(void)order_detail:(NSString *)ID success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

@end

NS_ASSUME_NONNULL_END
