//
//  http_groupbuy.m
//  ZF
//
//  Created by weiming zhang on 2019/4/26.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "http_groupbuy.h"

@implementation http_groupbuy
//拼团详情
//团购商品详情接口
// order_id   拼团活动ID
+ (void)detail:(NSInteger)team_id success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSString *str = [NSString stringWithFormat:@"%ld",team_id];
    [parameters setObject:str forKey:@"team_id"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/groupbuy/detail"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//拼团列表接口
+ (void)grouplist:(NSInteger)page num:(NSInteger)num success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    [parameters setObject:[NSString stringWithFormat:@"%lu",(unsigned long)page] forKey:@"page"];
    
    [parameters setObject:[NSString stringWithFormat:@"%lu",(unsigned long)num] forKey:@"num"];

    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/groupbuy/grouplist"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

/**
 提交拼团订单
 @param address_id 收货地址id
 @param invoice_title 发票抬头
 */
+ (void)falceOrder:(NSString*)address_id invoice_title:(NSString*)invoice_title addressModel:(ZFAddressModel*)addressModel success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    if (!kStringIsEmpty(address_id)) {
        [parameters setObject:address_id forKey:@"address_id"];
    }
    
    if (!kStringIsEmpty(invoice_title)) {
        [parameters setObject:invoice_title forKey:@"invoice_title"];
    }
    
    if (!kStringIsEmpty(addressModel.user_money)) {
        [parameters setObject:addressModel.user_money forKey:@"user_money"];
    }
    
    NSString *str = [NSString stringWithFormat:@"%ld",addressModel.buy_type];
    [parameters setObject:str forKey:@"buy_type"];
    
    NSString *str2 = [NSString stringWithFormat:@"%ld",addressModel.team_id];
    [parameters setObject:str2 forKey:@"team_id"];
    
    NSString *str3 = [NSString stringWithFormat:@"%ld",addressModel.buy_num];
    [parameters setObject:str3 forKey:@"buy_num"];
    
    NSString *str4 = [NSString stringWithFormat:@"%ld",addressModel.invoice_type];
    [parameters setObject:str4 forKey:@"invoice_type"];
    
    NSString *str5 = [NSString stringWithFormat:@"%ld",addressModel.act];
    [parameters setObject:str5 forKey:@"act"];
    
    if (!kStringIsEmpty(addressModel.invoice_identity)) {
        [parameters setObject:addressModel.invoice_identity forKey:@"invoice_identity"];
    }
    
    if (!kStringIsEmpty(addressModel.invoice_code)) {
        [parameters setObject:addressModel.invoice_code forKey:@"invoice_code"];
    }
    
    if (!kStringIsEmpty(addressModel.user_note)) {
        [parameters setObject:addressModel.user_note forKey:@"user_note"];
    }
    

    NSString *str6 = [NSString stringWithFormat:@"%ld",addressModel.found_id];
    [parameters setObject:str6 forKey:@"found_id"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/groupbuy/falceOrder"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//获取正在开团的前5人 ## 结束时间升序
//team_id   开团活动ID
+ (void)getTeamFive:(NSInteger)team_id success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSString *str = [NSString stringWithFormat:@"%ld",team_id];
    [parameters setObject:str forKey:@"team_id"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/groupbuy/getTeamFive"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
@end
