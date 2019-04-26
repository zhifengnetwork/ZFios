//
//  http_address.h
//  ZF
//
//  Created by weiming zhang on 2019/4/26.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpTool.h"
#import "ZFAddressModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface http_address : NSObject
//地址管理列表
+ (void)address_list:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//用户删除地址接口
// ID   地址id
+ (void)del_address:(NSInteger)ID success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

/**
 //修改地址
 //用户注册接口
 @param ID 地址id
 @param consignee 收货人
 @param mobile 手机号
 @param province 省份
 @param city 城市
 @param district 地区
 @param address 详细地址
 */
+ (void)edit_address:(NSInteger)ID consignee:(NSString*)consignee mobile:(NSString*)mobile province:(NSInteger)province city:(NSInteger)city district:(NSInteger)district address:(NSString*)address addressModel:(ZFAddressModel*)addressModel success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

/**
 用户添加地址接口
 @param consignee 收货人
 @param mobile 手机号
 @param province 省份
 @param city 城市
 @param district 地区
 @param address 详细地址
 */
+ (void)add_address:(NSString*)consignee mobile:(NSString*)mobile province:(NSInteger)province city:(NSInteger)city district:(NSInteger)district address:(NSString*)address addressModel:(ZFAddressModel*)addressModel success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//三级联动接口
//ID    父级ID
+ (void)get_region:(ZFAddressModel*)addressModel success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;
@end

NS_ASSUME_NONNULL_END
