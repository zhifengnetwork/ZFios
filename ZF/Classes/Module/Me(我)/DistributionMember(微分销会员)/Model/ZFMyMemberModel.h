//
//  ZFMyMemberModel.h
//  ZF
//
//  Created by admin on 2019/5/11.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFMyMemberModel : NSObject

@property (nonatomic , copy) NSString *user_id;
@property (nonatomic , copy) NSString *nickname;
@property (nonatomic , copy) NSString *mobile;
@property (nonatomic , copy) NSString * levle_name;
@property (nonatomic , copy) NSString *money_total;

@end

NS_ASSUME_NONNULL_END
