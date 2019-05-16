//
//  ZFBuyModel.h
//  ZF
//
//  Created by weiming zhang on 2019/5/16.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZFOrderModel.h"
#import "ZFAddressEditModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ZFBuyModel : NSObject
@property (nonatomic, copy)NSString *user_money;
@property (nonatomic, strong)ZFOrderModel *price;
@property (nonatomic, strong)ZFAddressEditModel *address;
@property (nonatomic, strong)NSArray *goodsinfo;

@end

NS_ASSUME_NONNULL_END
