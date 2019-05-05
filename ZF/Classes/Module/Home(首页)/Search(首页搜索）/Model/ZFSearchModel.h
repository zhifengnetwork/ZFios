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


//商品列表
@property (nonatomic, strong) NSArray* goods_list;
//好评数量
@property (nonatomic, copy) NSString* comment_count;
//已销售数量
@property (nonatomic, copy) NSString* sales_sum;
//商家名称
@property (nonatomic, copy) NSString* seller_name;
//商品图片
@property (nonatomic, strong) NSArray* goods_images;
//筛选分类
@property (nonatomic, strong) NSArray* filter_menu;
//筛选品牌
@property (nonatomic, strong) NSArray* filter_brand;
//筛选价格
@property (nonatomic, strong) NSArray* filter_price;
//筛选参数
@property (nonatomic, strong) NSArray* filter_param;

@end

NS_ASSUME_NONNULL_END
