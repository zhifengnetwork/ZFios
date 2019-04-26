//
//  http_home.m
//  ZF
//
//  Created by weiming zhang on 2019/4/24.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "http_home.h"

@implementation http_home

//列表产品
//分类列表产品接口
+ (void)Products:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"/api/goods/Products"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//首页点击[看相似]根据分类id跳转至商品列表页
+ (void)goodsList:(ZFGoodModel *)goodmodel success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSString *str = [NSString stringWithFormat:@"%ld",goodmodel.ID];
    [parameters setObject:str forKey:@"id"];
    
    
    NSString *str1 = [NSString stringWithFormat:@"%ld",goodmodel.goods_id];
    [parameters setObject:str1 forKey:@"goods_id"];
    
    NSString *str2 = [NSString stringWithFormat:@"%ld",goodmodel.brand_id];
    [parameters setObject:str2 forKey:@"brand_id"];
    
    if (!kStringIsEmpty(goodmodel.spec)) {
        [parameters setObject:goodmodel.spec forKey:@"spec"];
    }else{
        [parameters setObject:@"0" forKey:@"spec"];
    }
    
    if (!kStringIsEmpty(goodmodel.attr)) {
        [parameters setObject:goodmodel.attr forKey:@"attr"];
    }
    
    if (!kStringIsEmpty(goodmodel.sort)) {
        [parameters setObject:goodmodel.sort forKey:@"sort"];
    }else{
        [parameters setObject:@"sort, [is_new,comment_count,sales_sum,shop_price]" forKey:@"sort"];
    }
    
    if (!kStringIsEmpty(goodmodel.sort_asc)) {
        [parameters setObject:goodmodel.sort_asc forKey:@"sort_asc"];
    }
    
    if (!kStringIsEmpty(goodmodel.sel)) {
        [parameters setObject:goodmodel.sel forKey:@"sel"];
    }else{
        [parameters setObject:@"[all,free_post,store_count,prom_type]" forKey:@"sel"];
    }
    
    if (!kStringIsEmpty(goodmodel.price)) {
        [parameters setObject:goodmodel.price forKey:@"price"];
    }
    
    
    if (!kStringIsEmpty(goodmodel.start_price)) {
        [parameters setObject:goodmodel.start_price forKey:@"start_price"];
    }
    
    if (!kStringIsEmpty(goodmodel.end_price)) {
        [parameters setObject:goodmodel.end_price forKey:@"end_price"];
    }
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"/api/Goods/goodsList"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//上传头像接口
//image 头像
+ (void)update_head_pic:(NSString*)image success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    if (!kStringIsEmpty(image)) {
        [parameters setObject:image forKey:@"image"];
    }
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"/api/user/update_head_pic"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
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
    
    NSString *str2 = [NSString stringWithFormat:@"%ld",usermodel.sex];
    [parameters setObject:str2 forKey:@"sex"];
    
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
    strUrl = [strUrl stringByAppendingPathComponent:@"/api/User/update_username"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//商品搜索列表页
// q    搜索关键字
+ (void)search:(NSString*)q searchModel:(ZFSearchModel*)searchModel success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    if (!kStringIsEmpty(q)) {
        [parameters setObject:q forKey:@"q"];
    }
    
    NSString *str = [NSString stringWithFormat:@"%ld",searchModel.ID];
    [parameters setObject:str forKey:@"id"];
    
    NSString *str2 = [NSString stringWithFormat:@"%ld",searchModel.brand_id];
    [parameters setObject:str2 forKey:@"brand_id"];
    
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
    strUrl = [strUrl stringByAppendingPathComponent:@"/api/Search/search"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
@end
