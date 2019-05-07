//
//  ZFShoppingCartCell.m
//  ZF
//
//  Created by weiming zhang on 2019/3/11.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFShoppingCartCell.h"
#import "ZFMenuView.h"
#import "ZFShoppingItem.h"
#import "PPNumberButton.h"

@interface ZFShoppingCartCell()
@property (weak, nonatomic) IBOutlet UIView *bgView;//背景层

@property (weak, nonatomic) IBOutlet UIButton *selectGoodButton;


@property (weak, nonatomic) IBOutlet UILabel *fullSale;//满赠优惠显示
@property (weak, nonatomic) IBOutlet UIImageView *goodsImageView;//商品图片
@property (weak, nonatomic) IBOutlet UILabel *goodsLabel;//商品名字

@property (weak, nonatomic) IBOutlet PPNumberButton *numberButton;
@property (weak, nonatomic) IBOutlet UILabel *goodsPriceLabel;//商品价格
@property (weak, nonatomic) IBOutlet UILabel *saleLabel;//优惠显示


@end
@implementation ZFShoppingCartCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setUp];
}
- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:editing animated:animated];
    [self setShowsReorderControl:NO];
    for (UIControl *control in self.subviews) {
        if ([control isMemberOfClass:NSClassFromString(@"UITableViewCellEditControl")]) {
            [control removeFromSuperview];
            
        }
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    [super setSelected:selected animated:animated];
    if (selected) {
        self.selectGoodButton.selected = YES;
    }else{
        self.selectGoodButton.selected = NO;
    }
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
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    ZFMenuView *menuView= [[ZFMenuView alloc]init];
    [self.contentView addSubview:menuView];
    menuView.arr =@[@"官方标配",@"套餐一",@"套餐二"];
    [menuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_goodsLabel.mas_bottom).with.offset(10);
        make.left.equalTo(self->_numberButton.mas_right).with.offset(55);
        make.right.equalTo(self.contentView).with.offset(-10);
        make.centerY.equalTo(self->_numberButton.mas_centerY);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(22);
    }];
    [menuView setButtonHeight:22];
    
    [menuView closeTableView];
    
}

+ (instancetype)ShoppingCartCell{
    
    return [[[NSBundle mainBundle] loadNibNamed:@"ZFShoppingCartCell" owner:self options:nil]lastObject];
}




/*点击进入店铺 */
- (IBAction)goStore:(id)sender {
    NSLog(@"点击进入店铺");
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
