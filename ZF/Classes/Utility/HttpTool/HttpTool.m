//
//  HttpTool.m
//  LS
//
//  Created by ZMac on 2018/11/30.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "HttpTool.h"
#import <AFNetworking.h>
#import "UserInfoModel.h"

//HTTP响应三要素
#define RESCODE @"status"
#define RESMSG  @"msg"
#define RESDATA @"data"

//http响应成功代码
static int success_code = 0;
static int success_code_xm = 200;

//用户未登录token无效
static int invalidtoken_code = 1005;

/**
 *  网络请求管理类
 */
@interface HttpTool()
{
    //HTTP请求类
    AFHTTPSessionManager *m_manager;
    
    //网络状态管理
    AFNetworkReachabilityManager *m_StatusManager;
    
    NSString * m_strMainUrl;
    
    //保存上次的请求参数
    NSString * m_strUrl;
    NSMutableDictionary * m_dcparameters;
    NSString* m_strRoute;
    
    //请求头
    NSDictionary* m_dicHeader;
    
    //下载类
    NSURLSessionTask *_session_dl;
}
@end


@implementation HttpTool


+ (instancetype)sharedManager {
    static HttpTool *_manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[self alloc] init];
    });
    
    return _manager;
}

//重载
- (instancetype) init
{
    if ( self = [super init] )
    {
        m_manager = nil;
        m_StatusManager = nil;
        m_dcparameters = [[NSMutableDictionary alloc]init];
    }
    
    return self;
}

-(void) dealloc
{
    NSLog(@"%s dealloc", object_getClassName(self));
}

//设置请求头
-(void)setRequestHeader:(NSDictionary*)dicHeader
{
    m_dicHeader = dicHeader;
}

/**
 *  设置请求超时时间
 *
 *  @param dTimeOut <#nTimeOut description#>
 */
-(void)SetRequestTimeOut:(double)dTimeOut
{
    if (m_manager)
    {
        m_manager.requestSerializer.timeoutInterval = dTimeOut;
    }
}

/**
 *  取消请求
 */
-(void)CancelRequest
{
    if (m_manager)
    {
        [m_manager.operationQueue cancelAllOperations];
    }
}

//设置主url
-(void)setMainUrl:(NSString*)mainUrl
{
    m_strMainUrl = mainUrl;
}

//获取主url
-(NSString*)getMainUrl
{
    return m_strMainUrl;
}

/**
 *  会话状态和响应状态判断
 *
 *  @param JSONData <#JSONData description#>
 *
 *  @return 请求结果,0为成功，x为失败
 */
-(int)StatusJudge:(id)JSONData success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    NSError *error = nil;
    NSDictionary *dic = nil;
    //判断是否需要转换
    if (JSONData && ![JSONData isKindOfClass:[NSDictionary class]])
    {
        dic =[NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:&error];
    }
    else
    {
        dic = JSONData;
    }
    
    if ( kObjectIsEmpty(dic) )
    {
        dic = [self hanldeJsonDta:JSONData];
        if ( kObjectIsEmpty(dic) )
        {
            error = [[NSError alloc] initWithDomain:@"没有数据返回"
                                             code:101
                                         userInfo:nil];
            if (ReqFailure)
            {
                ReqFailure(error);
            }
            return 101;
        }
        
    }
    
    NSString *strResponse = [dic objectForKey:RESCODE];
    int nRet = [strResponse intValue];
    
    if(nRet==success_code || nRet==success_code_xm)
    {
        return nRet;
    }
    else if(nRet==invalidtoken_code)
    {
        id msg = [dic objectForKey:RESDATA];
        NSString* str = nil;
        if ( [msg isKindOfClass:[NSString class]] )
        {
            str = (NSString*)msg;
        }
        else
        {
            str = @"未知错误";
        }
        
        //发送会话已过期通知
        [[NSNotificationCenter defaultCenter] postNotificationName:UserInvalidTokenNotification object:nil userInfo:nil];
        NSError* err = [[NSError alloc] initWithDomain:str
                                                  code:nRet
                                              userInfo:nil];
        
        if (ReqFailure)
        {
            ReqFailure(err);
        }
    }
    else
    {
        id msg = [dic objectForKey:RESDATA];
        //id msg = [dic objectForKey:RESMSG];
        NSString* str = nil;
        if ( [msg isKindOfClass:[NSString class]] )
        {
            str = (NSString*)msg;
        }
        else
        {
            str = @"未知错误";
        }
        
        NSError* err = [[NSError alloc] initWithDomain:str
                                                  code:nRet
                                              userInfo:nil];
        if (ReqFailure)
        {
            ReqFailure(err);
        }
    }
    
    return nRet;
}


