//
//  ZFMyWalletTableCell.h
//  ZF
//
//  Created by admin on 2019/3/20.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ZFMyWalletTableCellDelegate <NSObject>

@optional

/**
 我的钱包headview被点击
 */
- (void)ZFMyWalletHeadViewDidClick;

/**
 我的钱包cell被点击
 */
- (void)ZFMyWalletTableCellDidClick:(NSIndexPath*)indexPath;

@end

/**
 我的钱包cell
 */
@interface ZFMyWalletTableCell : BaseTableViewCell

@property (nonatomic, weak) id<ZFMyWalletTableCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
