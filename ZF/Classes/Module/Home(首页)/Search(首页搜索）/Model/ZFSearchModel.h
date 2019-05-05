//
//  ZFSearchModel.h
//  ZF
//
//  Created by admin on 2019/5/5.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFSearchModel : NSObject

@property (nonatomic, copy)NSString *q;
@property (nonatomic, copy)NSString *ID;
@property (nonatomic, copy)NSString *brand_id;
@property (nonatomic, copy)NSString *sort;

@property (nonatomic, copy)NSString *sort_asc;
@property (nonatomic, copy)NSString *sel;
@property (nonatomic, copy)NSString *price;
@property (nonatomic, copy)NSString *start_price;
@property (nonatomic, copy)NSString *end_price;


@property (nonatomic, copy)NSString *goods_id;
@property (nonatomic, copy)NSString *goods_name;
@property (nonatomic, copy)NSString *shop_price;
@property (nonatomic, copy)NSString *seller_id;
@property (nonatomic, copy)NSString *value;
@property (nonatomic, copy)NSString *href;
//好评数量
@property (nonatomic, copy) NSString* comment_count;
//已销售数量
@property (nonatomic, copy) NSString* sales_sum;
//商家名称
@property (nonatomic, copy) NSString* seller_name;
//商品图片
@property (nonatomic, strong) NSMutableArray* goods_images;

@end

@interface ZFSearchListModel :NSObject

@property (nonatomic, strong) NSMutableArray* goods_list;
@property (nonatomic, strong) NSMutableArray* filter_menu;
@property (nonatomic, strong) NSMutableArray* filter_brand;
@property (nonatomic, strong) NSMutableArray* filter_price;
@property (nonatomic, strong) ZFSearchModel* filter_param;
@property (nonatomic, copy) NSString* sort_asc;

@end

@interface ZFGoodsImageModel :NSObject

@property (nonatomic, copy) NSString* img_id;
@property (nonatomic, copy) NSString* goods_id;
@property (nonatomic, copy) NSString* image_url;

@end

NS_ASSUME_NONNULL_END
