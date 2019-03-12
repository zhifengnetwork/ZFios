//
//  ZFAddressManagementTableCell.h
//  ZF
//
//  Created by apple on 2019/3/12.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZFAddressManagementTableCellDelegate <NSObject>


- (void)ZFAddressManagementTableCellDidClick;

@end

/**
 地址管理cell
 */
@interface ZFAddressManagementTableCell : UITableViewCell

@property (nonatomic, weak) id<ZFAddressManagementTableCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
