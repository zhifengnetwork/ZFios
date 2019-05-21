//
//  ZFSeeOrderVC.h
//  ZF
//
//  Created by weiming zhang on 2019/5/21.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 查看订单
 */
@interface ZFSeeOrderVC : UIViewController

@property (nonatomic, assign)NSInteger user_id;//下级id；
@property (nonatomic, copy)NSString *name;//  下级昵称
@end

NS_ASSUME_NONNULL_END
