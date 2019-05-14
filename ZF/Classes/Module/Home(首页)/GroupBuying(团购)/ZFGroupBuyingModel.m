//
//  ZFGroupBuyingModel.m
//  ZF
//
//  Created by admin on 2019/5/14.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFGroupBuyingModel.h"

@implementation ZFGroupBuyingModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"ID":@"id"
             };
}

@end

@implementation ZFGroupBuyListModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"list":@"ZFGroupBuyingModel"
             };
}

@end

