//
//  ZFBannerHeadView.h
//  ZF
//
//  Created by apple on 27/02/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


/**
 头部轮播图
 */
@interface ZFBannerHeadView : UICollectionReusableView

/* 轮播图数组 */
@property (copy , nonatomic)NSArray *imageUrls;

@end

NS_ASSUME_NONNULL_END
