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
//列表产品
//分类列表产品接口
+ (void)Products:(NSString *)cat_id success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//首页点击[看相似]根据分类id跳转至商品列表页
+ (void)goodsList:(ZFGoodModel*)goodmodel success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//上传头像接口
//image 头像
+ (void)update_head_pic:(NSString*)image success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//个人信息修改
//修改名称
+ (void)update_username:(ZFUserModel*)usermodel success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//商品搜索列表页
// q    搜索关键字
+ (void)search:(NSString*)q searchModel:(ZFSearchModel*)searchModel success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;
@end

NS_ASSUME_NONNULL_END
