//
//  http_activity.h
//  ZF
//
//  Created by weiming zhang on 2019/4/26.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpTool.h"
#import "ZFGoodModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface http_activity : NSObject

/**
 //获取抢购活动列表接口
 @param start_time 开始时间
 @param end_time 结束时间
 */
+ (void)flash_sale_list:(NSInteger)start_time end_time:(NSInteger)end_time goodModel:(ZFGoodModel*)goodModel success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//获取抢购活动时间列表
+ (void)get_flash_sale_time:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//获取抢购活动详情接口
//ID  抢购活动ID
+ (void)flash_sale_info:(NSString*)ID success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

/**
 提交抢购订单
 @param ID 抢购活动ID
 @param address_id 地址ID
 */
+ (void)post_flash_sale:(NSInteger)ID address_id:(NSInteger)address_id success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//竞拍列表
+ (void)auction_list:(ZFGoodModel*)goodModel success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//竞拍详情
//用户注册接口
+ (void)auction_detail:(NSInteger)ID success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;
@end

NS_ASSUME_NONNULL_END
