//
//  ZFUserModel.h
//  ZF
//
//  Created by weiming zhang on 2019/4/26.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFUserModel : NSObject

@property (nonatomic, copy)NSString *head_pic;
@property (nonatomic, copy)NSString *nickname;

@property (nonatomic, copy)NSString *mobile;
@property (nonatomic, assign)NSInteger sex;
@property (nonatomic, copy)NSString *birthyear;
@property (nonatomic, copy)NSString *birthmonth;
@property (nonatomic, copy)NSString *birthday;

@end

NS_ASSUME_NONNULL_END
