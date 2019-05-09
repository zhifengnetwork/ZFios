//
//  ZFHomeVC.h
//  ZF
//
//  Created by apple on 27/02/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFDistribuCommModel.h"
#import "ZFGoodModel.h"

NS_ASSUME_NONNULL_BEGIN


/**
 首页
 */
@interface ZFHomeVC : UIViewController

@property (nonatomic, strong) ZFDistribuCommModel* distribuCommModel;

@property (nonatomic, strong) ZFGoodModel* goodModel;

//类型，1.推荐is_recommend，2.新品is_new，3.热卖is_hot
@property (nonatomic , strong)NSString *type;

@end

NS_ASSUME_NONNULL_END
