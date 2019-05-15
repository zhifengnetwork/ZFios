//
//  ZFUserModel.h
//  ZF
//
//  Created by weiming zhang on 2019/4/26.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseListModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ZFUserModel : NSObject

@property (nonatomic, copy)NSString *head_pic;
@property (nonatomic, copy)NSString *nickname;

@property (nonatomic, copy)NSString *mobile;
@property (nonatomic, assign)NSInteger sex;
@property (nonatomic, copy)NSString *birthyear;
@property (nonatomic, copy)NSString *birthmonth;
@property (nonatomic, copy)NSString *birthday;

//用户优惠券id
@property (nonatomic, assign)NSInteger cid;
//优惠券名称
@property (nonatomic, copy)NSString *name;
//优惠券面值
@property (nonatomic, copy)NSString *money;
//优惠券使用条件
@property (nonatomic, copy)NSString *condition;
//优惠券开始时间
@property (nonatomic, assign)NSInteger use_start_time;
//优惠券结束时间
@property (nonatomic, assign)NSInteger use_end_time;
//优惠券使用范围
@property (nonatomic, copy)NSString *use_scope;
//优惠券兑换码
@property (nonatomic, copy)NSString *coupon_code;
@property (nonatomic, copy)NSString *invoice_no;

@property (nonatomic, strong)NSMutableArray *result;
@property (nonatomic, copy)NSString *time;
@property (nonatomic, copy)NSString *status;
@end


NS_ASSUME_NONNULL_END
