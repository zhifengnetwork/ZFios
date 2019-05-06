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

/**
 商品信息cell
 */
@interface ZFCommodityInforViewCell : UICollectionViewCell

@property (nonatomic, strong)ZFGoodModel *commodityModel;

- (void)setDelete: (BOOL)isHidden;
@end

NS_ASSUME_NONNULL_END
