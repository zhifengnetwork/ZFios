//
//  WXPayModel.h
//  ZF
//
//  Created by weiming zhang on 2019/5/28.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WXPayModel : NSObject

@property (nonatomic, strong) NSString *appid;
@property (nonatomic, strong) NSString *partnerid;
@property (nonatomic, strong) NSString *prepayid;
@property (nonatomic, strong) NSString *noncestr;
@property (nonatomic, assign) UInt32 timestamp;
@property (nonatomic, strong) NSString *sign;
@property (nonatomic, strong) NSString *packageValue;

+ (instancetype)payModelWithDic: (NSDictionary *)dic;
@end

NS_ASSUME_NONNULL_END
