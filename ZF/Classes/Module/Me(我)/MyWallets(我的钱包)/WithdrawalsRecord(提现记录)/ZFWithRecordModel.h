//
//  ZFWithRecordModel.h
//  ZF
//
//  Created by admin on 2019/5/20.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFWithRecordModel : NSObject

@property (nonatomic , copy)NSString *ID;
@property (nonatomic , copy)NSString *money;
@property (nonatomic , copy)NSString *create_time;
@property (nonatomic , copy)NSString *check_time;
@property (nonatomic , copy)NSString *pay_time;
@property (nonatomic , copy)NSString *refuse_time;
@property (nonatomic , copy)NSString *bank_name;
@property (nonatomic , copy)NSString *bank_card;
@property (nonatomic , copy)NSString *realname;
@property (nonatomic , copy)NSString *remark;
@property (nonatomic , copy)NSString *taxfee;
//状态：-2删除作废-1审核失败0申请中1审核通过2付款成功3付款失败
@property (nonatomic , copy)NSString *status;
@property (nonatomic , copy)NSString *pay_code;
@property (nonatomic , copy)NSString *error_code;

//获取提现状态：-2删除作废-1审核失败0申请中1审核通过2付款成功3付款失败
-(NSString*)getCashText;

@end

@interface ZFWithRecordListModel : NSObject

@property (nonatomic, strong)NSMutableArray *list;

@end

NS_ASSUME_NONNULL_END
