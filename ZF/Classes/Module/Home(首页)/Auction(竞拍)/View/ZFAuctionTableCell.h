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

@protocol ZFAuctionTableCellDelegate <NSObject>

@optional

/**
 参与竞拍
 */
- (void)ZFAuctionTableCellDidClick:(ZFAuctionModel *)auctionModel;

@end

/**
 竞拍cell
 */
@interface ZFAuctionTableCell : UITableViewCell


@property (nonatomic, weak) id<ZFAuctionTableCellDelegate> delegate;

@property(nonatomic, strong) ZFAuctionModel *auctionModel;

@end

NS_ASSUME_NONNULL_END
