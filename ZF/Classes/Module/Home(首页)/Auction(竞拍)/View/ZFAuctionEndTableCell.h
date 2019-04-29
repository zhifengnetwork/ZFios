//
//  ZFAuctionEndTableCell.h
//  ZF
//
//  Created by apple on 2019/3/4.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFdetailsModel.h"
#import "ZFStartAuctionModel.h"

NS_ASSUME_NONNULL_BEGIN

/**
 竞拍结束头部cell
 */
@interface ZFAuctionEndTableCell : UICollectionViewCell

@property (nonatomic, strong) NSString *title;

@property(nonatomic, strong) ZFdetailsModel *detailsModel;

@property(nonatomic, strong) ZFBondUserModel *bondUserModel;

@property(nonatomic, strong) ZFStartAuctionModel *startAuctionModel;

@end

NS_ASSUME_NONNULL_END
