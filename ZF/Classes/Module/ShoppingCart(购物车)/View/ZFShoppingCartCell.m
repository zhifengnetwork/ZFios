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
#import "UIImageView+WebCache.h"
#import "ZFSelectTypeView.h"
#import "TYAlertController.h"

@interface ZFShoppingCartCell()<PPNumberButtonDelegate>

@property (nonatomic, strong)UILabel *full;
@property (strong, nonatomic)  UIButton *fullSale;//满赠优惠显示
@property (strong, nonatomic)  UIButton *selectGoodButton;
@property (strong, nonatomic)  UIImageView *goodsImageView;//商品图片
@property (strong, nonatomic)  UILabel *goodsLabel;//商品名字

@property (strong, nonatomic)  PPNumberButton *numberButton;
@property (strong, nonatomic) UIButton *mealButton;
@property (nonatomic, strong) UIButton *serviceButton;
@property (strong, nonatomic)  UILabel *goodsPriceLabel;//商品价格
@property (nonatomic, strong)   UIView *lineView;
@property (strong, nonatomic)  UILabel *sale;
@property (strong, nonatomic)  UILabel *saleLabel;//优惠显示
@property (nonatomic, strong) UIView *lineView2;
@property (nonatomic, strong) UIButton *changeButton;


@end
@implementation ZFShoppingCartCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setUp];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUp];
    }
    return self;
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
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
//    [super setSelected:selected animated:animated];
//
//}

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
    [self.contentView addSubview:self.full];
    [self.contentView addSubview:self.fullSale];
    [self.contentView addSubview:self.goodsImageView];
    [self.contentView addSubview:self.goodsLabel];
    [self.contentView addSubview:self.numberButton];
    [self.contentView addSubview:self.mealButton];
    [self.contentView addSubview:self.serviceButton];
    [self.contentView addSubview:self.goodsPriceLabel];
    [self.contentView addSubview:self.lineView];
    [self.contentView addSubview:self.sale];
    [self.contentView addSubview:self.saleLabel];
    [self.contentView addSubview:self.lineView2];
    [self.contentView addSubview:self.changeButton];
    [self.contentView addSubview:self.selectGoodButton];
    
    [_full mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self).with.offset(10);
        make.width.mas_equalTo(40);
    }];
    
    [_fullSale mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.full.mas_right).with.offset(12);
        make.right.equalTo(self).with.offset(-10);
        make.centerY.equalTo(self.full.mas_centerY);
    }];
    [_fullSale setTitleEdgeInsets:UIEdgeInsetsMake(0, - _fullSale.imageView.frame.size.width-150, 0, 0)];
    [_fullSale setImageEdgeInsets:UIEdgeInsetsMake(0, _fullSale.titleLabel.frame.size.width+50, 0, 0)];
    [_selectGoodButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.mas_equalTo(10);
    }];
    
    [_goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fullSale.mas_bottom).with.offset(14);
        make.left.mas_equalTo(30);
        make.width.mas_equalTo(110);
        make.height.mas_equalTo(85);
    }];
    [_goodsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodsImageView.mas_top);
        make.left.equalTo(self.goodsImageView.mas_right).with.offset(10);
        make.right.equalTo(self).with.offset(10);
    }];
    
    [_numberButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodsLabel.mas_bottom).with.offset(10);
        make.left.equalTo(self.goodsLabel.mas_left);
        make.height.mas_equalTo(22);
        make.width.mas_equalTo(80);
    }];
    
    [_mealButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_goodsLabel.mas_bottom).with.offset(10);
        make.left.equalTo(self->_numberButton.mas_right).with.offset(15);
        make.right.equalTo(self.contentView).with.offset(-10);
        make.centerY.equalTo(self->_numberButton.mas_centerY);
        make.width.mas_equalTo(110);
        make.height.mas_equalTo(22);
    }];
    [_mealButton setTitleEdgeInsets:UIEdgeInsetsMake(0, - _mealButton.imageView.frame.size.width, 0, 0)];
    [_mealButton setImageEdgeInsets:UIEdgeInsetsMake(0, _mealButton.titleLabel.frame.size.width+70, 0, -_mealButton.titleLabel.frame.size.width)];
    
    [_serviceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(self.goodsImageView.mas_bottom);
        make.left.equalTo(self.numberButton.mas_left);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(18);
    }];
    
    [_goodsPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(-10);
        make.bottom.equalTo(self.goodsImageView.mas_bottom);
    }];
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodsImageView.mas_bottom).with.offset(15);
        make.left.equalTo(self).with.offset(10);
        make.right.equalTo(self).with.offset(-10);
        make.height.mas_equalTo(1);
    }];
    
    [_changeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(-10);
        make.top.equalTo(self.lineView.mas_bottom).with.offset(5);
    }];
    
    [_lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView.mas_bottom).with.offset(11);
        make.width.mas_equalTo(1);
        make.right.equalTo(self.changeButton.mas_left).with.offset(-15);
        make.height.mas_equalTo(15);
    }];
    
    [_saleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.lineView2.mas_left).with.offset(-15);
        make.centerY.equalTo(self.changeButton.mas_centerY);
    }];
    
    [_sale mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.saleLabel.mas_left).with.offset(-15);
        make.centerY.equalTo(self.changeButton.mas_centerY);
    }];
    
}


