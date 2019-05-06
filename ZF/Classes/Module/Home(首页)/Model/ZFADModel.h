//
//  ZFADModel.h
//  ETH
//
//  Created by apple on 13/04/2019.
//  Copyright © 2019 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/**
 轮播图model
 */
@interface ZFADModel : NSObject

@property (nonatomic , copy) NSString              * ID;
@property (nonatomic , copy) NSString              * ad_link;
@property (nonatomic , copy) NSString              * ad_code;
@property (nonatomic , copy) NSString              * bgcolor;
@property (nonatomic , copy) NSString              * goods_id;


@end

NS_ASSUME_NONNULL_END
