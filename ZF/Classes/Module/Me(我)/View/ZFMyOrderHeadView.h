//
//  ZFMyOrderHeadView.h
//  ZF
//
//  Created by apple on 08/03/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCollectionHeadView.h"


NS_ASSUME_NONNULL_BEGIN

/**
 我订单HeadView
 */
@interface ZFMyOrderHeadView : BaseCollectionHeadView

//左标题
@property (nonatomic, strong) NSString *leftTitle;

//右标题
@property (nonatomic, strong) NSString *rightTitle;

@end

NS_ASSUME_NONNULL_END
