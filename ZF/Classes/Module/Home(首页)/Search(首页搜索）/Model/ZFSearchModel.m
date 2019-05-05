//
//  ZFSearchModel.m
//  ZF
//
//  Created by admin on 2019/5/5.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFSearchModel.h"

@implementation ZFSearchModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"ID":@"id"
             };
}

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"goods_images" : @"ZFGoodsImageModel"
             };
}
@end

@implementation ZFSearchListModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"goods_list" : @"ZFSearchModel",
             @"filter_menu" : @"ZFSearchModel",
             @"filter_brand" : @"ZFSearchModel",
             @"filter_price" : @"ZFSearchModel"
             };
}

@end

@implementation ZFGoodsImageModel


@end
