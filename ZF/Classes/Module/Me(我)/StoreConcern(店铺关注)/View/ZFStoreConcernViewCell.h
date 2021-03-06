//
//  ZFStoreConcernViewCell.h
//  ZF
//
//  Created by admin on 2019/3/15.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFShopModel.h"
NS_ASSUME_NONNULL_BEGIN

/**
 关注的店铺cell
 */
@interface ZFStoreConcernViewCell : UICollectionViewCell

@property (nonatomic, strong)ZFShopModel *shopModel;
@end

NS_ASSUME_NONNULL_END
