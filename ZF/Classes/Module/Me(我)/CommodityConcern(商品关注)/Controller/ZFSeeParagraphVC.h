//
//  ZFSeeParagraphVC.h
//  ZF
//
//  Created by admin on 2019/5/16.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZFGoodModel.h"

NS_ASSUME_NONNULL_BEGIN

/**
 查看同款
 */
@interface ZFSeeParagraphVC : UIViewController

@property (nonatomic, strong) NSString *ID;

@property (nonatomic, strong)ZFGoodModel *commodityModel;

@end

NS_ASSUME_NONNULL_END
