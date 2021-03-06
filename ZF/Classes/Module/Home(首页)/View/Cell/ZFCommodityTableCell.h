//
//  ZFCommodityTableCell.h
//  ZF
//
//  Created by apple on 2019/2/27.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFDistribuCommModel.h"

NS_ASSUME_NONNULL_BEGIN

/**
 商品显示cell
 */
@interface ZFCommodityTableCell : UICollectionViewCell

@property (nonatomic, assign) BOOL isShowButton;

@property (nonatomic, strong) ZFDistribuCommModel* distribuCommModel;


@end

NS_ASSUME_NONNULL_END
