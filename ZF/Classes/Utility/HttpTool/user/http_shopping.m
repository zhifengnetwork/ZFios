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

+(void)cartlist:(NSInteger)page num:(NSInteger)num success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSString *str = [NSString stringWithFormat:@"%ld",page];
    [parameters setObject:str forKey:@"page"];
    
    NSString *str2 = [NSString stringWithFormat:@"%ld",num];
    [parameters setObject:str2 forKey:@"num"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/cart/cartlist"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
/**
 删除购物车的商品
 */
+(void)delcart:(NSInteger)ID success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    
    NSString *str = [NSString stringWithFormat:@"%ld",ID];
    [parameters setObject:str forKey:@"id"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/cart/delcart"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//勾选购物车商品，并返回计算结果
//ID  商品id
//selected   是否选中（1为选中）
+(void)AsyncUpdateCart:(NSInteger)ID selected:(NSString*)selected success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSString *str = [NSString stringWithFormat:@"%ld",ID];
    [parameters setObject:str forKey:@"id"];
    
    if (!kStringIsEmpty(selected)) {
        [parameters setObject:selected forKey:@"selected"];
    }
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/Cart/AsyncUpdateCart"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

/**
 购物车加减
 @param ID 当前商品购物车id
 @param goods_num 数量
 */
+(void)changeNum:(NSInteger)ID goods_num:(NSInteger)goods_num success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSString *str = [NSString stringWithFormat:@"%ld",ID];
    [parameters setObject:str forKey:@"id"];
    
    NSString *str2 = [NSString stringWithFormat:@"%ld",goods_num];
    [parameters setObject:str2 forKey:@"goods_num"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/Cart/changeNum"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//购物车全选或取消全选
//all_flag  标识 1全选 2不全选
+(void)selectedOrAll:(NSInteger)all_flag success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSString *str = [NSString stringWithFormat:@"%ld",all_flag];
    [parameters setObject:str forKey:@"all_flag"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/Cart/selectedOrAll"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
@end
