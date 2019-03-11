//
//  ZFHomeSpikeHeadView.h
//  ZF
//
//  Created by apple on 2019/3/4.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@protocol ZFHomeSpikeHeadViewDelegate <NSObject>


@optional
/**
 首页秒杀headview被点击
 */
- (void)ZFHomeSpikeHeadViewDidClick;

@end


/**
 首页秒杀headview
 */
@interface ZFHomeSpikeHeadView : UICollectionReusableView

@property (nonatomic, weak) id<ZFHomeSpikeHeadViewDelegate> delegate;

@property (nonatomic, strong) NSString* timeString;

@end

NS_ASSUME_NONNULL_END
