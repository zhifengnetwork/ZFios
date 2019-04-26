//
//  ZFGoodModel.h
//  ZF
//
//  Created by weiming zhang on 2019/4/26.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFGoodModel : NSObject

@property (nonatomic, assign)NSInteger ID;
@property (nonatomic, assign)NSInteger goods_id;
@property (nonatomic, assign)NSInteger brand_id;
@property (nonatomic, assign)NSInteger commentType;
@property (nonatomic, assign)NSInteger page;
@property (nonatomic, assign)NSInteger num;
@property (nonatomic, assign)NSInteger buy_num;

@property (nonatomic, copy)NSString *spec;
@property (nonatomic, copy)NSString *attr;
@property (nonatomic, copy)NSString *sort;
@property (nonatomic, copy)NSString *sort_asc;
@property (nonatomic, copy)NSString *sel;
@property (nonatomic, copy)NSString *price;
@property (nonatomic, copy)NSString *start_price;
@property (nonatomic, copy)NSString *end_price;


@end

NS_ASSUME_NONNULL_END