/**
 Get请求
 
 @param strUrl <#strUrl description#>
 @param dicParameters <#dicParameters description#>
 */
- (void)GetRequest:(NSString *)strUrl Parameters:(NSDictionary *)dicParameters success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    if ( !m_manager )
    {
        m_manager = [AFHTTPSessionManager manager];
    }
    
    [self hanldRequestHeader];
    
    //设置超时
    [self SetRequestTimeOut:30.0f];
    
    // 在AFN的block内使用，防止造成循环引用
    kWeakSelf(self);
    
    //发送请求
    [m_manager GET:strUrl parameters:dicParameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject)
     {
         //判断状态是否有效
         int nRet = [weakself StatusJudge:responseObject success:ReqSuccess failure:ReqFailure];
         if (nRet==success_code || nRet==success_code_xm)
         {
             //解析需要的数据
             NSError *error = nil;
             NSDictionary *dcattributes = nil;
             //判断是否需要转换
             if (![responseObject isKindOfClass:[NSDictionary class]])
             {
                 dcattributes =[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
             }
             else
             {
                 dcattributes = responseObject;
             }
             
             if ( kObjectIsEmpty(dcattributes) )
             {
                 dcattributes = [self hanldeJsonDta:responseObject];
                 if ( kObjectIsEmpty(dcattributes) )
                 {
                     if (ReqFailure)
                     {
                         ReqFailure(error);
                     }
                     return;
                 }
             }
             
             NSDictionary *dic = [dcattributes objectForKey:RESDATA];
             if ( ReqSuccess )
             {
                 //成功回调
                 ReqSuccess(dic);
             }
             
         }
     }
            failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         if (ReqFailure)
         {
             [self ErrorStatus:error failure:ReqFailure];
         }
     }];
}


/**
 Post请求
 
 @param strUrl <#strUrl description#>
 @param dicParameters <#dicParameters description#>
 @param ReqSuccess <#ReqSuccess description#>
 @param ReqFailure <#ReqFailure description#>
 */
- (void)PostRequest:(NSString *)strUrl Parameters:(NSDictionary *)dicParameters success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    if ( !m_manager )
    {
        m_manager = [AFHTTPSessionManager manager];
    }
    
    [self hanldRequestHeader];
    
    //设置超时
    [self SetRequestTimeOut:30.0f];
    
    // 在AFN的block内使用，防止造成循环引用
    kWeakSelf(self);
    
    //发送请求
    [m_manager POST:strUrl parameters:dicParameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject)
     {
         //判断状态是否有效
         int nRet = [weakself StatusJudge:responseObject success:ReqSuccess failure:ReqFailure];
         if (nRet==success_code || nRet==success_code_xm)
         {
             //解析需要的数据
             NSError *error = nil;
             NSDictionary *dcattributes = nil;
             //判断是否需要转换
             if (![responseObject isKindOfClass:[NSDictionary class]])
             {
                 dcattributes =[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
             }
             else
             {
                 dcattributes = responseObject;
             }
             
             if ( kObjectIsEmpty(dcattributes) )
             {
                 dcattributes = [self hanldeJsonDta:responseObject];
                 if ( kObjectIsEmpty(dcattributes) )
                 {
                     if (ReqFailure)
                     {
                         ReqFailure(error);
                     }
                     return;
                 }
             }
             
             NSDictionary *dic = [dcattributes objectForKey:RESDATA];
             if ( ReqSuccess )
             {
                 //成功回调
                 ReqSuccess(dic);
             }
             
         }
     }
    failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         if (ReqFailure)
         {
             [self ErrorStatus:error failure:ReqFailure];
         }
     }];
}

-(NSDictionary*)hanldeJsonDta:(id)jsondata
{
    NSString* str = [[NSString alloc]initWithData:jsondata encoding:NSUTF8StringEncoding];
    
    NSRange range;
    range = [str rangeOfString:@"{"];
    if (range.location != NSNotFound)
    {
        if (range.location>0)
        {
            str = [str substringFromIndex:range.location];
        }
    }
    
    if ( kObjectIsEmpty(str) )
    {
        DLog(@"数据格式有误...");
        return nil;
    }
    
    NSData* data =[str dataUsingEncoding:NSUTF8StringEncoding];
    if ( kObjectIsEmpty(data) )
    {
        DLog(@"数据格式有误...");
        return nil;
    }
    
    NSError *error;
    NSDictionary *dic =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if ( kObjectIsEmpty(dic) )
    {
        return nil;
    }
    
    return dic;
}

