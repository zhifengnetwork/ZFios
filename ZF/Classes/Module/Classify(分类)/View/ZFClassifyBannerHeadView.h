//
//  ZFClassifyBannerHeadView.h
//  ZF
//
//  Created by apple on 29/03/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


/**
 分类轮播view
 */
@interface ZFClassifyBannerHeadView : UICollectionReusableView

/* 轮播图数组 */
@property (copy , nonatomic)NSArray *imageUrls;

@end

NS_ASSUME_NONNULL_END
