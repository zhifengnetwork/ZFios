//
//  ZFAddressEditModel.h
//  ZF
//
//  Created by admin on 2019/5/7.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFAddressServerModel : NSObject

@property (nonatomic , copy) NSString *ID;
@property (nonatomic , copy) NSString *name;

@end


@interface ZFAddressEditModel : NSObject
//订单详情
@property (nonatomic , copy) NSString *seller_id;
@property (nonatomic , copy) NSString *order_sn;
@property (nonatomic , assign)NSInteger order_id;
@property (nonatomic , assign)NSInteger order_status;
@property (nonatomic , assign)NSInteger shipping_status;
@property (nonatomic , assign)NSInteger pay_status;
@property (nonatomic , copy)NSString* total_amount;
@property (nonatomic , copy)NSString* shipping_price;
@property (nonatomic , copy)NSString* sign_price;
@property (nonatomic , assign)NSInteger pay_time;
@property (nonatomic , assign)NSInteger num;
@property (nonatomic , assign)NSInteger item_id;
@property (nonatomic , copy) NSString *order_prom_amount;
@property (nonatomic , copy) NSString *integral_money;
@property (nonatomic , copy) NSString *coupon_price;
@property (nonatomic , copy) NSString *user_note;
@property (nonatomic , copy) NSString *shipping_name;
@property (nonatomic , copy) NSString *goods_price;
@property (nonatomic , copy) NSString *avatar;
@property (nonatomic , copy) NSString *store_name;
@property (nonatomic , copy) NSString *pay_name;
@property (nonatomic, strong)NSMutableArray *goods;


@property (nonatomic , copy) NSString *address_id;
@property (nonatomic , copy) NSString *user_id;
@property (nonatomic , copy) NSString *consignee;
@property (nonatomic , copy) NSString *email;
@property (nonatomic , copy) NSString *country;
@property (nonatomic , copy) NSString *province;
@property (nonatomic , copy) NSString *city;
@property (nonatomic , copy) NSString *district;
@property (nonatomic , copy) NSString *twon;
@property (nonatomic , copy) NSString *address;
@property (nonatomic , copy) NSString *zipcode;
@property (nonatomic , copy) NSString *mobile;
@property (nonatomic , copy) NSString *is_default;
@property (nonatomic , copy) NSString *longitude;
@property (nonatomic , copy) NSString *latitude;
@property (nonatomic , copy) NSString *province_name;
@property (nonatomic , copy) NSString *city_name;
@property (nonatomic , copy) NSString *district_name;

@property (nonatomic, copy)NSString *label;

@end

NS_ASSUME_NONNULL_END
