//
//  ZFTeamListVC.h
//  ZF
//
//  Created by weiming zhang on 2019/5/20.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 团队列表
 */
@interface ZFTeamListVC : UIViewController

@property (nonatomic, copy)NSString *nickname;
@property (nonatomic, assign)NSInteger user_id;

@property (nonatomic, assign)NSInteger next_user_id;

@end

NS_ASSUME_NONNULL_END
