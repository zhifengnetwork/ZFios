//
//  http_mine.h
//  ZF
//
//  Created by weiming zhang on 2019/4/26.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpTool.h"
NS_ASSUME_NONNULL_BEGIN

@interface http_mine : NSObject
//我的钱包
+ (void)my_wallet:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//我的页面
+ (void)myIndex:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;
//余额明细接口
//type    类型，全部all，赚取plus，消费minus；默认all
+ (void)account_list:(NSString*)type success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//充值记录接口
+ (void)recharge_list:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//提现记录接口
+ (void)withdrawals_list:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//我的关注
//我关注的商品
+ (void)collect_list:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//点击关注商品
//good_id    商品id
+ (void)collect_goods:(NSInteger)goods_id success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//删除关注商品
//good_id    商品id
+ (void)del_collect_goods:(NSInteger)goods_id success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//我的足迹
+ (void)visit_log:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//足迹编辑
+ (void)del_visit_log:(NSInteger)visit_ids success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//清空全部足迹
+ (void)clear_visit_log:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//优惠券列表
//status    优惠券状态(默认0未使用，1已使用 2已过期)
+ (void)coupon_list:(NSInteger)status success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//分销会员页
//分销会员
+ (void)distribut_index:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//我的会员
+ (void)team_list:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//店铺关注列表
+ (void)getSellerCollect:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;


/**
 添加/取消店铺关注

 @param type 操作类型，1添加，0删除，默认1
 @param seller_id 店铺ID，type=1必须
 @param collect_id 关注ID，type=0必须
 */
+ (void)add_seller_collect:(NSInteger)type seller_id:(NSInteger)seller_id collect_id:(NSInteger)collect_id success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//店铺列表
+ (void)GetSellerList:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;
@end

NS_ASSUME_NONNULL_END
