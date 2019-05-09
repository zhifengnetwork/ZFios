//
//  ZFDistribuCommModel.m
//  ZF
//
//  Created by admin on 2019/5/9.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFDistribuCommModel.h"

@implementation ZFDistribuCommModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"ID":@"id"
             };
}

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"item" : @"ZFItemModel"
             };
}
@end

@implementation ZFDistribListModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"goods_list" : @"ZFDistribuCommModel",
             @"filter_menu" : @"ZFDistribuCommModel",
             @"filter_attr" : @"ZFDistribuCommModel",
             @"filter_brand" : @"ZFDistribuCommModel",
             @"filter_price" : @"ZFDistribuCommModel",
             @"cateArr" : @"ZFDistribuCommModel"
             };
}

@end

@implementation ZFItemModel


@end
