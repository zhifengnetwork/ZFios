//
//  ZFDetailsPageModel.h
//  ZF
//
//  Created by admin on 2019/5/10.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFDetailsPageModel : NSObject

@property (nonatomic, copy)NSString *goods_id;
@property (nonatomic, copy)NSString *seller_id;
@property (nonatomic, copy)NSString *cat_id;
@property (nonatomic, copy)NSString *extend_cat_id;
@property (nonatomic, copy)NSString *goods_sn;
@property (nonatomic, copy)NSString *goods_name;
@property (nonatomic, copy)NSString *click_count;
@property (nonatomic, copy)NSString *brand_id;
@property (nonatomic, copy)NSString *store_count;
@property (nonatomic, copy)NSString *comment_count;
@property (nonatomic, copy)NSString *weight;
@property (nonatomic, copy)NSString *volume;
@property (nonatomic, copy)NSString *market_price;
@property (nonatomic, copy)NSString *shop_price;
@property (nonatomic, copy)NSString *keywords;
@property (nonatomic, copy)NSString *goods_remark;
@property (nonatomic, copy)NSString *mobile_content;
@property (nonatomic, copy)NSString *original_img;
@property (nonatomic, copy)NSString *is_virtual;
@property (nonatomic, copy)NSString *is_distribut;
@property (nonatomic, copy)NSString *is_agent;
@property (nonatomic, copy)NSString *virtual_indate;
@property (nonatomic, copy)NSString *virtual_limit;
@property (nonatomic, copy)NSString *virtual_refund;
@property (nonatomic, copy)NSString *virtual_sales_sum;
@property (nonatomic, copy)NSString *virtual_collect_sum;
@property (nonatomic, copy)NSString *collect_sum;
@property (nonatomic, copy)NSString *is_on_sale;
@property (nonatomic, copy)NSString *is_free_shipping;
@property (nonatomic, copy)NSString *sort;
@property (nonatomic, copy)NSString *is_recommend;
@property (nonatomic, copy)NSString *is_new;
@property (nonatomic, copy)NSString *is_hot;
@property (nonatomic, copy)NSString *last_update;
@property (nonatomic, copy)NSString *goods_type;
@property (nonatomic, copy)NSString *give_integral;
@property (nonatomic, copy)NSString *exchange_integral;
@property (nonatomic, copy)NSString *suppliers_id;
@property (nonatomic, copy)NSString *sales_sum;
@property (nonatomic, copy)NSString *prom_type;
@property (nonatomic, copy)NSString *prom_id;
@property (nonatomic, copy)NSString *commission;
@property (nonatomic, copy)NSString *video;
@property (nonatomic, copy)NSString *sign_free_receive;
@property (nonatomic, copy)NSString *buy_super_nsign;
@property (nonatomic, copy)NSString *is_ground_push;
@property (nonatomic, copy)NSString *province_name;
@property (nonatomic, copy)NSString *city_name;

@property (nonatomic, copy)NSString *store_id;
@property (nonatomic, copy)NSString *store_name;
@property (nonatomic, copy)NSString *avatar;
@property (nonatomic, copy)NSString *num;

@property (nonatomic, copy)NSString *img_sum;
@property (nonatomic, copy)NSString *high_sum;
@property (nonatomic, copy)NSString *center_sum;
@property (nonatomic, copy)NSString *low_sum;
@property (nonatomic, copy)NSString *total_sum;
@property (nonatomic, copy)NSString *high_rate;
@property (nonatomic, copy)NSString *center_rate;
@property (nonatomic, copy)NSString *low_rate;

@property (nonatomic, strong) NSMutableArray* goods;

@property (strong, nonatomic)ZFDetailsPageModel *seller_info;
@property (nonatomic, copy)NSString *is_collect;
@property (nonatomic, copy)NSString *is_cart;
@property (strong, nonatomic)ZFDetailsPageModel *comment_fr;

@property (nonatomic, strong) NSMutableArray* goods_images;

@end

@interface ZFDetailListModel : NSObject

@property (strong, nonatomic)ZFDetailsPageModel *goods;
@property (nonatomic, copy)NSString *goods_content;

@end

@interface ZFGoodsModel : NSObject

@property (nonatomic, copy)NSString *goods_id;
@property (nonatomic, copy)NSString *goods_name;
@property (nonatomic, copy)NSString *shop_price;
@property (nonatomic, copy)NSString *original_img;

@end


NS_ASSUME_NONNULL_END
