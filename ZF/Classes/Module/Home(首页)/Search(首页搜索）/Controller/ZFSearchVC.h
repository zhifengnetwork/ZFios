//
//  ZFSearchVC.h
//  ZF
//
//  Created by weiming zhang on 2019/3/30.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZFSearchModel;

@interface ZFSearchVC : UIViewController

@property (nonatomic, strong) NSString *text;

@property (nonatomic, strong) ZFSearchModel* searchModel;

@end
