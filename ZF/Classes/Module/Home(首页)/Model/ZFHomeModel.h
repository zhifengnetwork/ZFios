//
//  ZFHomeModel.h
//  ZF
//
//  Created by admin on 2019/4/26.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFHomeModel : NSObject

//分类id
@property (nonatomic, assign)NSInteger cat_id;
//商品id
@property (nonatomic, assign)NSInteger goods_id;
//商品名称
@property (nonatomic, assign)NSInteger goods_name;
//商品上传原始图
@property (nonatomic, copy)NSString *original_img;

@end

@interface ZFHomeDataModel : NSObject

@property (nonatomic , strong) NSMutableArray * slide;
@property (nonatomic , strong) NSMutableArray * notice;

@end


NS_ASSUME_NONNULL_END
