//
//  ZFOrdersModel.h
//  ZF
//
//  Created by weiming zhang on 2019/4/26.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFOrdersModel : NSObject
@property (nonatomic, copy)NSString *address_id;
@property (nonatomic, copy)NSString *invoice_title;
@property (nonatomic, copy)NSString *taxpayer;
@property (nonatomic, copy)NSString *invoice_desc;
@property (nonatomic, assign)NSInteger coupon_id;
@property (nonatomic, assign)NSInteger pay_points;
@property (nonatomic, copy)NSString *user_money;
@property (nonatomic, copy)NSString *user_note;
@property (nonatomic, copy)NSString *pay_pwd;
@property (nonatomic, assign)NSInteger goods_id;
@property (nonatomic, assign)NSInteger goods_num;
@property (nonatomic, assign)NSInteger item_id;
@property (nonatomic, assign)NSInteger action;
@property (nonatomic, assign)NSInteger shop_id;
@property (nonatomic, assign)NSInteger take_time;
@property (nonatomic, copy)NSString *consignee;
@property (nonatomic, copy)NSString *mobile;
@property (nonatomic, assign)NSInteger act;
@property (nonatomic, assign)NSInteger prom_type;
@property (nonatomic, assign)NSInteger prom_id;

@property (nonatomic, assign)NSInteger coupon_num;
@property (nonatomic, copy)NSString *alipay;
@property (nonatomic, copy)NSString *bank_name;
@property (nonatomic, copy)NSString *bank_card;
@property (nonatomic, copy)NSString *goods_name;
@property (nonatomic, copy)NSString *final_price;
@property (nonatomic, copy)NSString *spec_key;
@property (nonatomic, copy)NSString *spec_key_name;
@property (nonatomic, copy)NSString *original_img;
@end

NS_ASSUME_NONNULL_END
