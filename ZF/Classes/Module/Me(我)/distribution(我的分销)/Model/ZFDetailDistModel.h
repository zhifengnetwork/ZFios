//
//  ZFDetailDistbModel.h
//  ZF
//
//  Created by weiming zhang on 2019/5/20.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFDetailDistModel : NSObject
@property (nonatomic, assign)NSInteger performance_id;

@property (nonatomic, assign)NSInteger user_id;
@property (nonatomic,copy)NSString *money;
@property (nonatomic,copy)NSString *create_time;
@property (nonatomic,copy)NSString *note;
@property (nonatomic, assign)NSInteger order_id;
@property (nonatomic, assign)NSInteger deleted_at;

@end

@interface ZFDetailDistListModel : NSObject
@property (nonatomic, strong)NSArray *list;

@end
NS_ASSUME_NONNULL_END
