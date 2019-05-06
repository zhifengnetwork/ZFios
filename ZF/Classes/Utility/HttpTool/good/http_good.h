//
//  http_good.h
//  ZF
//
//  Created by weiming zhang on 2019/4/26.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpTool.h"
#import "ZFGoodModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface http_good : NSObject
//获取商品规格接口
//goods_id     商品ID
+ (void)goodsSpec:(NSInteger)goods_id success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//获取商品评论接口
//goods_id  商品ID
+ (void)getGoodsComment:(NSInteger)goods_id commentType:(NSInteger)commentType success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//获取商品属性接口
//goods_id     商品ID
+ (void)goodsAttr:(NSInteger)goods_id success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//获取商品详情接口
//goods_id     商品ID
+ (void)goodsInfo:(NSInteger)goods_id success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

/**
 获取商品运费接口
 @param goods_id 商品ID
 @param region_id 配送地区ID
 */
+ (void)dispatching:(NSInteger)goods_id region_id:(NSInteger)region_id goodModel:(ZFGoodModel*)goodModel success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//分类列表接口
+ (void)categoryList:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;
@end

NS_ASSUME_NONNULL_END
