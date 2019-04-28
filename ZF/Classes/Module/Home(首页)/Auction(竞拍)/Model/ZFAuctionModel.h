//
//  ZFAuctionModel.h
//  ZF
//
//  Created by admin on 2019/4/28.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZFAuctionModel : NSObject

//竞拍活动ID
@property (nonatomic, copy)NSString *ID;
//商品ID
@property (nonatomic, copy)NSString *goods_id;
//活动名称
@property (nonatomic, copy)NSString *activity_name;
//商品名称
@property (nonatomic, copy)NSString *goods_name;
//起拍价
@property (nonatomic, copy)NSString *start_price;
//活动开始时间
@property (nonatomic, copy)NSString *start_time;
//活动结束时间
@property (nonatomic, copy)NSString *end_time;
//商品图片
@property (nonatomic, copy)NSString *original_img;

@end

@interface ZFAuctionListModel : BaseListModel


@end

NS_ASSUME_NONNULL_END
