//
//  ZFPersonalVC.h
//  ZF
//
//  Created by apple on 2019/3/11.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserInfoModel.h"

NS_ASSUME_NONNULL_BEGIN

/**
 个人资料
 */
@interface ZFPersonalVC : UITableViewController

@property (nonatomic, strong) UserInfoModel *userInfo;

@end

NS_ASSUME_NONNULL_END
