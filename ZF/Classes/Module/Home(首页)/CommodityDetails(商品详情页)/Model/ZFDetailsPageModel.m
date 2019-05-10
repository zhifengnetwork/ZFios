//
//  ZFDetailsPageModel.m
//  ZF
//
//  Created by admin on 2019/5/10.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFDetailsPageModel.h"

@implementation ZFDetailsPageModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"ID":@"id"
             };
}

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"goods":@"ZFGoodsModel"
             };
}

@end

@implementation ZFDetailListModel

@end

@implementation ZFGoodsModel

@end

