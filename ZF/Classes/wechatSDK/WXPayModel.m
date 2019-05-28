//
//  WXPayModel.m
//  ZF
//
//  Created by weiming zhang on 2019/5/28.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "WXPayModel.h"

@implementation WXPayModel

+ (instancetype)payModelWithDic:(NSDictionary *)dic{
    WXPayModel *model = [[WXPayModel alloc]init];
    [model setValuesForKeysWithDictionary:dic];
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end
