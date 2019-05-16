//
//  ZFCommodityInforViewCell.h
//  ZF
//
//  Created by admin on 2019/3/14.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFGoodModel.h"
NS_ASSUME_NONNULL_BEGIN


@protocol ZFCommodityInforViewCellDelegate <NSObject>

//查看同款被点击
- (void)ZFCommodityInforViewCellDidClick;

@end

/**
 商品信息cell
 */
@interface ZFCommodityInforViewCell : UICollectionViewCell

@property (nonatomic, weak) id<ZFCommodityInforViewCellDelegate> delegate;

@property (nonatomic, strong)ZFGoodModel *commodityModel;

@property (nonatomic, strong) NSString *title;
//- (void)setDelete: (BOOL)isHidden;
@end

NS_ASSUME_NONNULL_END
