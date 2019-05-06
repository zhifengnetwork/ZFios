//
//  ZFShopModel.m
//  ZF
//
//  Created by weiming zhang on 2019/5/6.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFShopModel.h"
@implementation ZFShopGoodModel

@end
@implementation ZFShopModel
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"goods" : @"ZFShopGoodModel"
             };
}

@end
@implementation ZFShopListModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"list" : @"ZFShopModel"
             };
}

@end
