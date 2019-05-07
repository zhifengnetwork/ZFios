//
//  ZFSelectTypeView.m
//  ZF
//
//  Created by weiming zhang on 2019/4/29.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFSelectTypeView.h"
#import "ZFSelectTypeCell.h"
#import "http_good.h"
#import "SVProgressHUD.h"
#import "ZFGoodModel.h"

@interface ZFSelectTypeView()<UITableViewDelegate,UITableViewDataSource,ZFSelectTypeCellDelegate>
@property (nonatomic, strong)UIImageView *iconImageView;
@property (nonatomic, strong)UILabel *priceLabel;
@property (nonatomic, strong)UILabel *promptLabel;
@property (nonatomic, strong)UIButton *cancelButton;

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)UILabel *numberLabel;
@property (nonatomic, strong)UIButton *decreaseButton;
@property (nonatomic, strong)UIButton *numberButton;
@property (nonatomic, strong)UIButton *increaseButton;
@property (nonatomic, strong)UIButton *agreeButton;

@property (nonatomic, strong)ZFGoodModel *goodModel;
@end
@implementation ZFSelectTypeView
static NSString * const ZFSelectTypeCellID = @"ZFSelectTypeCellID";
NSInteger count = 1;//存储购物车的数量

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.iconImageView];
    [self addSubview:self.priceLabel];
    [self addSubview:self.promptLabel];
    [self addSubview:self.cancelButton];
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = RGBColor(245, 245, 245);
    [self addSubview:lineView];
   
    [self addSubview:self.tableView];
    UIView *lineView1 = [[UIView alloc]init];
    lineView1.backgroundColor = RGBColor(245, 245, 245);
    [self addSubview:lineView1];
    
    [self addSubview:self.numberLabel];
    [self addSubview:self.decreaseButton];
    [self addSubview:self.numberButton];
    [self addSubview:self.increaseButton];
    [self addSubview:self.agreeButton];
    
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(20);
        make.top.equalTo(self).with.offset(-20);
        make.width.height.mas_equalTo(60);
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).with.offset(5.5);
        make.top.equalTo(self).with.offset(6);
    }];
    
    [_promptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).with.offset(5.5);
        make.bottom.equalTo(self.iconImageView.mas_bottom);
    }];
    
    [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(5);
        make.right.equalTo(self).with.offset(-5);
        make.width.height.mas_equalTo(25);
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImageView.mas_bottom).with.offset(13);
        make.left.right.equalTo(self);
        make.height.mas_equalTo(1);
    }];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom);
        make.left.right.equalTo(self);
        make.height.mas_equalTo(170);
    }];
    
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tableView.mas_bottom);
        make.left.right.equalTo(self);
        make.height.mas_equalTo(1);
    }];
    
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(20);
        make.top.equalTo(lineView1).with.offset(13);
    }];
    
    [_increaseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView1.mas_bottom).with.offset(10);
        make.right.equalTo(self).with.offset(-20);
        make.width.height.mas_equalTo(18);
    }];

    [_numberButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.increaseButton.mas_left).with.offset(-1);
        make.top.equalTo(self.increaseButton.mas_top);
        make.width.mas_equalTo(35);
        make.height.mas_equalTo(18);
    }];

    [_decreaseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.increaseButton.mas_top);
        make.right.equalTo(self.numberButton.mas_left).with.offset(-1);
        make.width.height.mas_equalTo(18);
    }];

    [_agreeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.mas_equalTo(46);
    }];
    ZWeakSelf
    [http_good goodsSpec:_goodID success:^(id responseObject)
     {
         [weakSelf loadData:responseObject];
     } failure:^(NSError *error) {
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
    
}

-(void)loadData:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    //
}

- (UIImageView *)iconImageView{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc]init];
        _iconImageView.image =[UIImage imageNamed:@"Picture"];
    }return _iconImageView;
}

- (UILabel *)priceLabel{
    if (_priceLabel == nil) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.font = [UIFont systemFontOfSize:12];
        _priceLabel.textColor = RGBColorHex(0xe82f5c);
        _priceLabel.text = @"￥297-397";
    }return _priceLabel;
}

