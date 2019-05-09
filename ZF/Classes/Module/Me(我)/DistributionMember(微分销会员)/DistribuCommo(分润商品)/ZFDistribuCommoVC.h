//
//  ZFDistribuCommoVC.h
//  ZF
//
//  Created by admin on 2019/5/9.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFDistribuCommModel.h"
#import "ZFGoodModel.h"

NS_ASSUME_NONNULL_BEGIN

/**
 分润商品
 */
@interface ZFDistribuCommoVC : UITableViewController

@property (nonatomic, strong) ZFDistribuCommModel* distribuCommModel;

@property (nonatomic, strong) ZFGoodModel* goodModel;

@end

NS_ASSUME_NONNULL_END
