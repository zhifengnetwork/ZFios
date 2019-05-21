//
//  ZFDetailDistbModel.h
//  ZF
//
//  Created by weiming zhang on 2019/5/20.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFDetailDistModel : NSObject
@property (nonatomic, assign)NSInteger performance_id;
@property (nonatomic, assign)NSInteger user_id;
@property (nonatomic, assign)NSInteger log_id;
@property (nonatomic, assign)NSInteger pay_points;
@property (nonatomic, assign)NSInteger change_time;
@property (nonatomic, assign)NSInteger order_id;
@property (nonatomic, assign)NSInteger states;
@property (nonatomic, assign)NSInteger deleted_at;
@property (nonatomic, assign)NSInteger add_time;
@property (nonatomic, assign)NSInteger pay_time;
@property (nonatomic, strong)NSArray *goods;

@property (nonatomic,copy)NSString *money;
@property (nonatomic,copy)NSString *create_time;
@property (nonatomic,copy)NSString *note;
@property (nonatomic,copy)NSString *nickname;
@property (nonatomic,copy)NSString *mobile;

@property (nonatomic,copy)NSString *user_money;
@property (nonatomic,copy)NSString *frozen_money;
@property (nonatomic,copy)NSString *desc;
@property (nonatomic,copy)NSString *order_sn;
@property (nonatomic,copy)NSString *consignee;
@property (nonatomic,copy)NSString *total_amount;
@end

@interface ZFDetailDistListModel : NSObject
@property (nonatomic, strong)NSArray *list;

@end
NS_ASSUME_NONNULL_END
