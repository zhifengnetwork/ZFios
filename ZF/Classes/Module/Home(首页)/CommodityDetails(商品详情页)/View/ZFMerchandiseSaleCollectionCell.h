//
//  ZFMerchandiseSaleCollectionCell.h
//  ZF
//
//  Created by admin on 2019/3/26.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFGroupBuyingModel.h"
NS_ASSUME_NONNULL_BEGIN

/**
 在售商品cell
 */
@interface ZFMerchandiseSaleCollectionCell : UICollectionViewCell

@property (nonatomic, strong)ZFGroupBuyingModel *goodModel;
@end

NS_ASSUME_NONNULL_END
