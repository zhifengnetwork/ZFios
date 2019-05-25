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
+(void)userReg:(UserInfoModel*)userInfo success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:4];
    
    if ( !kStringIsEmpty(userInfo.nickname) )
    {
        [parameters setObject:userInfo.nickname forKey:@"nickname"];
    }
    
    if ( !kStringIsEmpty(userInfo.mobile) )
    {
        [parameters setObject:userInfo.mobile forKey:@"username"];
    }
    
    if ( !kStringIsEmpty(userInfo.password) )
    {
        [parameters setObject:userInfo.password forKey:@"password"];
    }
    
    if ( !kStringIsEmpty(userInfo.password2) )
    {
        [parameters setObject:userInfo.password2 forKey:@"password2"];
    }
    if ( !kStringIsEmpty(userInfo.code) )
    {
        [parameters setObject:userInfo.code forKey:@"code"];
    }
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/user/reg"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//发送短信
+(void)validateCode:(NSString*)type scene:(NSString*)scene mobile:(NSString*)mobile success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:4];
    
    if ( !kStringIsEmpty(type) )
    {
        [parameters setObject:type forKey:@"type"];
    }
    
    if ( !kStringIsEmpty(scene) )
    {
        [parameters setObject:scene forKey:@"scene"];
    }
    
    if ( !kStringIsEmpty(mobile) )
    {
        [parameters setObject:mobile forKey:@"mobile"];
    }
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"home/Api/app_send_validate_code"];
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
 
 @param type 0全部订单 1:待支付 2:待收货 3:待评价 4:待发货
 */
