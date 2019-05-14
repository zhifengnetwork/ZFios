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
 buy_num    购买数量，默认1
 */
+ (void)dispatching:(NSInteger)goods_id region_id:(NSInteger)region_id buy_num:(NSInteger)buy_num success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//根据规格key获取图片，库存
//kye,按顺序用下划线拼接规格ID，例：9_11_16
//商品ID
+ (void)getPricePic:(NSString*)key goods_id:(NSInteger)goods_id success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;
//分类列表接口
+ (void)categoryList:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//团购商品列表
+ (void)activityGroupList:(NSString*)type page:(NSInteger)page success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

 
@end

NS_ASSUME_NONNULL_END
