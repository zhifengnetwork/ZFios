//
//  ZFNoticeModel.h
//  ETH
//
//  Created by apple on 13/04/2019.
//  Copyright © 2019 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//通知公告model
@interface ZFNoticeModel : NSObject

@property (nonatomic , copy) NSString              * ID;
@property (nonatomic , copy) NSString              * uniacid;
@property (nonatomic , copy) NSString              * displayorder;
@property (nonatomic , copy) NSString              * title;
@property (nonatomic , copy) NSString              * thumb;
@property (nonatomic , copy) NSString              * link;
@property (nonatomic , copy) NSString              * detail;
@property (nonatomic , copy) NSString              * status;
@property (nonatomic , copy) NSString              * createtime;
@property (nonatomic , copy) NSString              * shopid;
@property (nonatomic , copy) NSString              * iswxapp;

@end

NS_ASSUME_NONNULL_END
