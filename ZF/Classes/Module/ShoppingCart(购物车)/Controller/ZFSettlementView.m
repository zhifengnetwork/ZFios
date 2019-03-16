//
//  ZFShoppingCartView.m
//  ZF
//
//  Created by weiming zhang on 2019/3/11.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFSettlementView.h"
#import "ZFBounceView.h"
@interface ZFSettlementView()
@property (weak, nonatomic) IBOutlet UIButton *allSelectButton;
@property (weak, nonatomic) IBOutlet UILabel *allMoneyLabel;

@end
@implementation ZFSettlementView

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setup];
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setup{
    self.backgroundColor = RGBColor(230, 230, 230);
}
+ (instancetype)CartView{
    return [[[NSBundle mainBundle] loadNibNamed:@"ZFSettlementView" owner:self options:nil]lastObject];
}
- (IBAction)allSelect:(id)sender {
    
}

- (IBAction)buy:(id)sender {
    ZFBounceView *bounceView = [[ZFBounceView alloc]init];
    [self addSubview:bounceView];
    [bounceView showAlert];
}
@end
