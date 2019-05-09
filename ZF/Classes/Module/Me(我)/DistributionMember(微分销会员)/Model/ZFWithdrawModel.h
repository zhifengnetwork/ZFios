//
//  ZFWithdrawModel.h
//  ZF
//
//  Created by admin on 2019/5/9.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFWithdrawModel : NSObject

@property (nonatomic , copy) NSString *user_money;
@property (nonatomic , copy) NSString *distribut_money;
@property (nonatomic , assign) float total_property;
@property (nonatomic , copy) NSString *alipay;
@property (nonatomic , copy) NSString *realname;
@property (nonatomic , copy) NSString *bank_name;
@property (nonatomic , copy) NSString *bank_card;
@property (nonatomic , copy) NSString *openid;
@property (nonatomic , copy) NSString *service_ratio;
@property (nonatomic , copy) NSString *min_service_money;
@property (nonatomic , copy) NSString *max_service_money;
@property (nonatomic , copy) NSString *min_cash;
@property (nonatomic , copy) NSString *max_cash;
@property (nonatomic , copy) NSString *count_cash;
@property (nonatomic , copy) NSString *cash_times;

@end

NS_ASSUME_NONNULL_END
