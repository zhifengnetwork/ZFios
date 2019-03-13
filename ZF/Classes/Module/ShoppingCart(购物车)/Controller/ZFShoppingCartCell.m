//
//  ZFShoppingCartCell.m
//  ZF
//
//  Created by weiming zhang on 2019/3/11.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFShoppingCartCell.h"
#import "ZFMenuAlert.h"
#import "ZFMenuView.h"

@interface ZFShoppingCartCell()
@property (weak, nonatomic) IBOutlet UIView *bgView;//背景层
@property (weak, nonatomic) IBOutlet UIButton *selectShopButton;//商店选中按钮
@property (weak, nonatomic) IBOutlet UILabel *storeLabel;//商店名字
@property (weak, nonatomic) IBOutlet UILabel *fullSale;//满赠优惠显示
@property (weak, nonatomic) IBOutlet UIImageView *goodsImageView;//商品图片
@property (weak, nonatomic) IBOutlet UILabel *goodsLabel;//商品名字
@property (strong, nonatomic) IBOutlet ZFMenuView *menuView;//下拉框
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *menuHeight;

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
    
    ZFMenuView *view= [[ZFMenuView alloc]init];
    [view setViewOriginx:10 viewOriginy:0 buttonHeight:22 buttonWeight:100 tableViewHeight:0];
    view.arr =@[@"官方标配",@"套餐一",@"套餐二"];
    
    [view closeTableView];
    if (view.buttonImageFlag == YES) {
        self.menuHeight.constant= 400;
    }
    [self.menuView addSubview:view];
    
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
