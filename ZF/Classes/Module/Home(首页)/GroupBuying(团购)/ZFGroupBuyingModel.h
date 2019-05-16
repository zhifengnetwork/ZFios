//
//  ZFGroupBuyingModel.h
//  ZF
//
//  Created by admin on 2019/5/14.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFGroupBuyingModel : NSObject

@property (nonatomic , copy)NSString *goods_id;
@property (nonatomic , copy)NSString *goods_name;
@property (nonatomic , copy)NSString *original_img;
@property (nonatomic , copy)NSString *ID;
@property (nonatomic , copy)NSString *title;
@property (nonatomic , copy)NSString *start_time;
@property (nonatomic , copy)NSString *end_time;
@property (nonatomic , copy)NSString *item_id;
@property (nonatomic , copy)NSString *price;
@property (nonatomic , copy)NSString *goods_num;
@property (nonatomic , copy)NSString *buy_num;
@property (nonatomic , copy)NSString *order_num;
@property (nonatomic , copy)NSString *virtual_num;
@property (nonatomic , copy)NSString *rebate;
@property (nonatomic , copy)NSString *goods_price;
@property (nonatomic , copy)NSString *comment_count;
//结算
@property (nonatomic , copy)NSString *shop_price;
@property (nonatomic , copy)NSString *item;

@end


@interface ZFGroupBuyListModel : NSObject

@property (nonatomic, strong)NSMutableArray *list;

@end

NS_ASSUME_NONNULL_END