- (UILabel *)promptLabel{
    if (_promptLabel == nil) {
        _promptLabel = [[UILabel alloc]init];
        _promptLabel.font = [UIFont systemFontOfSize:12];
        _promptLabel.textColor = RGBColorHex(0x333333);
        _promptLabel.text = @"请选择：款式";
    }return _promptLabel;
}

- (UIButton *)cancelButton{
    if (_cancelButton == nil) {
        _cancelButton = [[UIButton alloc]init];
        [_cancelButton setImage:[UIImage imageNamed:@"chacha"] forState:UIControlStateNormal];
        [_cancelButton addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
    }return _cancelButton;
}


- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[ZFSelectTypeCell class] forCellReuseIdentifier:ZFSelectTypeCellID];
        _tableView.rowHeight = 160;
        
    }return _tableView;
}

- (UILabel *)numberLabel{
    if (_numberLabel == nil) {
        _numberLabel = [[UILabel alloc]init];
        _numberLabel.font = [UIFont systemFontOfSize:12];
        _numberLabel.textColor = RGBColorHex(0x333333);
        _numberLabel.text = @"数量";
    }return _numberLabel;
}

- (UIButton *)decreaseButton{
    if (_decreaseButton == nil) {
        _decreaseButton = [[UIButton alloc]init];
        _decreaseButton.backgroundColor = RGBColorHex(0xf5f5f5);
        _decreaseButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_decreaseButton setTitleColor:RGBColorHex(0x333333) forState:UIControlStateNormal];
        [_decreaseButton setTitle:@"-" forState:UIControlStateNormal];
        [_decreaseButton addTarget:self action:@selector(NumberChange:) forControlEvents:UIControlEventTouchUpInside];
    }return _decreaseButton;
}

- (UIButton *)numberButton{
    if (_numberButton == nil) {
        _numberButton = [[UIButton alloc]init];
        _numberButton.backgroundColor = RGBColorHex(0xeaeaea);
        _numberButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_numberButton setTitleColor:RGBColorHex(0x333333) forState:UIControlStateNormal];
        [_numberButton setTitle:@"1" forState:UIControlStateNormal];
    }return _numberButton;
}

- (UIButton *)increaseButton{
    if (_increaseButton == nil) {
        _increaseButton = [[UIButton alloc]init];
        _increaseButton.backgroundColor = RGBColorHex(0xeaeaea);
        _increaseButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_increaseButton setTitleColor:RGBColorHex(0x333333) forState:UIControlStateNormal];
        [_increaseButton setTitle:@"+" forState:UIControlStateNormal];
        [_increaseButton addTarget:self action:@selector(NumberChange:) forControlEvents:UIControlEventTouchUpInside];
    }return _increaseButton;
}

- (UIButton *)agreeButton{
    if (_agreeButton == nil) {
        _agreeButton = [[UIButton alloc]init];
        [_agreeButton setBackgroundImage:[UIImage imageNamed:@"agree"] forState:UIControlStateNormal];
        _agreeButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_agreeButton setTitle:@"确认" forState:UIControlStateNormal];
        [_agreeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_agreeButton addTarget:self action:@selector(agreeClick) forControlEvents:UIControlEventTouchUpInside];
    }return _agreeButton;
}



#pragma mark --协议
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZFSelectTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:ZFSelectTypeCellID forIndexPath:indexPath];
//    cell.type = 
    return cell;
}
#pragma mark --方法
static NSInteger *i = 0;
- (void)selectKeyID:(UIButton *)btn{
    //计算有多少个主规格，然后拼凑起来
    NSString *key = [NSString stringWithFormat:@"%ld",(long)btn.tag];
    i++;
    //
    [http_good getPricePic:key goods_id:_goodID success:^(id responseObject) {
        if (kObjectIsEmpty(responseObject))
        {
            return;
        }
        //
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.domain];
    }];
    
}

- (void)NumberChange: (UIButton *)btn{
    
    if (btn == self.decreaseButton) {
        count--;
        if (count <= 0) {
            count = 0;
        }
    }else{
        count++;
    }
    [self.numberButton setTitle:[NSString stringWithFormat:@"%ld",(long)count] forState:UIControlStateNormal];
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

- (void)cancelClick{
    [[self currentViewController]dismissViewControllerAnimated:YES completion:nil];
}

- (void)agreeClick{
    //确认
}
@end
