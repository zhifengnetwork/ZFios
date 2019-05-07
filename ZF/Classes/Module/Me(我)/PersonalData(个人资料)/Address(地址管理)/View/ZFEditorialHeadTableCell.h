//
//  ZFEditorialHeadTableCell.h
//  ZF
//
//  Created by apple on 2019/3/12.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZFEditorialHeadTableCellDelegate <NSObject>

@optional

//正在输入中
-(void)ZFEditorialHeadTableCellInputing:(NSString*)text indexPath:(NSIndexPath*)indexPath;

@end

/**
 编辑收货人cell
 */
@interface ZFEditorialHeadTableCell : UITableViewCell

@property (nonatomic, weak) id<ZFEditorialHeadTableCellDelegate> delegate;
@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *name;

@end

NS_ASSUME_NONNULL_END
