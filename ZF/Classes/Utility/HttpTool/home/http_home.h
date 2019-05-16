//
//  http_home.h
//  ZF
//
//  Created by weiming zhang on 2019/4/24.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "httpTool.h"
#import "ZFGoodModel.h"
#import "ZFUserModel.h"
#import "ZFSearchModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface http_home : NSObject

/**
 轮播-秒杀-头条接口

 @param pid 广告pid,默认9：banner轮播
 @param cat_id 文章类型ID, 默认15：智丰头条
 @param name  昵称
 */
+ (void)index:(NSInteger)pid cat_id:(NSInteger)cat_id name:(NSString *)name success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//列表产品
//分类列表产品接口
+ (void)Products:(NSString *)cat_id success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//首页点击[看相似]根据分类id跳转至商品列表页
+ (void)goodsList:(NSString*)type page:(NSInteger)page success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//上传头像接口
//image 头像
+ (void)update_head_pic:(UIImage*)image success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//个人信息修改
//修改名称
+ (void)update_username:(ZFUserModel*)usermodel success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//商品搜索列表页
// q    搜索关键字
+ (void)search:(ZFSearchModel*)searchModel success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//获取热门搜索词汇
+ (void)getHotKeywords:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//获取素材列表
+ (void)getMaterialList:(NSInteger)cid page:(NSInteger)page success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//获取素材详情
+ (void)getMaterialDetail:(NSString*)ID success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

@end

NS_ASSUME_NONNULL_END
