//
//  ZFMaterialModel.h
//  ZF
//
//  Created by admin on 2019/5/17.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//阅读区model

@interface ZFMaterialModel : NSObject

@property (nonatomic , copy)NSString *material_id;
@property (nonatomic , copy)NSString *cat_id;
@property (nonatomic , copy)NSString *title;
@property (nonatomic , copy)NSString *keywords;
@property (nonatomic , copy)NSString *add_time;
@property (nonatomic , copy)NSString *describe;
@property (nonatomic , copy)NSString *click;
@property (nonatomic , copy)NSString *video;
@property (nonatomic , copy)NSString *thumb;

@end

@interface ZFinfoModel : NSObject

@property (nonatomic , strong)ZFMaterialModel *info;
@property (nonatomic , copy)NSString *content;

@end

NS_ASSUME_NONNULL_END
