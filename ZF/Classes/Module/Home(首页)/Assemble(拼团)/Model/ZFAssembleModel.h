//
//  ZFAssembleModel.h
//  ZF
//
//  Created by admin on 2019/4/27.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZFAssembleModel : NSObject

//拼团活动ID
@property (nonatomic, assign)NSInteger team_id;
//拼团活动名称
@property (nonatomic, copy)NSString *act_name;
//商品ID
@property (nonatomic, assign)NSInteger goods_id;
//商品名称
@property (nonatomic, assign)NSInteger goods_name;
//拼团价格
@property (nonatomic, copy)NSString *group_price;
//开始时间
@property (nonatomic, copy)NSString *start_time;
//结束时间
@property (nonatomic, copy)NSString *end_time;
//已拼多少件
@property (nonatomic, copy)NSString *sales_sum;
//拼团人数：0默认不限制
@property (nonatomic, copy)NSString *group_number;
//购买数量：0默认不限制
@property (nonatomic, copy)NSString *purchase_qty;
//本店价
@property (nonatomic, copy)NSString *shop_price;
//市场价
@property (nonatomic, copy)NSString *market_price;
//商品上传原始图
@property (nonatomic, copy)NSString *original_img;

@end

@interface ZFAssembleListModel : BaseListModel

@end

NS_ASSUME_NONNULL_END
