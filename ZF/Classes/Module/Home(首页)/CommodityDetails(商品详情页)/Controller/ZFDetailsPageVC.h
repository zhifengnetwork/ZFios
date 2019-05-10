//
//  ZFDetailsPageVC.h
//  ZF
//
//  Created by admin on 2019/3/25.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFDetailsPageModel.h"

NS_ASSUME_NONNULL_BEGIN

/**
 详情页
 */
@interface ZFDetailsPageVC : UIViewController

@property (nonatomic, assign)NSInteger goods_id;
@property (nonatomic, assign)NSInteger region_id;
@property (nonatomic, strong)ZFDetailsPageModel *detailsPageModel;

@end

NS_ASSUME_NONNULL_END
