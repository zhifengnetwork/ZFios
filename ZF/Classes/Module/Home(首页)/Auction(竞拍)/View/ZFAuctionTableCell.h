//
//  ZFAuctionTableCell.h
//  ZF
//
//  Created by apple on 2019/3/4.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFAuctionModel.h"

NS_ASSUME_NONNULL_BEGIN

/**
 竞拍cell
 */
@interface ZFAuctionTableCell : UITableViewCell

@property(nonatomic, strong) ZFAuctionModel *auctionModel;

@end

NS_ASSUME_NONNULL_END
