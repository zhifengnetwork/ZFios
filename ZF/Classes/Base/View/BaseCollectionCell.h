//
//  BaseCollectionCell.h
//  ZF
//
//  Created by apple on 15/03/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//
@interface BaseCollectionCell : UICollectionViewCell

- (void)setup;

//头（左边）
@property (nonatomic, assign) BOOL isHead;
//尾（右边）
@property (nonatomic, assign) BOOL isFoot;

@end

NS_ASSUME_NONNULL_END
