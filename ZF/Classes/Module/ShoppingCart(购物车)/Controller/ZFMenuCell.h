//
//  ZFMenuCell.h
//  ZF
//
//  Created by weiming zhang on 2019/3/13.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZFMenuCell : UITableViewCell

@property (strong, nonatomic)UILabel *showCarLabel;
@property (strong, nonatomic)UILabel *lineLabel;

- (void)configureWithStr:(NSString *)Str boundsWidth:(CGFloat)width;
@end
