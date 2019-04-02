//
//  ZFShoppingModel.h
//  ZF
//
//  Created by admin on 2019/4/1.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFShoppingModel : NSObject

//id
@property (nonatomic, copy) NSString* ID;
//用户id
@property (nonatomic , assign) NSInteger user_id;
//商品id
@property (nonatomic , assign) NSInteger goods_id;
//商品编号
@property (nonatomic , copy) NSString *goods_sn;
//商品名称
@property (nonatomic , copy) NSString *goods_name;
//商品上传原始图
@property (nonatomic , copy) NSString *original_img;
//商品规格名称
@property (nonatomic , copy) NSString *spec_key_name;
//库存数量
@property (nonatomic , copy) NSString *store_count;
//商品数量
@property (nonatomic , copy) NSString *goods_num;
//商品简单描述
@property (nonatomic , copy) NSString *goods_remark;

@end

NS_ASSUME_NONNULL_END
