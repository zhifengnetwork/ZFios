//
//  http_order.m
//  ZF
//
//  Created by weiming zhang on 2019/4/26.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "http_order.h"

@implementation http_order

//提交订单接口
+ (void)post_order:(ZFOrderModel*)orderModel success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    if (!kStringIsEmpty(orderModel.address_id)) {
        [parameters setObject:orderModel.address_id forKey:@"address_id"];
    }
    
    if (!kStringIsEmpty(orderModel.invoice_title)) {
        [parameters setObject:orderModel.invoice_title forKey:@"invoice_title"];
    }
    
    if (!kStringIsEmpty(orderModel.taxpayer)) {
        [parameters setObject:orderModel.taxpayer forKey:@"taxpayer"];
    }
    
    if (!kStringIsEmpty(orderModel.invoice_desc)) {
        [parameters setObject:orderModel.invoice_desc forKey:@"invoice_desc"];
    }
    
    NSString *str = [NSString stringWithFormat:@"%ld",orderModel.coupon_id];
    [parameters setObject:str forKey:@"coupon_id"];
    
    NSString *str2 = [NSString stringWithFormat:@"%ld",orderModel.pay_points];
    [parameters setObject:str2 forKey:@"pay_points"];
    
    if (!kStringIsEmpty(orderModel.user_money)) {
        [parameters setObject:orderModel.user_money forKey:@"user_money"];
    }
    
    if (!kStringIsEmpty(orderModel.user_note)) {
        [parameters setObject:orderModel.user_note forKey:@"user_note"];
    }
    
    if (!kStringIsEmpty(orderModel.pay_pwd)) {
        [parameters setObject:orderModel.pay_pwd forKey:@"pay_pwd"];
    }
    
    NSString *str3 = [NSString stringWithFormat:@"%ld",orderModel.goods_id];
    [parameters setObject:str3 forKey:@"goods_id"];
    
    
    NSString *str4 = [NSString stringWithFormat:@"%ld",orderModel.goods_num];
    [parameters setObject:str4 forKey:@"goods_num"];
    
    NSString *str5 = [NSString stringWithFormat:@"%ld",orderModel.item_id];
    [parameters setObject:str5 forKey:@"item_id"];
    
    NSString *str6 = [NSString stringWithFormat:@"%ld",orderModel.action];
    [parameters setObject:str6 forKey:@"action"];
    
    NSString *str7 = [NSString stringWithFormat:@"%ld",orderModel.shop_id];
    [parameters setObject:str7 forKey:@"shop_id"];
    
    NSString *str8 = [NSString stringWithFormat:@"%ld",orderModel.take_time];
    [parameters setObject:str8 forKey:@"take_time"];
    
    if (!kStringIsEmpty(orderModel.consignee)) {
        [parameters setObject:orderModel.consignee forKey:@"consignee"];
    }
    
    if (!kStringIsEmpty(orderModel.mobile)) {
        [parameters setObject:orderModel.mobile forKey:@"mobile"];
    }
    NSString *str9 = [NSString stringWithFormat:@"%ld",orderModel.act];
    [parameters setObject:str9 forKey:@"act"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"/api/order/post_order"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}



/**
 //获取支付方式
 //用户注册接口
 @param order_id 订单ID
 @param order_sn 订单号
 */
+ (void)get_pay_way:(NSInteger)order_id order_sn:(NSString*)order_sn success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSString *str = [NSString stringWithFormat:@"%ld",order_id];
    [parameters setObject:str forKey:@"order_id"];
    
    if (!kStringIsEmpty(order_sn)) {
        [parameters setObject:order_sn forKey:@"order_sn"];
    }
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"/api/payment/get_pay_way"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
@end
