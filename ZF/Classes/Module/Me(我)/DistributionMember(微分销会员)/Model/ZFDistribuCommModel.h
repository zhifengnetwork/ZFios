//
//  ZFDistribuCommModel.h
//  ZF
//
//  Created by admin on 2019/5/9.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFDistribuCommModel : NSObject

@property (nonatomic, copy)NSString *ID;

@property (nonatomic, copy)NSString *spec_id;
@property (nonatomic, copy)NSString *name;

@property (nonatomic, copy)NSString *value;
@property (nonatomic, copy)NSString *href;


@property (nonatomic, copy)NSString *goods_id;
@property (nonatomic, copy)NSString *seller_id;
@property (nonatomic, copy)NSString *cat_id;
@property (nonatomic, copy)NSString *extend_cat_id;
@property (nonatomic, copy)NSString *goods_sn;
@property (nonatomic, copy)NSString *goods_name;
@property (nonatomic, copy)NSString *store_count;
@property (nonatomic, copy)NSString *comment_count;
@property (nonatomic, copy)NSString *weight;
@property (nonatomic, copy)NSString *shop_price;
@property (nonatomic, copy)NSString *goods_remark;
@property (nonatomic, copy)NSString *original_img;
@property (nonatomic, copy)NSString *is_distribut;
@property (nonatomic, copy)NSString *is_agent;
@property (nonatomic, copy)NSString *commission_num;


@property (nonatomic, strong) NSMutableArray* item;

@end

@interface ZFDistribListModel :NSObject

@property (nonatomic, copy) NSString* now_goods;
@property (nonatomic, copy) NSString* goodsCate;
@property (nonatomic, copy) NSString* cat_id;
@property (nonatomic, copy) NSString* sort_asc;

@property (nonatomic, strong) NSMutableArray* goods_list;
@property (nonatomic, strong) NSMutableArray* filter_menu;
@property (nonatomic, strong) NSMutableArray* filter_attr;
@property (nonatomic, strong) NSMutableArray* filter_brand;
@property (nonatomic, strong) NSMutableArray* filter_price;
@property (nonatomic, strong) NSMutableArray* cateArr;

@property (nonatomic, strong) ZFDistribuCommModel* filter_spec;
@property (nonatomic, strong) ZFDistribuCommModel* filter_param;

@end

@interface ZFItemModel :NSObject

@property (nonatomic, copy) NSString* key;
@property (nonatomic, copy) NSString* val;
@property (nonatomic, copy) NSString* item;
@property (nonatomic, copy) NSString* href;

@end

NS_ASSUME_NONNULL_END
