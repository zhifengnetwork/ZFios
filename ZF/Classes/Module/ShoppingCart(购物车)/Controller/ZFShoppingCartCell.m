//
//  ZFShoppingCartCell.m
//  ZF
//
//  Created by weiming zhang on 2019/3/11.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFShoppingCartCell.h"
#import "ZFMenuAlert.h"
@interface ZFShoppingCartCell()
@property (weak, nonatomic) IBOutlet UIView *bgView;//背景层
@property (weak, nonatomic) IBOutlet UIButton *selectShopButton;//商店选中按钮
@property (weak, nonatomic) IBOutlet UILabel *storeLabel;//商店名字
@property (weak, nonatomic) IBOutlet UILabel *fullSale;//满赠优惠显示
@property (weak, nonatomic) IBOutlet UIImageView *goodsImageView;//商品图片
@property (weak, nonatomic) IBOutlet UILabel *goodsLabel;//商品名字
@property (weak, nonatomic) IBOutlet UIView *menuView;
@property (weak, nonatomic) IBOutlet UILabel *goodsCountLabel;//商品数量
@property (weak, nonatomic) IBOutlet UILabel *goodsPriceLabel;//商品价格
@property (weak, nonatomic) IBOutlet UILabel *saleLabel;//优惠显示


@end
@implementation ZFShoppingCartCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setUp];
}
- (void)setFrame:(CGRect)frame{
    frame.origin.x = 16;
    frame.size.width -= 2* frame.origin.x;
    frame.size.height -= 2*frame.origin.x;
    [super setFrame:frame];
}
- (void)setUp{
    //背景层
    self.backgroundColor = RGBColorHex(0xffffff);
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 8.0;
    
    ZFMenuAlert * alert =  [[ZFMenuAlert alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    alert.arrMDataSource = @[@"dafd",@"dfasfsa"];
    alert.backgroundColor = [UIColor redColor];
    self.menuView = alert;
    
    [alert setDidSelectedCallback:^(NSInteger index, NSString *content) {
        //回调中要实现的功能.
    }];
    
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
