//
//  http_good.m
//  ZF
//
//  Created by weiming zhang on 2019/4/26.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "http_good.h"

@implementation http_good

//获取商品规格接口
//goods_id     商品ID
+ (void)goodsSpec:(NSInteger)goods_id success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSString *str = [NSString stringWithFormat:@"%ld",goods_id];
    [parameters setObject:str forKey:@"goods_id"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/goods/goodsSpec"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//获取商品评论接口
//goods_id  商品ID
+ (void)getGoodsComment:(NSInteger)goods_id commentType:(NSInteger)commentType success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSString *str = [NSString stringWithFormat:@"%ld",goods_id];
    [parameters setObject:str forKey:@"goods_id"];
    
    NSString *str2 = [NSString stringWithFormat:@"%ld",commentType];
    [parameters setObject:str2 forKey:@"commentType"];
    
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/goods/getGoodsComment"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//获取商品属性接口
//goods_id     商品ID
+ (void)goodsAttr:(NSInteger)goods_id success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSString *str = [NSString stringWithFormat:@"%ld",goods_id];
    [parameters setObject:str forKey:@"goods_id"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/goods/goodsAttr"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//获取商品详情接口
//goods_id     商品ID
+ (void)goodsInfo:(NSInteger)goods_id success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSString *str = [NSString stringWithFormat:@"%ld",goods_id];
    [parameters setObject:str forKey:@"goods_id"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/goods/goodsInfo"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
//根据规格key获取图片，库存
//kye,按顺序用下划线拼接规格ID，例：9_11_16
//商品ID
+ (void)getPricePic:(NSString*)key goods_id:(NSInteger)goods_id success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    if (kStringIsEmpty(key)) {
        [parameters setObject:key forKey:@"key"];
    }
    
    NSString *str = [NSString stringWithFormat:@"%ld",goods_id];
    [parameters setObject:str forKey:@"goods_id"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/goods/goodsInfo"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
/**
 获取商品运费接口
 @param goods_id 商品ID
 @param region_id 配送地区ID
 buy_num    购买数量，默认1
 */
+ (void)dispatching:(NSInteger)goods_id region_id:(NSInteger)region_id buy_num:(NSInteger)buy_num success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSString *str = [NSString stringWithFormat:@"%ld",goods_id];
    [parameters setObject:str forKey:@"goods_id"];
    
    NSString *str2 = [NSString stringWithFormat:@"%ld",region_id];
    [parameters setObject:str2 forKey:@"region_id"];
    
    NSString *str3 = [NSString stringWithFormat:@"%ld",buy_num];
    [parameters setObject:str3 forKey:@"buy_num"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/goods/dispatching"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//分类列表接口
+ (void)categoryList:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/goods/categoryList"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
@end
