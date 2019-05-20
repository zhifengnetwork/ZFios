//
//  ZFDistributeModel.h
//  ZF
//
//  Created by weiming zhang on 2019/5/20.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFMoneytotalModel : NSObject
@property (nonatomic, assign)NSInteger money_total;
@property (nonatomic, assign)NSInteger max_moneys;
@property (nonatomic, assign)NSInteger moneys;
@property (nonatomic, assign)NSInteger oldPerformance;
@end

@interface ZFLeaderModel : NSObject
@property (nonatomic, assign)NSInteger user_id;
@property (nonatomic, copy)NSString *nickname;
@end

@interface ZFDistributeModel : NSObject
@property (nonatomic, assign)NSInteger user_id;
@property (nonatomic, strong)ZFMoneytotalModel *money_total;
@property (nonatomic, strong)ZFLeaderModel* leader;
@property (nonatomic, copy)NSString* underling_number;
@end

NS_ASSUME_NONNULL_END
