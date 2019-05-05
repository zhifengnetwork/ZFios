//
//  ZFMyWalletButton.h
//  ZF
//
//  Created by weiming zhang on 2019/3/21.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZFMyWalletButton : UIButton

- (void)buttonWithString: (NSString *)string1 WithString2: (NSString *)string2 WithState: (BOOL)isAdd;

- (void)changeType: (NSInteger)type;
@end
