//
//  ZFDetailsPageFooterView.h
//  ZF
//
//  Created by admin on 2019/3/27.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFDetailsPageModel.h"


NS_ASSUME_NONNULL_BEGIN

/**
 详情页底部view
 */
@interface ZFDetailsPageFooterView : UIView
//商品ID
@property (nonatomic, assign)NSInteger goodID;

//商品ID
@property (nonatomic, strong)ZFDetailsPageModel* detailsPageModel;

@property (nonatomic, strong)NSString *itemID;

@end

NS_ASSUME_NONNULL_END
