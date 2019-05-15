//
//  ZFBalanceControllerCell.h
//  ZF
//
//  Created by admin on 2019/5/15.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCollectionCell.h"
#import "UserInfoModel.h"

NS_ASSUME_NONNULL_BEGIN

/**
 余额CollectionViewCell
 */
@interface ZFBalanceControllerCell : BaseCollectionCell

@property (nonatomic, strong) UserInfoModel *userInfo;

@end

NS_ASSUME_NONNULL_END
