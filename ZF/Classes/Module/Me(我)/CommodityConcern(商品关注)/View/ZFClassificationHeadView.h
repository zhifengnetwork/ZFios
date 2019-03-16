//
//  ZFClassificationHeadView.h
//  ZF
//
//  Created by admin on 2019/3/14.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZFClassificationHeadViewDelegate <NSObject>

//商品关注headview被点击 1:分类 2:有券 3:促销 4:降价 5:有货
- (void)ZFClassificationHeadViewDidClick:(int)type;

@end

/**
 商品头部
 */
@interface ZFClassificationHeadView : UICollectionReusableView

@property (nonatomic, weak) id<ZFClassificationHeadViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
