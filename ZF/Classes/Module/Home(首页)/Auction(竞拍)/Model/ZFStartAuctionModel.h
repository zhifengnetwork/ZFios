//
//  ZFStartAuctionModel.h
//  ZF
//
//  Created by admin on 2019/4/29.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZFStartAuctionModel : NSObject

//报名人数
@property (nonatomic, copy)NSString *buy_num;
//出价条数
@property (nonatomic, copy)NSString *price_num;
//竞价信息列表
@property (nonatomic, strong)NSArray* max_price;

@end


NS_ASSUME_NONNULL_END
