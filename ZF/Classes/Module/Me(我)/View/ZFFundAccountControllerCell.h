//
//  ZFFundAccountControllerCell.h
//  ZF
//
//  Created by admin on 2019/3/18.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewCell.h"
#import "UserInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

/**
 公益基金账户CollectionViewCell
 */
@interface ZFFundAccountControllerCell : BaseTableViewCell

@property (nonatomic, strong) UserInfoModel *userInfo;
@end

NS_ASSUME_NONNULL_END
