//
//  ZFDetailsImageTextHeadView.h
//  ZF
//
//  Created by apple on 28/03/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZFDetailsImageTextHeadViewDelegate <NSObject>

@optional

/**
 *  图文详情head被点击
 *
 *  @param type 图文详情 or 答疑
 */
- (void)ZFDetailsImageTextHeadViewDidClick:(NSString*)type;

@end


/**
 图文详情head
 */
@interface ZFDetailsImageTextHeadView : UIView

@property (nonatomic, weak) id <ZFDetailsImageTextHeadViewDelegate> delegate;
@property (nonatomic, assign) BOOL isShowIt;

@end

NS_ASSUME_NONNULL_END
