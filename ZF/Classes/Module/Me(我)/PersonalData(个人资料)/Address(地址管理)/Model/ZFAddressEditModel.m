//
//  ZFAddressEditModel.m
//  ZF
//
//  Created by admin on 2019/5/7.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFAddressEditModel.h"

@implementation ZFAddressServerModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"ID":@"id"
             };
}

@end


@implementation ZFAddressEditModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"goods":@"ZFOrdersModel"
             };
}
@end
