//
//  ZFClassifyModel.h
//  ZF
//
//  Created by apple on 2019/4/27.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFClassifyModel : NSObject

@property (nonatomic , copy) NSString              *ID;
@property (nonatomic , copy) NSString              * name;
@property (nonatomic , copy) NSString              * mobile_name;
@property (nonatomic , assign) NSInteger              parent_id;
@property (nonatomic , copy) NSString              * parent_id_path;
@property (nonatomic , assign) NSInteger              level;
@property (nonatomic , assign) NSInteger              sort_order;
@property (nonatomic , assign) NSInteger              is_show;
@property (nonatomic , copy) NSString              * image;
@property (nonatomic , assign) NSInteger              is_hot;
@property (nonatomic , assign) NSInteger              cat_group;
@property (nonatomic , assign) NSInteger              commission_rate;

@end

NS_ASSUME_NONNULL_END
