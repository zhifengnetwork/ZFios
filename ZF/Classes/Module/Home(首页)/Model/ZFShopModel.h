//
//  ZFShopModel.h
//  ZF
//
//  Created by weiming zhang on 2019/5/6.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseListModel.h"
NS_ASSUME_NONNULL_BEGIN
@interface ZFShopGoodModel : NSObject

//商品id
@property (nonatomic , assign) NSInteger             goods_id;
//商品名称
@property (nonatomic , copy) NSString              * goods_name;
//本店价
@property (nonatomic , copy) NSString              * shop_price;
//商品图片
@property (nonatomic , copy) NSString              * original_img;
@end

@interface ZFShopModel : NSObject
//店铺关注列表
//关注id
@property (nonatomic, assign)NSInteger             *collect_id;
//店铺id
@property (nonatomic, assign)NSInteger             *seller_id;
//店铺名称
@property (nonatomic , copy) NSString              * seller_name;
//店铺头像
@property (nonatomic , copy) NSString              * avatar;
//商品信息数组
@property (nonatomic , strong) NSArray              * goods;
@end

@interface ZFShopListModel : BaseListModel


@end
NS_ASSUME_NONNULL_END
