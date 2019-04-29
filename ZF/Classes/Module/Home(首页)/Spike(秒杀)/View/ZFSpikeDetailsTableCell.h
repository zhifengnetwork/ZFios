//
//  ZFSpikeDetailsTableCell.h
//  ZF
//
//  Created by apple on 2019/3/2.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFSpikeModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ZFSpikeDetailsTableCellDelegate <NSObject>

@optional

/**
 马上抢
 */
- (void)ZFSpikeDetailsTableCellDidClick:(ZFSpikeModel *)spikeModel;

@end

/**
 秒杀详情cell
 */
@interface ZFSpikeDetailsTableCell : UICollectionViewCell

@property (nonatomic, weak) id<ZFSpikeDetailsTableCellDelegate> delegate;

@property(nonatomic, strong) ZFSpikeModel *spikeModel;

@end

NS_ASSUME_NONNULL_END
