//
//  ZFEditorialConsigneeVC.h
//  ZF
//
//  Created by apple on 2019/3/12.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFAddressEditModel.h"


NS_ASSUME_NONNULL_BEGIN

/**
 编辑收货人
 */
@interface ZFEditorialConsigneeVC : UITableViewController

@property (nonatomic, strong)  ZFAddressEditModel *addressEditModel;

//1.编辑 2.添加
@property (nonatomic, strong) NSString * type;

@end

NS_ASSUME_NONNULL_END
