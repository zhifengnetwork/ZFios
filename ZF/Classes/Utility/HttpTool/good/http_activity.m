//
//  http_activity.m
//  ZF
//
//  Created by weiming zhang on 2019/4/26.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "http_activity.h"

@implementation http_activity

/**
 //获取抢购活动列表接口
 @param start_time 开始时间
 @param end_time 结束时间
 */
+ (void)flash_sale_list:(NSInteger)start_time end_time:(NSInteger)end_time goodModel:(ZFGoodModel*)goodModel success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSString *str = [NSString stringWithFormat:@"%ld",start_time];
    [parameters setObject:str forKey:@"start_time"];
    
    NSString *str2 = [NSString stringWithFormat:@"%ld",end_time];
    [parameters setObject:str2 forKey:@"end_time"];
    
    NSString *str3 = [NSString stringWithFormat:@"%ld",goodModel.page];
    [parameters setObject:str3 forKey:@"page"];
    
    NSString *str4 = [NSString stringWithFormat:@"%ld",goodModel.num];
    [parameters setObject:str4 forKey:@"num"];
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"/api/activity/flash_sale_list"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//获取抢购活动时间列表
+ (void)get_flash_sale_time:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"/api/activity/get_flash_sale_time"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//获取抢购活动详情接口
//ID  抢购活动ID
+ (void)flash_sale_info:(NSString*)ID success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    [parameters setObject:ID forKey:@"id"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"/api/activity/flash_sale_info"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

/**
 提交抢购订单
 @param ID 抢购活动ID
 @param address_id 地址ID
 */
+ (void)post_flash_sale:(NSInteger)ID address_id:(NSInteger)address_id success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSString *str1 = [NSString stringWithFormat:@"%ld",ID];
    [parameters setObject:str1 forKey:@"id"];
    
    NSString *str2 = [NSString stringWithFormat:@"%ld",address_id];
    [parameters setObject:str2 forKey:@"address_id"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"/api/activity/post_flash_sale"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//竞拍列表
+ (void)auction_list:(ZFGoodModel*)goodModel success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSString *str1 = [NSString stringWithFormat:@"%ld",goodModel.page];
    [parameters setObject:str1 forKey:@"page"];
    
    NSString *str2 = [NSString stringWithFormat:@"%ld",goodModel.num];
    [parameters setObject:str2 forKey:@"num"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"/api/activity/auction_list"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
@end