- (void)setModel:(ZFGoodModel *)model{
    _model = model;
    if (model.selected == 0) {
        self.selectGoodButton.selected = NO;
    }else{
        self.selectGoodButton.selected = YES;
    }
    self.goodsLabel.text = [NSString stringWithFormat:@"%@",_model.goods_name];
    if (!kStringIsEmpty(_model.original_img))
    {
        NSString* str = [NSString stringWithFormat:@"%@%@",ImageUrl,_model.original_img];
        [_goodsImageView sd_setImageWithURL:[NSURL URLWithString:str]];
    }
    [_mealButton setTitle:[NSString stringWithFormat:@"%@",_model.spec_key_name] forState:UIControlStateNormal];
    _goodsPriceLabel.text = [NSString stringWithFormat:@"￥%@",_model.goods_price];
    _numberButton.currentNumber = _model.goods_num;
}

- (UILabel *)full{
    if (_full == nil) {
        _full = [[UILabel alloc]init];
        _full.font = [UIFont systemFontOfSize:10];
        _full.textColor = RGBColorHex(0xe51c23);
        _full.text = @"满赠";
    }return _full;
}

- (UIButton *)fullSale{
    if (_fullSale == nil) {
        _fullSale = [[UIButton alloc]init];
        _fullSale.titleLabel.font = [UIFont systemFontOfSize:10];
        [_fullSale setTitleColor:RGBColorHex(0x4d4d4d) forState:UIControlStateNormal];
        [_fullSale setTitle:@"已购物4900.00元，可领取赠品" forState:UIControlStateNormal];
        [_fullSale setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
        
    }return _fullSale;
}

- (UIButton *)selectGoodButton{
    if (_selectGoodButton == nil) {
        _selectGoodButton = [[UIButton alloc]init];
        [_selectGoodButton setImage:[UIImage imageNamed:@"option_b"] forState:UIControlStateNormal];
        [_selectGoodButton setImage:[UIImage imageNamed:@"option_selected"] forState:UIControlStateSelected];
        [_selectGoodButton addTarget:self action:@selector(selectGood:) forControlEvents:UIControlEventTouchUpInside];
        
    }return _selectGoodButton;
}

- (UIImageView *)goodsImageView{
    if (_goodsImageView == nil) {
        _goodsImageView = [[UIImageView alloc]init];
        
    }return _goodsImageView;
}

- (UILabel *)goodsLabel{
    if (_goodsLabel == nil) {
        _goodsLabel = [[UILabel alloc]init];
        _goodsLabel.font = [UIFont systemFontOfSize:11];
        _goodsLabel.textColor = RGBColorHex(0x4d4d4d);
        _goodsLabel.text = @"的发生的房间辣死了房间爱的上了飞机拉多少积分大量时间法拉盛";
        _goodsLabel.numberOfLines = 0;
    }return _goodsLabel;
}

- (PPNumberButton *)numberButton{
    if (_numberButton == nil) {
        _numberButton = [[PPNumberButton alloc]init];
        _numberButton.shakeAnimation = YES;
        // 设置最小值
        _numberButton.minValue = 1;
        // 设置输入框中的字体大小
        _numberButton.inputFieldFont = 12;
        _numberButton.increaseTitle = @"＋";
        _numberButton.decreaseTitle = @"－";
        _numberButton.delegate = self;
    }return _numberButton;
}

- (UIButton *)mealButton{
    if (_mealButton == nil) {
        _mealButton = [[UIButton alloc]init];
        _mealButton.backgroundColor = RGBColorHex(0xf9f9f9);
        [_mealButton setTitleColor:RGBColorHex(0x666666) forState:UIControlStateNormal];
        _mealButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_mealButton setTitle:@"官方标配" forState:UIControlStateNormal];
        [_mealButton setImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
        [_mealButton addTarget:self action:@selector(selectMeal) forControlEvents:UIControlEventTouchUpInside];
    }return _mealButton;
}

- (UIButton *)serviceButton{
    if (_serviceButton == nil) {
        _serviceButton = [[UIButton alloc]init];
        _serviceButton.layer.cornerRadius = 10;
        _serviceButton.backgroundColor = RGBColorHex(0xe51c23);
        [_serviceButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_serviceButton setTitle:@"选服务" forState:UIControlStateNormal];
        _serviceButton.titleLabel.font = [UIFont systemFontOfSize:8];
        [_changeButton addTarget:self action:@selector(selectservice:) forControlEvents:UIControlEventTouchUpInside];
    }return _serviceButton;
}

- (UILabel *)goodsPriceLabel{
    if (_goodsPriceLabel == nil) {
        _goodsPriceLabel = [[UILabel alloc]init];
        _goodsPriceLabel.font = [UIFont boldSystemFontOfSize:13];
        _goodsPriceLabel.textColor = RGBColorHex(0x1a1a1a);
        _goodsPriceLabel.text = @"￥4999.00";
    }return _goodsPriceLabel;
}

- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = RGBColorHex(0xf2f2f2);
    }return _lineView;
}

