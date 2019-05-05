//
//  ZFAccountModificationVC.h
//  ZF
//
//  Created by apple on 2019/2/27.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UserInfoModel;

NS_ASSUME_NONNULL_BEGIN


/**
 账号修改
 */
@interface ZFAccountModificationVC : UIViewController

@property (nonatomic, strong) UserInfoModel* userInfo;

@end

NS_ASSUME_NONNULL_END
