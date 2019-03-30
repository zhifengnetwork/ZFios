//
//  http_user.m
//  LS
//
//  Created by apple on 2018/12/31.
//  Copyright © 2018 LS. All rights reserved.
//

#import "http_user.h"


@implementation http_user

//用户注册
+(void)signup:(NSString*)username password:(NSString*)password code:(NSString*)code success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:3];
    
    if ( !kStringIsEmpty(username) )
    {
        [parameters setObject:username forKey:@"username"];
    }
    
    if ( !kStringIsEmpty(password) )
    {
        [parameters setObject:password forKey:@"password"];
    }
    
    if ( !kStringIsEmpty(code) )
    {
        [parameters setObject:code forKey:@"code"];
    }
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/signup"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//用户登录
+(void)login:(NSString*)username password:(NSString*)password success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:2];
    
    if ( !kStringIsEmpty(username) )
    {
        [parameters setObject:username forKey:@"mobile"];
    }
    
    if ( !kStringIsEmpty(password) )
    {
        [parameters setObject:password forKey:@"password"];
    }
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/user/login"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//验证码(短信类型，1注册，2登陆；默认1)
+(void)sendCode:(NSString*)mobile type:(NSString*)type success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:2];
    
    if ( !kStringIsEmpty(mobile) )
    {
        [parameters setObject:mobile forKey:@"mobile"];
    }
    
    if ( !kStringIsEmpty(type) )
    {
        [parameters setObject:type forKey:@"type"];
    }
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/sendCode"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//获取用户基本信息
+(void)userinfo:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/user/userinfo"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

/**
 订单列表
 
 @param type 0所有 1:待支付(非货到付款) 2:部分发货(非货到付款) 3:待收货 4:待评价
 5:已取消 6:已完成 7:已作废 8:待发货’,货到付款 9:待发货’,货到付款
 @param ReqSuccess <#ReqSuccess description#>
 @param ReqFailure <#ReqFailure description#>
 */
+(void)order_list:(NSInteger)type success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:2];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    if (type==0)
    {
        strUrl = [strUrl stringByAppendingPathComponent:@"api/order/order_list"];
    }
    else if (type==1)
    {
        strUrl = [strUrl stringByAppendingPathComponent:@"api/order/order_list/type/WAITPAY"];
    }
    else if (type==2)
    {
        strUrl = [strUrl stringByAppendingPathComponent:@"api/order/order_list/type/PORTIONSEND"];
    }
    else if (type==3)
    {
        strUrl = [strUrl stringByAppendingPathComponent:@"api/order/order_list/type/WAITRECEIVE"];
    }
    else if (type==4)
    {
        strUrl = [strUrl stringByAppendingPathComponent:@"api/order/order_list/type/WAITCCOMMENT"];
    }
    else if (type==5)
    {
        strUrl = [strUrl stringByAppendingPathComponent:@"api/order/order_list/type/CANCEL"];
    }
    else if (type==6)
    {
        strUrl = [strUrl stringByAppendingPathComponent:@"api/order/order_list/type/FINISH"];
    }
    else if (type==7)
    {
        strUrl = [strUrl stringByAppendingPathComponent:@"api/order/order_list/type/CANCELLED"];
    }
    else if (type==8)
    {
        strUrl = [strUrl stringByAppendingPathComponent:@"api/order/order_list/type/WAITSEND"];
    }
    else if (type==9)
    {
        strUrl = [strUrl stringByAppendingPathComponent:@"api/order/order_list/type/WAITSEND"];
    }
    
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

/**
 订单详情
 */
+(void)order_detail:(NSString *)ID success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    [parameters setObject:ID forKey:@"id"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/order/order_detail"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

@end
