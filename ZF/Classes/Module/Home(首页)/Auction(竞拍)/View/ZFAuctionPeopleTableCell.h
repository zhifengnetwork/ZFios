//
//  ZFAuctionPeopleTableCell.h
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
 竞拍人cell
 */
@interface ZFAuctionPeopleTableCell : UICollectionViewCell

@property(nonatomic, strong) ZFBondUserModel *bondUserModel;

@property(nonatomic, strong) ZFStartAuctionModel *startAuctionModel;

@end

NS_ASSUME_NONNULL_END
