//
//  ZFGoodModel.m
//  ZF
//
//  Created by weiming zhang on 2019/4/26.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFGoodModel.h"
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
             
             @"goods":@"ZFdetailGoodModel",
             @"comment_fr":@"ZFGoodCommentModel"
             };
}


@end
@implementation ZFGoodListModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"list" : @"ZFGoodModel"
             };
}


@end
