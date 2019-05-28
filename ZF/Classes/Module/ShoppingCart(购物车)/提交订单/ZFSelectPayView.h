//
//  ZFSelectPayView.h
//  ZF
//
//  Created by weiming zhang on 2019/3/19.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXApi.h"

@interface ZFSelectPayView : UIView<UIApplicationDelegate, WXApiDelegate>
//支付方式


@property (nonatomic, copy)NSString *order_sn;
@property (nonatomic, copy)NSString* payNumber;
@end
