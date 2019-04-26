//
//  http_ groupbuy.h
//  ZF
//
//  Created by weiming zhang on 2019/4/26.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpTool.h"
#import "ZFGoodModel.h"
#import "ZFAddressModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface http__groupbuy : NSObject
//拼团详情
//团购商品详情接口
// order_id   拼团活动ID
+ (void)detail:(NSInteger)order_id success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//拼团列表接口
+ (void)grouplist:(ZFGoodModel*)goodModel success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

/**
 提交拼团订单
 @param address_id 收货地址id
 @param invoice_title 发票抬头
 */
+ (void)falceOrder:(NSString*)address_id invoice_title:(NSString*)invoice_title addressModel:(ZFAddressModel*)addressModel success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//获取正在开团的前5人 ## 结束时间升序
//team_id   开团活动ID
+ (void)getTeamFive:(NSInteger)team_id success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

@end

NS_ASSUME_NONNULL_END