//处理请求头
-(void)hanldRequestHeader
{
    //申明请求的数据
    m_manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    //申明请求的编码
    m_manager.requestSerializer.stringEncoding = NSUTF8StringEncoding;
    
    //如果报接受类型不一致请替换一致text/html或别的
    m_manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    if (kObjectIsEmpty(m_dicHeader))
    {
        return;
    }
    
    if ([m_dicHeader objectForKey:@"Content-Type"]
        && [[m_dicHeader objectForKey:@"Content-Type"] isEqualToString:@"application/json;charset=UTF-8"])
    {
        m_manager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    
    for(NSString* key in m_dicHeader.allKeys)
    {
        NSString* value = [m_dicHeader objectForKey:key];
        
        //是否为json请求格式
        if ([key isEqualToString:@"Content-Type"]
            && [value isEqualToString:@"application/json;charset=UTF-8"])
        {
            continue;
        }
        
        [m_manager.requestSerializer setValue:value forHTTPHeaderField:key];
    }
    
    //设置为空
    m_dicHeader = nil;
}


//处理签名方法
-(NSDictionary*)hanldeSign:(NSMutableDictionary*)parameters
{
    //加常用类型
    //[parameters setObject:@"iOS" forKey:@"os"];
    
    //设置请求头
    UserInfoModel* userInfo = [UserInfoModel readUserInfo];
    if (kStringIsEmpty(userInfo.token)==NO)
    {
        NSMutableDictionary* dic = [[NSMutableDictionary alloc]init];
        [dic setObject:userInfo.token forKey:@"Token"];
        [self setRequestHeader:dic];
    }
    
    return parameters;
}


//错误状态的处理
-(void)ErrorStatus:(NSError *)error failure:(ErrorData)ReqFailure
{
    NSError* err = nil;
    
    if (!error)
    {
        err = [[NSError alloc] initWithDomain:@"未知错误"
                                         code:10001
                                     userInfo:nil];
    }
    else
    {
        if (error.code==-1001)
        {
            err = [[NSError alloc] initWithDomain:@"请求超时"
                                             code:-1001
                                         userInfo:nil];
        }
        else if (error.code==-1009)
        {
            err = [[NSError alloc] initWithDomain:@"网络错误"
                                             code:-1009
                                         userInfo:nil];
        }
        else
        {
            err = error;
        }
    }
    
    if (ReqFailure)
    {
        ReqFailure(err);
    }
}



/**
 Delete请求
 
 @param strUrl <#strUrl description#>
 @param dicParameters <#dicParameters description#>
 @param ReqSuccess <#ReqSuccess description#>
 @param ReqFailure <#ReqFailure description#>
 */
- (void)DeleteRequest:(NSString *)strUrl Parameters:(NSDictionary *)dicParameters success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    if ( !m_manager )
    {
        m_manager = [AFHTTPSessionManager manager];
    }
    
    [self hanldRequestHeader];
    
    //发送网络请求(请求方式为DELETE) 
    m_manager.requestSerializer.HTTPMethodsEncodingParametersInURI = [NSSet setWithObjects:@"GET", @"HEAD", nil];
    
    //设置超时
    [self SetRequestTimeOut:30.0f];
    
    // 在AFN的block内使用，防止造成循环引用
    kWeakSelf(self);
    
    //发送请求
    [m_manager DELETE:strUrl parameters:dicParameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
        //判断状态是否有效
        int nRet = [weakself StatusJudge:responseObject success:ReqSuccess failure:ReqFailure];
        if (nRet==success_code || nRet==success_code_xm)
        {
            //解析需要的数据
            NSError *error = nil;
            NSDictionary *dcattributes = nil;
            //判断是否需要转换
            if (![responseObject isKindOfClass:[NSDictionary class]])
            {
                dcattributes =[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
            }
            else
            {
                dcattributes = responseObject;
            }
            
            if ( kObjectIsEmpty(dcattributes) )
            {
                dcattributes = [self hanldeJsonDta:responseObject];
                if ( kObjectIsEmpty(dcattributes) )
                {
                    if (ReqFailure)
                    {
                        ReqFailure(error);
                    }
                    return;
                }
            }
            
            NSDictionary *dic = [dcattributes objectForKey:RESDATA];
            if ( ReqSuccess )
            {
                //成功回调
                ReqSuccess(dic);
            }
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
    {
        if (ReqFailure)
        {
            [self ErrorStatus:error failure:ReqFailure];
        }
    }];
    
    
}

@end
