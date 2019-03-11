//
//  HttpTool.h
//  LS
//
//  Created by ZMac on 2018/11/30.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SuccessData)(id responseObject);

typedef void (^ErrorData)(NSError *error);


@interface HttpTool : NSObject

+ (instancetype)sharedManager;

//设置请求头
-(void)setRequestHeader:(NSDictionary*)dicHeader;

/**
 *  设置请求超时时间
 *
 *  @param dTimeOut nTimeOut description
 */
-(void)SetRequestTimeOut:(double)dTimeOut;

/**
 *  取消请求
 */
-(void)CancelRequest;

//设置主url
-(void)setMainUrl:(NSString*)mainUrl;

//获取主url
-(NSString*)getMainUrl;


/**
 *  会话状态和响应状态判断
 *
 *  @param JSONData <#JSONData description#>
 *
 *  @return 1为登录成功，-1为更新accessToken过期，-2为其他设备登录，0为登录失败（请求结果,1为成功，0为失败）
 */
-(int)StatusJudge:(id)JSONData success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;


/**
 Get请求

 @param strUrl <#strUrl description#>
 @param dicParameters <#dicParameters description#>
 */
- (void)GetRequest:(NSString *)strUrl Parameters:(NSDictionary *)dicParameters success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

/**
 Post请求

 @param strUrl <#strUrl description#>
 @param dicParameters <#dicParameters description#>
 @param ReqSuccess <#ReqSuccess description#>
 @param ReqFailure <#ReqFailure description#>
 */
- (void)PostRequest:(NSString *)strUrl Parameters:(NSDictionary *)dicParameters success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//处理签名
-(NSDictionary*)hanldeSign:(NSMutableDictionary*)parameters;


/**
 Delete请求

 @param strUrl <#strUrl description#>
 @param dicParameters <#dicParameters description#>
 @param ReqSuccess <#ReqSuccess description#>
 @param ReqFailure <#ReqFailure description#>
 */
- (void)DeleteRequest:(NSString *)strUrl Parameters:(NSDictionary *)dicParameters success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;


@end
