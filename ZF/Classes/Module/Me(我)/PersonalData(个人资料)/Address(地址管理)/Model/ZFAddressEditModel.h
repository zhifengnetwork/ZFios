//
//  ZFAddressEditModel.h
//  ZF
//
//  Created by admin on 2019/5/7.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFAddressEditModel : NSObject

@property (nonatomic , copy) NSString *address_id;
@property (nonatomic , copy) NSString *user_id;
@property (nonatomic , copy) NSString *consignee;
@property (nonatomic , copy) NSString * email;
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
