//
//  ZFAddressModel.h
//  ZF
//
//  Created by weiming zhang on 2019/4/26.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFAddressModel : NSObject
@property (nonatomic, copy)NSString *label;
@property (nonatomic, assign)NSInteger is_default;
@property (nonatomic, copy)NSString *ID;
//拼团
@property (nonatomic, assign)NSInteger buy_type;
@property (nonatomic, assign)NSInteger team_id;
@property (nonatomic, assign)NSInteger buy_num;
@property (nonatomic, copy)NSString *user_money;
@property (nonatomic, assign)NSInteger invoice_type;
@property (nonatomic, copy)NSString *invoice_identity;
@property (nonatomic, copy)NSString *invoice_code;
@property (nonatomic, copy)NSString *user_note;
@property (nonatomic, assign)NSInteger found_id;
@end

NS_ASSUME_NONNULL_END
