//
//  ZFDonationButtonTableCell.h
//  ZF
//
//  Created by admin on 2019/3/19.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZFDonationButtonTableCellDelegate <NSObject>

//公益基金账户被点击 1:捐赠金额 2:睡前故事 3:爱心次数
- (void)ZFDonationButtonTableCellDidClick:(int)type;

@end

/**
 捐赠金额cell
 */
@interface ZFDonationButtonTableCell : UITableViewCell

@property (nonatomic, weak) id<ZFDonationButtonTableCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
