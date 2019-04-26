//
//  http_shopping.h
//  ZF
//
//  Created by admin on 2019/4/1.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpTool.h"

NS_ASSUME_NONNULL_BEGIN

@interface http_shopping : NSObject

//购物车列表
+(void)cartlist:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;


/**
 删除购物车的商品
 */
+(void)delcart:(NSString *)ID success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//勾选购物车商品，并返回计算结果
//ID  商品id
//selected   是否选中（1为选中）
+(void)AsyncUpdateCart:(NSInteger)ID selected:(NSString*)selected success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

/**
 购物车加减
 @param ID 当前商品购物车id
 @param goods_num 数量
 */
+(void)changeNum:(NSInteger)ID goods_num:(NSInteger)goods_num success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//购物车全选或取消全选
//all_flag  标识 1全选 2不全选
+(void)selectedOrAll:(NSInteger)all_flag success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;
@end

NS_ASSUME_NONNULL_END
