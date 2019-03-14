//
//  ZFShoppingCartView.m
//  ZF
//
//  Created by weiming zhang on 2019/3/11.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFShoppingCartView.h"
@interface ZFShoppingCartView()
@property (weak, nonatomic) IBOutlet UIButton *allSelectButton;
@property (weak, nonatomic) IBOutlet UILabel *allMoneyLabel;

@end
@implementation ZFShoppingCartView

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setup];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setup{
    self.backgroundColor = RGBColor(230, 230, 230);
}
+ (instancetype)CartView{
    return [[[NSBundle mainBundle] loadNibNamed:@"ZFShoppingCartView" owner:self options:nil]lastObject];
}
- (IBAction)allSelect:(id)sender {
    
}

- (IBAction)buy:(id)sender {
    
}
@end
