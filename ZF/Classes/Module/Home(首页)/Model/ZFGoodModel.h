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

@interface ZFGoodModel : NSObject

@property (nonatomic, assign)NSInteger ID;
@property (nonatomic, assign)NSInteger goods_id;
@property (nonatomic, assign)NSInteger brand_id;
@property (nonatomic, assign)NSInteger commentType;
@property (nonatomic, assign)NSInteger page;
@property (nonatomic, assign)NSInteger num;
@property (nonatomic, assign)NSInteger buy_num;

@property (nonatomic, copy)NSString *spec;
@property (nonatomic, copy)NSString *attr;
@property (nonatomic, copy)NSString *sort;
@property (nonatomic, copy)NSString *sort_asc;
@property (nonatomic, copy)NSString *sel;
@property (nonatomic, copy)NSString *price;
@property (nonatomic, copy)NSString *start_price;
@property (nonatomic, copy)NSString *end_price;
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

@end

@interface ZFGoodListModel : BaseListModel

@end

NS_ASSUME_NONNULL_END