- (UILabel *)sale{
    if (_sale == nil) {
        _sale = [[UILabel alloc]init];
        _sale.font = [UIFont systemFontOfSize:10];
        _sale.textColor = RGBColorHex(0x6a6a6a);
        _sale.text = @"优惠";
    }return _sale;
}

- (UILabel *)saleLabel{
    if (_saleLabel == nil) {
        _saleLabel = [[UILabel alloc]init];
        _saleLabel.font = [UIFont systemFontOfSize:10];
        _saleLabel.textColor = RGBColorHex(0x9f9f9f);
        _saleLabel.text = @"满100，200，323可换购商品";
    }return _saleLabel;
}

- (UIView *)lineView2{
    if (_lineView2 == nil) {
        _lineView2 = [[UIView alloc]init];
        _lineView2.backgroundColor = [UIColor blackColor];
    }return _lineView2;
}

- (UIButton *)changeButton{
    if (_changeButton == nil) {
        _changeButton = [[UIButton alloc]init];
        [_changeButton setTitleColor:RGBColorHex(0x393939) forState:UIControlStateNormal];
        _changeButton.titleLabel.font = [UIFont boldSystemFontOfSize:12];
        [_changeButton setTitle:@"修改" forState:UIControlStateNormal];
        [_changeButton addTarget:self action:@selector(revise:) forControlEvents:UIControlEventTouchUpInside];
    }return _changeButton;
}

/*点击进入店铺 */
- (void)goStore:(id)sender {
    NSLog(@"点击进入店铺");
}
//进入满赠界面
- (void)goSale:(id)sender {
}
//选择服务套餐
- (void)selectservice:(id)sender {
}
//修改套餐
- (void)revise:(id)sender {
}

- (void)selectGood:(UIButton*)btn{
    btn.selected = !btn.selected;
    if (btn.selected == YES) {
        [self.delegate selectGood:@"1" goods_id:_model.ID];
    }else{
        [self.delegate selectGood:@"0" goods_id:_model.ID];
    }
    
}

- (void)pp_numberButton:(PPNumberButton *)numberButton number:(NSInteger)number increaseStatus:(BOOL)increaseStatus{
    [self.delegate changeGoodsNum:number Cell:self];
}


- (void)selectMeal{
    ZFSelectTypeView *view = [[ZFSelectTypeView alloc]initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, 370)];
    
    view.cartModel = _model;
    TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:view preferredStyle:TYAlertControllerStyleActionSheet];
    alertController.backgoundTapDismissEnable = YES;
    [[self currentViewController] presentViewController:alertController animated:YES completion:nil];
}

//获取当前控制器
- (UIViewController *)currentViewController{
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (1) {
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = ((UITabBarController *)vc).selectedViewController;
        }
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController *)vc).visibleViewController;
        }
        if (vc.presentedViewController) {
            vc = vc.presentedViewController;
        }else{
            break;
        }
    }
    return vc;
}

@end
