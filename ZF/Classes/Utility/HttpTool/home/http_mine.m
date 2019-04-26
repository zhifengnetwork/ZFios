//
//  http_mine.m
//  ZF
//
//  Created by weiming zhang on 2019/4/26.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "http_mine.h"

@implementation http_mine

//我的钱包
+ (void)my_wallet:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"/api/User/my_wallet"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//我的页面
+ (void)myIndex:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"/api/User/myIndex"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//我的关注
//我关注的商品
+ (void)collect_list:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"/api/User/collect_list"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//我的足迹
+ (void)visit_log:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"/api/User/visit_log"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//足迹编辑
+ (void)del_visit_log:(NSInteger)visit_ids success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSString *str = [NSString stringWithFormat:@"%ld",visit_ids];
    [parameters setObject:str forKey:@"visit_ids"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"/api/User/del_visit_log"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//清空全部足迹
+ (void)clear_visit_log:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"/api/User/clear_visit_log"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//优惠券列表
//status    优惠券状态(默认0未使用，1已使用 2已过期)
+ (void)coupon_list:(NSInteger)status success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSString *str = [NSString stringWithFormat:@"%ld",status];
    [parameters setObject:str forKey:@"status"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"/api/Activity/coupon_list"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//分销会员页
//分销会员
+ (void)distribut_index:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"/api/User/distribut_index"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//我的会员
+ (void)team_list:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"/api/User/team_list"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
@end
