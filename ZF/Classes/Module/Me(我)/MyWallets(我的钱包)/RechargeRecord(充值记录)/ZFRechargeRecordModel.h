//
//  ZFRechargeRecordModel.h
//  ZF
//
//  Created by admin on 2019/5/18.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFRechargeRecordModel : NSObject

@property (nonatomic , copy)NSString *order_id;
@property (nonatomic , copy)NSString *user_id;
@property (nonatomic , copy)NSString *nickname;
@property (nonatomic , copy)NSString *order_sn;
@property (nonatomic , copy)NSString *account;
@property (nonatomic , copy)NSString *ctime;
@property (nonatomic , copy)NSString *pay_time;
@property (nonatomic , copy)NSString *pay_code;
@property (nonatomic , copy)NSString *pay_name;
//充值状态0:待支付 1:充值成功 2:交易关闭
@property (nonatomic , copy)NSString *pay_status;
@property (nonatomic , copy)NSString *buy_vip;

//获取充值状态0:待支付 1:充值成功 2:交易关闭
-(NSString*)getStatusText;

@end

@interface ZFRechargeRecordListModel : NSObject

@property (nonatomic, strong)NSMutableArray *list;

@end

NS_ASSUME_NONNULL_END
