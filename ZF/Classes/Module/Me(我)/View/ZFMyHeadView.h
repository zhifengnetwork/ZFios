//
//  ZFMyHeadView.h
//  ZF
//
//  Created by apple on 2019/3/8.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZFMyHeadViewDelegate <NSObject>

//我的头部headview被点击 1:头像 2:商品关注 3:店关注 4:足迹 5:签到
- (void)ZFMyHeadViewDidClick:(int)type;

@end


/**
 我的头部headview
 */
@interface ZFMyHeadView : UIView

@property (nonatomic, weak) id<ZFMyHeadViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
