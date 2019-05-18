//
//  ZFDetailBalanceVC.h
//  ETH
//
//  Created by admin on 2019/4/18.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZNEmptyDataSetTVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZFDetailBalanceVC : DZNEmptyDataSetTVC

//类型，全部all，赚取plus，消费minus；默认all
@property (nonatomic , strong)NSString *type;

@end

NS_ASSUME_NONNULL_END
