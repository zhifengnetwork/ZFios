//
//  ZFGroupBuyingVC.h
//  ZF
//
//  Created by admin on 2019/5/14.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFGroupBuyingModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZFGroupBuyingVC : UIViewController

@property (nonatomic, strong) ZFGroupBuyingModel* groupBuyingModel;

//排序类型，new：最新，comment：评论，默认空
@property (nonatomic , strong)NSString *type;

@end

NS_ASSUME_NONNULL_END
