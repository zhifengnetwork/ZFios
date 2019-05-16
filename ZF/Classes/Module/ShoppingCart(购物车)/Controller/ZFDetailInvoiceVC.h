//
//  ZFDetailInvoiceVC.h
//  ZF
//
//  Created by weiming zhang on 2019/5/15.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZFDetailInvoiceVC;
@protocol ZFDetailInvoiceVCDelegate <NSObject>

- (void)invoice: (NSArray *_Nonnull)invoiceArray;

@end
NS_ASSUME_NONNULL_BEGIN

@interface ZFDetailInvoiceVC : UIViewController
//选择发票类型

@property (nonatomic, weak) id <ZFDetailInvoiceVCDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
