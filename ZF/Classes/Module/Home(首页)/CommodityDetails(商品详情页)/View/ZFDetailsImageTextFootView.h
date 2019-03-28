//
//  ZFDetailsImageTextFootView.h
//  ZF
//
//  Created by apple on 28/03/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZFDetailsImageTextFootViewDelegate <NSObject>

@optional

/**
 *  图文详情foot被点击
 *
 */
- (void)ZFDetailsImageTextFootViewDidClick;

@end


/**
 图文详情foot
 */
@interface ZFDetailsImageTextFootView : UIView

@property (nonatomic, weak) id <ZFDetailsImageTextFootViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
