//
//  ZFShoppingCartCell.m
//  ZF
//
//  Created by weiming zhang on 2019/3/11.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFShoppingCartCell.h"
@interface ZFShoppingCartCell()
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIButton *selectShopButton;
@property (weak, nonatomic) IBOutlet UILabel *storeLabel;
@property (weak, nonatomic) IBOutlet UILabel *fullSale;
@property (weak, nonatomic) IBOutlet UIImageView *goodsImageView;
@property (weak, nonatomic) IBOutlet UILabel *saleLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodsMoneyLabel;

@end
@implementation ZFShoppingCartCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setUp];
}
- (void)setFrame:(CGRect)frame{
    frame.origin.x = 10;
    frame.size.width -= 2* frame.origin.x;
    frame.size.height -= 2*frame.origin.x;
    [super setFrame:frame];
}
- (void)setUp{
    //背景层
    self.bgView.backgroundColor = RGBColorHex(0xffffff);
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 8.0;
    
}
+ (instancetype)ShoppingCartCell{
    
    return [[[NSBundle mainBundle] loadNibNamed:@"ZFShoppingCartCell" owner:self options:nil]lastObject];
}
//商品数量的增加与减少
- (IBAction)reduce:(id)sender {
}
- (IBAction)increase:(id)sender {
}


/*点击进入店铺 */
- (IBAction)goStore:(id)sender {
}
//进入满赠界面
- (IBAction)goSale:(id)sender {
}
//选择服务套餐
- (IBAction)selectservice:(id)sender {
}
//修改套餐
- (IBAction)revise:(id)sender {
}

@end
