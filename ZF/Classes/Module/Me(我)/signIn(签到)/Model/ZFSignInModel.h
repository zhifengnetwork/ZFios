//
//  ZFSignInModel.h
//  ZF
//
//  Created by admin on 2019/5/6.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFSignInModel : NSObject

//签到日期列表
@property (nonatomic, strong) NSMutableArray* date;
//当天是否签到
@property (nonatomic, assign) BOOL today_sign;
//当前积分
@property (nonatomic, copy) NSString* points;
//签到积分
@property (nonatomic, copy) NSString* add_point;
//连续签到几天
@property (nonatomic, copy) NSString* continue_sign;
//累计签到几天
@property (nonatomic, copy) NSString* accumulate_day;
//签到规则
@property (nonatomic, copy) NSString* note;
//是否有签到权限，1：是，0否，只有 分销 和 （购买399可以签到） 可以签到
@property (nonatomic, copy) NSString* auth;
//签到日期
@property (nonatomic, copy) NSString* time;
//代理免费次数
@property (nonatomic, copy) NSString* a;
//经销免费次数
@property (nonatomic, copy) NSString* d;


@end

NS_ASSUME_NONNULL_END
