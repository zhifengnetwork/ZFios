
//
//  ZFDetailDistbModel.m
//  ZF
//
//  Created by weiming zhang on 2019/5/20.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFDetailDistModel.h"

@implementation ZFDetailDistModel
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"goods" : @"ZFOrdersModel"
             };
}
@end

@implementation ZFDetailDistListModel
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"list" : @"ZFDetailDistModel"
             };
}
@end
