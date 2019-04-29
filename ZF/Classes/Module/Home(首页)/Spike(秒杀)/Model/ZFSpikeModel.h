//
//  ZFSpikeModel.h
//  ZF
//
//  Created by admin on 2019/4/29.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFSpikeModel : NSObject

@property (nonatomic , copy) NSString              *ID;
@property (nonatomic , copy) NSString              * title;
@property (nonatomic , assign) NSInteger              goods_id;
@property (nonatomic , assign) NSInteger              item_id;
@property (nonatomic , assign) NSInteger              price;
@property (nonatomic , assign) NSInteger              goods_num;
@property (nonatomic , assign) NSInteger              order_num;
@property (nonatomic , assign) NSInteger              start_time;
@property (nonatomic , assign) NSInteger              end_time;
@property (nonatomic , copy) NSString              * goods_name;
@property (nonatomic , assign) NSInteger              is_on_sale;
@property (nonatomic , assign) NSInteger              is_end;
@property (nonatomic , assign) NSInteger              store_count;
@property (nonatomic , assign) NSInteger              sales_sum;
@property (nonatomic , copy) NSString              * shop_price;
@property (nonatomic , copy) NSString              * original_img;
@property (nonatomic , copy) NSString              * disc;
@property (nonatomic , copy) NSString              * goods_content;

//商品图片数组
@property (nonatomic, strong)NSArray* goods_images;

@end

NS_ASSUME_NONNULL_END
