//
//  ZFMaterialVC.h
//  ETH
//
//  Created by apple on 2019/4/22.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFMaterialAreaModel.h"


NS_ASSUME_NONNULL_BEGIN

//阅读区
@interface ZFMaterialVC : UIViewController

@property (nonatomic, strong)ZFMaterialAreaModel *materialAreaModel;

@property (nonatomic, copy)NSString *html;

@end

NS_ASSUME_NONNULL_END
