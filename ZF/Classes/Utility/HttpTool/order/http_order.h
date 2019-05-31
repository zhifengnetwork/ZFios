//
//  http_order.h
//  ZF
//
//  Created by weiming zhang on 2019/4/26.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZFOrdersModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface http_order : NSObject

//提交订单接口
+ (void)post_order:(ZFOrdersModel*)orderModel success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

/**
 //获取支付方式
 //用户注册接口
 @param order_id 订单ID
 @param order_sn 订单号
 */
+ (void)get_pay_way:(NSInteger)order_id order_sn:(NSString*)order_sn success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;
@end

NS_ASSUME_NONNULL_END
