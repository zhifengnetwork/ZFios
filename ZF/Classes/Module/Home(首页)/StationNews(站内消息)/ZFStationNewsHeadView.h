//
//  ZFStationNewsHeadView.h
//  ZF
//
//  Created by apple on 06/03/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZFStationNewsHeadViewDelegate <NSObject>

@optional

/**
 *  站内消息HeadView被点击
 *
 *  @param type 信息 or 公告
 */
- (void)ZFStationNewsHeadViewDidClick:(NSString*)type;

@end


/**
 站内消息头部
 */
@interface ZFStationNewsHeadView : UIView

@property (nonatomic, weak) id <ZFStationNewsHeadViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
