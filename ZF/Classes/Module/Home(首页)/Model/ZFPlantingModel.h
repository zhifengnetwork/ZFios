//
//  ZFPlantingModel.h
//  ZF
//
//  Created by admin on 2019/4/28.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseListModel.h"

NS_ASSUME_NONNULL_BEGIN

/**
 轮播-秒杀-头条Model
 */
@interface ZFPlantingModel : NSObject

//轮播图数组
@property (nonatomic, strong) NSArray* adlist;
//轮播id
@property (nonatomic, assign)NSInteger ad_id;
//当链接地址为商品详情时返回，否则为0
@property (nonatomic, assign)NSInteger goods_id;
//链接地址
@property (nonatomic, copy)NSString *ad_link;
//图片地址
@property (nonatomic, copy)NSString *ad_code;
//背景颜色
@property (nonatomic, copy)NSString *bgcolor;
//文章数组
@property (nonatomic, strong)NSArray* articlelist;
//文章id
@property (nonatomic, assign)NSInteger article_id;
//标题
@property (nonatomic, copy)NSString *title;
//链接地址，为空则请求文章内容接口
@property (nonatomic, copy)NSString *link;
//当前时段秒杀商品列表
@property (nonatomic, strong) NSArray* flash_sale_goods;
//活动ID
@property (nonatomic, copy)NSString *ID;
//对应spec_goods_price商品规格id
@property (nonatomic, copy)NSString *item_id;
//活动价格
@property (nonatomic, copy)NSString *price;
//商品参加活动数
@property (nonatomic, copy)NSString *goods_num;
//已下单数
@property (nonatomic, copy)NSString *order_num;
//开始时间
@property (nonatomic, copy)NSString *start_time;
//结束时间
@property (nonatomic, copy)NSString *end_time;
//商品名称
@property (nonatomic, copy)NSString *goods_name;
//本店价
@property (nonatomic, copy)NSString *shop_price;
//商品图片
@property (nonatomic, copy)NSString *original_img;
//折扣
@property (nonatomic, copy)NSString *disc;

@end

@interface ZFPlantingListModel : BaseListModel

@property (nonatomic , strong) NSMutableArray * adlist;
@property (nonatomic , strong) NSMutableArray * articlelist;
@property (nonatomic , strong) NSMutableArray * flash_sale_goods;
@property (nonatomic, copy)NSString *end_time;

@end

NS_ASSUME_NONNULL_END
