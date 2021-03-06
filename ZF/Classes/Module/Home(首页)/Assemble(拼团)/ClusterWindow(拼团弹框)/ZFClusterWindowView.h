//
//  ZFClusterWindowView.h
//  ZF
//
//  Created by apple on 2019/3/6.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 拼团弹窗View
 */
@interface ZFClusterWindowView : UIView


@property (nonatomic, assign)NSInteger team_id;//拼团id
@property (nonatomic, assign)NSInteger goodID;//商品id

@property (nonatomic, strong)NSArray *teamArray;
@end


NS_ASSUME_NONNULL_END
