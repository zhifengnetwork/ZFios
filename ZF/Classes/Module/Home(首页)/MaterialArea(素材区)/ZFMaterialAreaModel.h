//
//  ZFMaterialAreaModel.h
//  ZF
//
//  Created by admin on 2019/5/16.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFMaterialAreaModel : NSObject

@property (nonatomic , copy)NSString *material_id;
@property (nonatomic , copy)NSString *title;
@property (nonatomic , copy)NSString *keywords;
@property (nonatomic , copy)NSString *add_time;
@property (nonatomic , copy)NSString *describe;
@property (nonatomic , copy)NSString *thumb;

@end

@interface ZFMaterialListModel : NSObject

@property (nonatomic, strong)NSMutableArray *list;

@end

NS_ASSUME_NONNULL_END