+(void)order_list:(NSInteger)type success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSString *str = [NSString stringWithFormat:@"%ld",type];
    [parameters setObject:str forKey:@"type"];
    
    NSString *str1 = [NSString stringWithFormat:@"%d",10];
    [parameters setObject:str1 forKey:@"num"];

    NSString *str2 = [NSString stringWithFormat:@"%d",1];
    [parameters setObject:str2 forKey:@"page"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/order/order_list"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

/**
 团队成员订单列表接口
 @param next_user_id 下级团员ID，与type只能传其中一个
 */
+ (void)order_list:(NSInteger)next_user_id type:(NSString*)type success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSString *str = [NSString stringWithFormat:@"%ld",next_user_id];
    [parameters setObject:str forKey:@"next_user_id"];
    
    if (!kStringIsEmpty(type)) {
        [parameters setObject:str forKey:@"type"];
    }
    
    NSString *str1 = [NSString stringWithFormat:@"%d",10];
    [parameters setObject:str1 forKey:@"num"];
    
    NSString *str2 = [NSString stringWithFormat:@"%d",1];
    [parameters setObject:str2 forKey:@"page"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/user/order_list"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

/**
 订单详情
 */
+(void)order_detail:(NSInteger)order_id success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSString *str = [NSString stringWithFormat:@"%ld",order_id];
    [parameters setObject:str forKey:@"order_id"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/order/order_detail"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//取消订单接口
//订单ID    order_id
+(void)CancelOrder:(NSInteger)order_id success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSString *str = [NSString stringWithFormat:@"%ld",order_id];
    [parameters setObject:str forKey:@"order_id"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/order/CancelOrder"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//确认收货
//订单ID    order_id
+(void)order_confirm:(NSInteger)order_id success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSString *str = [NSString stringWithFormat:@"%ld",order_id];
    [parameters setObject:str forKey:@"order_id"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/order/order_confirm"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

/**
 订单评论接口
 @param order_id 订单ID
 @param info 评论信息,json格式
 */
+(void)order_common:(NSInteger)order_id info:(NSString*)info success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSString *str = [NSString stringWithFormat:@"%ld",order_id];
    [parameters setObject:str forKey:@"order_id"];
    
    if (!kStringIsEmpty(info)) {
        [parameters setObject:info forKey:@"info"];
    }
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/order/order_common"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//评论-上传图片接口
//file 图片
+(void)common_upload_pic:(NSString*)pic success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    if (!kStringIsEmpty(pic)) {
        [parameters setObject:pic forKey:@"pic"];
    }
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/order/common_upload_pic"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//order_sn  订单编号
+(void)GetWxAppPaySign:(NSString*)order_sn info:(NSString*)info success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    if (kStringIsEmpty(order_sn)) {
        [parameters setObject:order_sn forKey:@"order_sn"];
    }
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/payment/GetWxAppPaySign"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//获取物流信息接口
+(void)express_detail:(NSInteger)order_id success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSString *str = [NSString stringWithFormat:@"%ld",order_id];
    [parameters setObject:str forKey:@"order_id"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/order/express_detail"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

/**
 找回密码验证码比对
 */
+(void)FindPwdCheckSms:(NSString*)mobile code:(NSString*)code success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:2];
    
    if ( !kStringIsEmpty(mobile) )
    {
        [parameters setObject:mobile forKey:@"mobile"];
    }
    
    if ( !kStringIsEmpty(code) )
    {
        [parameters setObject:code forKey:@"code"];
    }
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/user/FindPwdCheckSms"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//设置支付密码
+(void)FindPwdCheckSms:(NSString*)mobile code:(NSString*)code scene:(NSInteger)scene success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:2];
    
    if ( !kStringIsEmpty(mobile) )
    {
        [parameters setObject:mobile forKey:@"mobile"];
    }
    
    if ( !kStringIsEmpty(code) )
    {
        [parameters setObject:code forKey:@"code"];
    }
    
    NSString *str = [NSString stringWithFormat:@"%ld",scene];
    [parameters setObject:str forKey:@"scene"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/user/FindPwdCheckSms"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
/**
 找回密码
 */
+(void)FindPwd:(NSString*)mobile password:(NSString*)password password2:(NSString*)password2 success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:2];
    
    if ( !kStringIsEmpty(mobile) )
    {
        [parameters setObject:mobile forKey:@"mobile"];
    }
    
    if ( !kStringIsEmpty(password) )
    {
        [parameters setObject:password forKey:@"password"];
    }
    
    if ( !kStringIsEmpty(password2) )
    {
        [parameters setObject:password2 forKey:@"password2"];
    }
    
    [parameters setObject:@"6" forKey:@"scene"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/user/FindPwd"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

/**
 //修改密码接口
 @param passold 原密码
 @param password 新密码
 @param password2 确认密码
 */
+(void)UpdatePwd:(NSString*)passold password:(NSString*)password password2:(NSString*)password2 success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:2];
    
    if ( !kStringIsEmpty(passold) )
    {
        [parameters setObject:passold forKey:@"passold"];
    }
    
    if ( !kStringIsEmpty(password) )
    {
        [parameters setObject:password forKey:@"password"];
    }
    
    if ( !kStringIsEmpty(password2) )
    {
        [parameters setObject:password2 forKey:@"password2"];
    }
    
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/user/UpdatePwd"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//设置支付密码
+(void)FindPwd:(NSString*)mobile password:(NSString*)password password2:(NSString*)password2 scene:(NSInteger)scene success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:2];
    
    if ( !kStringIsEmpty(mobile) )
    {
        [parameters setObject:mobile forKey:@"mobile"];
    }
    
    if ( !kStringIsEmpty(password) )
    {
        [parameters setObject:password forKey:@"password"];
    }
    
    if ( !kStringIsEmpty(password2) )
    {
        [parameters setObject:password2 forKey:@"password2"];
    }
    
    NSString *str = [NSString stringWithFormat:@"%ld",scene];
    [parameters setObject:str forKey:@"scene"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/user/FindPwd"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

/**
 微信登录
 */
+(void)weixin_login:(NSString*)code success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:2];
    
    if ( !kStringIsEmpty(code) )
    {
        [parameters setObject:code forKey:@"code"];
    }
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/user/weixin_login"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}


/**
 签到
 */
+(void)AppSign:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:2];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/sign/AppSign"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

/**
 获取签到的日期列表
 */
+(void)AppGetSignDay:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:2];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/sign/AppGetSignDay"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//我的分享接口
+(void)GetSharePic:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:2];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/user/GetSharePic"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

@end
