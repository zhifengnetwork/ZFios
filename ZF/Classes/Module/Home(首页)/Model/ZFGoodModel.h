//
//  ZFGoodModel.h
//  ZF
//
//  Created by weiming zhang on 2019/4/26.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseListModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ZFSelectFlagModel : NSObject
@property (nonatomic, assign)NSInteger all_flag;

@end

@interface ZFCartPriceModel : NSObject
@property (nonatomic, assign)NSInteger goods_fee;
@property (nonatomic, assign)NSInteger goods_num;
@property (nonatomic, copy)NSString *total_fee;

@end

@interface ZFdetailGoodModel : NSObject
@property (nonatomic, assign)NSInteger goods_id;
@property (nonatomic, assign)NSInteger cat_id;
@property (nonatomic, assign)NSInteger store_count;
@property (nonatomic, assign)NSInteger is_on_sale;
@property (nonatomic, copy)NSString *prom_type;
@property (nonatomic, assign)NSInteger prom_id;
@property (nonatomic, copy)NSString *goods_name;
@property (nonatomic, copy)NSString *shop_price;
@property (nonatomic, copy)NSString *original_img;
@property (nonatomic, assign)NSInteger weight;

@end
@interface ZFGoodModel : NSObject

@property (nonatomic, assign)NSInteger ID;
@property (nonatomic, assign)NSInteger goods_id;
@property (nonatomic, assign)NSInteger user_id;
@property (nonatomic, assign)NSInteger brand_id;
@property (nonatomic, assign)NSInteger commentType;
@property (nonatomic, assign)NSInteger page;
@property (nonatomic, assign)NSInteger num;
@property (nonatomic, assign)NSInteger buy_num;
@property (nonatomic, assign)NSInteger goods_num;

@property (nonatomic, copy)NSString *goods_sn;
@property (nonatomic, copy)NSString *spec;
@property (nonatomic, copy)NSString *attr;
@property (nonatomic, copy)NSString *sort;
@property (nonatomic, copy)NSString *sort_asc;
@property (nonatomic, copy)NSString *sel;
@property (nonatomic, copy)NSString *price;
@property (nonatomic, copy)NSString *start_price;
@property (nonatomic, copy)NSString *end_price;
@property (nonatomic, copy)NSString *goods_price;
//商品id
@property (nonatomic, assign)NSInteger visittime;
//足迹id
@property (nonatomic, assign)NSInteger visit_id;
//商品名称
@property (nonatomic, copy)NSString *goods_name;
//商品价格
@property (nonatomic, copy)NSString *shop_price;
@property (nonatomic, assign)NSInteger cat_id;
//评论数量
@property (nonatomic, assign)NSInteger comment_count;
//购买数量
@property (nonatomic, assign)NSInteger sales_sum;
//商品图片
@property (nonatomic, copy)NSString *original_img;
//时间
@property (nonatomic, copy)NSString *date;
//是否选中
@property (nonatomic, getter=isSelected) BOOL selected;

//关注id
@property (nonatomic, assign)NSInteger collect_id;
//收藏时间
@property (nonatomic, assign)NSInteger add_time;
// 市场价
@property (nonatomic, copy)NSString *market_price;
//库存数量
@property (nonatomic, assign)NSInteger store_count;
//关注总数
@property (nonatomic, copy)NSString *count;
//规格主名
@property (nonatomic, copy)NSString *name;
//规格次名
@property (nonatomic, copy)NSString *item;
//商品规格大项
@property (nonatomic, strong)NSArray *goods_attribute;
//attr_name（值）
@property (nonatomic, assign)NSInteger attr_id;
//商品规格小项 （通过attr_id对应上面goods_attribute中的attr_id）
@property (nonatomic, strong)NSArray *goods_attr_list;
//规格小项ID
@property (nonatomic, assign)NSInteger goods_attr_id;
//属性值
@property (nonatomic, assign)NSInteger attr_value;

//商品详情
@property (nonatomic, assign)NSInteger seller_id;
@property (nonatomic, assign)NSInteger extend_cat_id;
@property (nonatomic, copy)NSString *prom_type;
@property (nonatomic, assign)NSInteger click_count;
@property (nonatomic, assign)NSInteger weight;
@property (nonatomic, copy)NSString *volume;
@property (nonatomic, copy)NSString *price_ladder;
@property (nonatomic, copy)NSString *keywords;
@property (nonatomic, copy)NSString *goods_remark;
@property (nonatomic, copy)NSString *goods_content;
@property (nonatomic, copy)NSString *mobile_content;

@property (nonatomic, assign)NSInteger is_virtual;
@property (nonatomic, assign)NSInteger is_distribut;
@property (nonatomic, assign)NSInteger is_agent;
@property (nonatomic, assign)NSInteger virtual_indate;
@property (nonatomic, assign)NSInteger virtual_limit;
@property (nonatomic, assign)NSInteger virtual_refund;
@property (nonatomic, assign)NSInteger virtual_sales_sum;
@property (nonatomic, assign)NSInteger virtual_collect_sum;

@property (nonatomic, assign)NSInteger collect_sum;
@property (nonatomic, assign)NSInteger is_on_sale;
@property (nonatomic, assign)NSInteger is_free_shipping;
@property (nonatomic, assign)NSInteger is_recommend;
@property (nonatomic, assign)NSInteger is_new;
@property (nonatomic, assign)NSInteger is_hot;
@property (nonatomic, assign)NSInteger last_update;
@property (nonatomic, assign)NSInteger goods_type;
@property (nonatomic, assign)NSInteger give_integral;
@property (nonatomic, assign)NSInteger exchange_integral;
@property (nonatomic, assign)NSInteger suppliers_id;
@property (nonatomic, assign)NSInteger prom_id;
@property (nonatomic, copy)NSString *commission;
@property (nonatomic, copy)NSString *video;
@property (nonatomic, assign)NSInteger sign_free_receive;
@property (nonatomic, assign)NSInteger buy_super_nsign;

@property (nonatomic, strong)NSArray *seller_info;
@property (nonatomic, strong)ZFdetailGoodModel *goods;
@property (nonatomic, strong)NSArray *comment_fr;
//购物车
@property (nonatomic, copy)NSString *spec_key;
@property (nonatomic, copy)NSString *spec_key_name;
@end

@interface ZFListModel : NSObject
@property (nonatomic, strong)NSArray *list;

@property (strong, nonatomic)ZFCartPriceModel *cart_price_info;
@property (strong, nonatomic)ZFSelectFlagModel *selected_flag;
@end
@interface ZFGoodListModel : BaseListModel


@end

NS_ASSUME_NONNULL_END
