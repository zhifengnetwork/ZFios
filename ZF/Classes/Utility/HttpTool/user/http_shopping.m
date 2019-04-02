//
//  http_shopping.m
//  ZF
//
//  Created by admin on 2019/4/1.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "http_shopping.h"

@implementation http_shopping

//购物车列表
+(void)cartlist:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/cart/cartlist"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

/**
 删除购物车的商品
 */
+(void)delcart:(NSString *)ID success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    [parameters setObject:ID forKey:@"id"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/cart/delcart"];
    [http GetRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

@end
