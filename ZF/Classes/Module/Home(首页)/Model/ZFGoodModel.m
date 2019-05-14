//
//  ZFGoodModel.m
//  ZF
//
//  Created by weiming zhang on 2019/4/26.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFGoodModel.h"

@implementation ZFSelectFlagModel

@end

@implementation ZFCartPriceModel

@end

@implementation ZFdetailGoodModel

@end
@implementation ZFGoodModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"ID":@"id"
             };
}

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"comment_fr":@"ZFGoodCommentModel",
             @"goods_attribute":@"ZFGoodModel",
             @"attr":@"ZFGoodModel"
             };
}


@end
@implementation ZFListModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"list" : @"ZFGoodModel"
             };
}

@end
@implementation ZFGoodListModel


@end
