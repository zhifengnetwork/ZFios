//
//  ZFSeeParagraphVC.h
//  ZF
//
//  Created by admin on 2019/5/16.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZFDistribuCommModel.h"

NS_ASSUME_NONNULL_BEGIN

/**
 查看同款
 */
@interface ZFSeeParagraphVC : UIViewController

@property (nonatomic, strong) ZFDistribuCommModel* distribuCommModel;

@property (nonatomic, strong) NSString *ID;

@end

NS_ASSUME_NONNULL_END
