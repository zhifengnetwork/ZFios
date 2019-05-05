//
//  ZFCouponCell.h
//  ZF
//
//  Created by weiming zhang on 2019/3/21.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFUserModel.h"

@interface ZFCouponCell : UITableViewCell
- (void)setCellType: (NSInteger )type;

//@property (nonatomic, assign)NSInteger type;
@property (nonatomic, strong)ZFUserModel *couponModel;
@end
