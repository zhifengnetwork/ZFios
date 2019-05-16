//
//  http_home.m
//  ZF
//
//  Created by weiming zhang on 2019/4/24.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "http_home.h"
#import <AFNetworking.h>
#import "UserInfoModel.h"


@implementation http_home


/**
 轮播-秒杀-头条接口
 
 @param pid 广告pid,默认9：banner轮播
 @param cat_id 文章类型ID, 默认15：智丰头条
 @param name  昵称
 */
+ (void)index:(NSInteger)pid cat_id:(NSInteger)cat_id name:(NSString *)name success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    [parameters setObject:[NSString stringWithFormat:@"%lu",(unsigned long)pid] forKey:@"pid"];
    
    [parameters setObject:[NSString stringWithFormat:@"%lu",(unsigned long)cat_id] forKey:@"cat_id"];
    
    if ( !kStringIsEmpty(name) )
    {
        [parameters setObject:name forKey:@"name"];
    }
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/index/index"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}


//列表产品
//分类列表产品接口
+ (void)Products:(NSString *)cat_id success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    [parameters setObject:cat_id forKey:@"cat_id"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/goods/Products"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//首页点击[看相似]根据分类id跳转至商品列表页
+ (void)goodsList:(NSString*)type page:(NSInteger)page success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSString *str = [NSString stringWithFormat:@"%ld",page];
    [parameters setObject:str forKey:@"page"];
    
    [parameters setObject:@"10" forKey:@"num"];
    
    if (!kStringIsEmpty(type)) {
        [parameters setObject:type forKey:@"type"];
    }
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/Goods/goodsList"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//上传头像接口
//image 头像
+ (void)update_head_pic:(UIImage*)image success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/user/update_head_pic"];
    
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer.stringEncoding = NSUTF8StringEncoding;
    
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //设置超时
    manager.requestSerializer.timeoutInterval = 60.0f;
    
    NSData* data = UIImageJPEGRepresentation(image, 1.0);
    NSMutableDictionary *dicParameters = nil;
    
    UserInfoModel* userInfo = [UserInfoModel readUserInfo];
    [manager.requestSerializer setValue:userInfo.token forHTTPHeaderField:@"token"];
    
    NSURLSessionTask *session = [manager POST:strUrl parameters:dicParameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData)
                                 {
                                     NSString* mimeType = @"image/jpeg";
                                     
                                     [formData appendPartWithFileData:data name:@"image" fileName:@"image.jpg" mimeType:mimeType];
                                 }
                                     progress:^(NSProgress * _Nonnull uploadProgress)
                                 {
                                     
                                 }
                                      success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
                                 {
                                     if (ReqSuccess)
                                     {
                                         ReqSuccess(responseObject);
                                     }
                                 }
                                      failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
                                 {
                                     if (ReqFailure)
                                     {
                                         ReqFailure(error);
                                     }
                                 }];
    
    [session resume];
}

//个人信息修改
//修改名称
+ (void)update_username:(ZFUserModel*)usermodel success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    if (!kStringIsEmpty(usermodel.head_pic)) {
        [parameters setObject:usermodel.head_pic forKey:@"head_pic"];
    }
    
    if (!kStringIsEmpty(usermodel.nickname)) {
        [parameters setObject:usermodel.nickname forKey:@"nickname"];
    }
    
    if (!kStringIsEmpty(usermodel.mobile)) {
        [parameters setObject:usermodel.mobile forKey:@"mobile"];
    }
    
    if (!kStringIsEmpty(usermodel.sex)) {
        [parameters setObject:usermodel.sex forKey:@"sex"];
    }
    
    if (!kStringIsEmpty(usermodel.birthyear)) {
        [parameters setObject:usermodel.birthyear forKey:@"birthyear"];
    }
    
    if (!kStringIsEmpty(usermodel.birthmonth)) {
        [parameters setObject:usermodel.birthmonth forKey:@"birthmonth"];
    }
    
    if (!kStringIsEmpty(usermodel.birthday)) {
        [parameters setObject:usermodel.birthday forKey:@"birthday"];
    }
    
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/User/update_username"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//商品搜索列表页
// q    搜索关键字
+ (void)search:(ZFSearchModel*)searchModel success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    if (!kStringIsEmpty(searchModel.q)) {
        [parameters setObject:searchModel.q forKey:@"q"];
    }
    
    if (!kStringIsEmpty(searchModel.ID)) {
        [parameters setObject:searchModel.ID forKey:@"id"];
    }
    
    if (!kStringIsEmpty(searchModel.brand_id)) {
        [parameters setObject:searchModel.brand_id forKey:@"brand_id"];
    }
    
    if (!kStringIsEmpty(searchModel.sort)) {
        [parameters setObject:searchModel.sort forKey:@"sort"];
    }else{
        [parameters setObject:@"sort, [is_new,comment_count,sales_sum,shop_price]" forKey:@"sort"];
    }
    
    if (!kStringIsEmpty(searchModel.sort_asc)) {
        [parameters setObject:searchModel.sort_asc forKey:@"sort_asc"];
    }else{
        [parameters setObject:@"desc, [asc]" forKey:@"sort_asc"];
    }
    
    if (!kStringIsEmpty(searchModel.sel)) {
        [parameters setObject:searchModel.sel forKey:@"sel"];
    }else{
        [parameters setObject:@"[all,free_post,store_count,prom_type]" forKey:@"sel"];
    }
    
    
    
    if (!kStringIsEmpty(searchModel.price)) {
        [parameters setObject:searchModel.price forKey:@"price"];
    }
    
    if (!kStringIsEmpty(searchModel.start_price)) {
        [parameters setObject:searchModel.start_price forKey:@"start_price"];
    }
    
    if (!kStringIsEmpty(searchModel.end_price)) {
        [parameters setObject:searchModel.end_price forKey:@"end_price"];
    }
    
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/Search/search"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//获取热门搜索词汇
+ (void)getHotKeywords:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/search/getHotKeywords"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//获取素材列表
+ (void)getMaterialList:(NSInteger)cid page:(NSInteger)page success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSString *str = [NSString stringWithFormat:@"%ld",cid];
    [parameters setObject:str forKey:@"cid"];
    
    NSString *str2 = [NSString stringWithFormat:@"%ld",page];
    [parameters setObject:str2 forKey:@"page"];
    
    [parameters setObject:@"6" forKey:@"num"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/Material/GetMaterialList"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//获取素材详情
+ (void)getMaterialDetail:(NSString*)ID success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    if (!kStringIsEmpty(ID)) {
        [parameters setObject:ID forKey:@"id"];
    }
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/Material/GetMaterialDetail"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}


@end
