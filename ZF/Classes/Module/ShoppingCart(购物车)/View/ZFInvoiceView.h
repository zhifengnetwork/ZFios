//
//  ZFInvoiceView.h
//  ZF
//
//  Created by weiming zhang on 2019/5/15.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFInvoiceView : UIView

@property (nonatomic, strong)NSArray *invoiceArray;
@property (nonatomic, getter=isinvoice)BOOL isInvoice;
@end

NS_ASSUME_NONNULL_END
