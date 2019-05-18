//
//  ZFDetailBalanceModel.h
//  ZF
//
//  Created by admin on 2019/5/18.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFDetailBalanceModel : NSObject

@property (nonatomic , copy)NSString *log_id;
@property (nonatomic , copy)NSString *user_id;
@property (nonatomic , copy)NSString *user_money;
@property (nonatomic , copy)NSString *frozen_money;
@property (nonatomic , copy)NSString *pay_points;
@property (nonatomic , copy)NSString *change_time;
@property (nonatomic , copy)NSString *desc;
@property (nonatomic , copy)NSString *order_sn;
@property (nonatomic , copy)NSString *order_id;
@property (nonatomic , copy)NSString *states;
@property (nonatomic , copy)NSString *deleted_at;
@property (nonatomic , copy)NSString *change_data;

@end

@interface ZFDetailBalanceListModel : NSObject

@property (nonatomic, strong)NSMutableArray *list;

@end

NS_ASSUME_NONNULL_END
