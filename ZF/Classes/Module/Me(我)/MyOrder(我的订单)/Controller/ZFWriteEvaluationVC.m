//
//  ZFWriteEvaluationVC.m
//  ZF
//
//  Created by weiming zhang on 2019/5/14.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFWriteEvaluationVC.h"
#import "ZFFinishEvaluationVC.h"
#import "TZImagePickerController.h"

#import "http_user.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "ZFAddressEditModel.h"
#import "ZFOrderModel.h"
//#import "ZFTextView.h"

@interface ZFWriteEvaluationVC ()<UITextViewDelegate>
@property (nonatomic, strong)UIImageView *goodImageView;
@property (nonatomic, strong)UILabel *keyLabel;
@property (nonatomic, strong)UILabel *describeLabel;
@property (nonatomic, strong)UIButton *button1;
@property (nonatomic, strong)UIButton *button2;
@property (nonatomic, strong)UIButton *button3;
@property (nonatomic, strong)UIButton *button4;
@property (nonatomic, strong)UIButton *button5;
@property (nonatomic, strong)UILabel *evaluationLabel;  // 描述相符
@property (nonatomic, strong)UITextView *evaluationTV;
@property (nonatomic, strong)UILabel *placeHolderLabel;

@property (nonatomic, strong)UILabel *LogisticsServiceLabel;//物流服务
@property (nonatomic, strong)UIButton *button1_1;
@property (nonatomic, strong)UIButton *button2_1;
@property (nonatomic, strong)UIButton *button3_1;
@property (nonatomic, strong)UIButton *button4_1;
@property (nonatomic, strong)UIButton *button5_1;
@property (nonatomic, strong)UILabel *evaluationLabel1;
@property (nonatomic, strong)UILabel *serviceAttitudeLabel;//服务态度
@property (nonatomic, strong)UIButton *button1_2;
@property (nonatomic, strong)UIButton *button2_2;
@property (nonatomic, strong)UIButton *button3_2;
@property (nonatomic, strong)UIButton *button4_2;
@property (nonatomic, strong)UIButton *button5_2;
@property (nonatomic, strong)UILabel *evaluationLabel2;

@property (nonatomic, strong)UILabel *anonymousLabel;//是否匿名
@property (nonatomic, strong)UIButton *anonymousButton;
@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic, strong)UIImageView *imageView1;
@property (nonatomic, strong)UIImageView *imageView2;
@property (nonatomic, strong)UIImageView *imageView3;
@property (nonatomic, strong)UIImageView *imageView4;
@property (nonatomic, strong)UIButton *addImageButton;

@property (nonatomic, strong)ZFAddressEditModel *editModel;
@end

@implementation ZFWriteEvaluationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发布评论";

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发布" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonClick)];
    NSDictionary *dic = [NSDictionary dictionaryWithObject:RGBColorHex(0xe82f63) forKey:NSForegroundColorAttributeName];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:dic forState:UIControlStateNormal];
    [self setup];
}

- (void)setup{
    [self.view addSubview:self.goodImageView];
    [self.view addSubview:self.keyLabel];
    [self.view addSubview:self.describeLabel];
    [self.view addSubview:self.button1];
    [self.view addSubview:self.button2];
    [self.view addSubview:self.button3];
    [self.view addSubview:self.button4];
    [self.view addSubview:self.button5];
    [self.view addSubview:self.evaluationLabel];
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = RGBColorHex(0xcccccc);
    [self.view addSubview:lineView];
    [self.view addSubview:self.evaluationTV];
    [self.evaluationTV addSubview:self.placeHolderLabel];
    UIView *lineView2 = [[UIView alloc]init];
    lineView2.backgroundColor = RGBColorHex(0xcccccc);
    [self.view addSubview:lineView2];

    [self.view addSubview:self.LogisticsServiceLabel];
    [self.view addSubview:self.button1_1];
    [self.view addSubview:self.button2_1];
    [self.view addSubview:self.button3_1];
    [self.view addSubview:self.button4_1];
    [self.view addSubview:self.button5_1];
    [self.view addSubview:self.evaluationLabel1];
    [self.view addSubview:self.serviceAttitudeLabel];
    [self.view addSubview:self.button1_2];
    [self.view addSubview:self.button2_2];
    [self.view addSubview:self.button3_2];
    [self.view addSubview:self.button4_2];
    [self.view addSubview:self.button5_2];
    [self.view addSubview:self.evaluationLabel2];
    [self.view addSubview:self.anonymousLabel];
    [self.view addSubview:self.anonymousButton];
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.imageView1];
    [self.view addSubview:self.imageView2];
    [self.view addSubview:self.imageView3];
    [self.view addSubview:self.imageView4];
    [self.view addSubview:self.addImageButton];


    [_goodImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.view).with.offset(10);
        make.width.height.mas_equalTo(40);
    }];

    [_keyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodImageView.mas_top);
        make.left.equalTo(self.goodImageView.mas_right).with.offset(15);

    }];

    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.top.equalTo(self.goodImageView.mas_bottom).with.offset(10);
        make.left.right.equalTo(self.view);
    }];

    [_evaluationTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).with.offset(12);
        make.left.equalTo(self.view).with.offset(10);
        make.right.equalTo(self.view).with.offset(-10);
        make.height.mas_equalTo(90);
    }];

    [_placeHolderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.evaluationTV);
    }];

    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.evaluationTV.mas_bottom);
        make.left.equalTo(self.view).with.offset(10);
        make.right.equalTo(self.view).with.offset(-10);
        make.height.mas_equalTo(1);
    }];

    [_describeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(10);
        make.top.equalTo(lineView2.mas_bottom).with.offset(10);
    }];

    [_button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.describeLabel.mas_centerY);
        make.left.equalTo(self.describeLabel.mas_right).with.offset(10);
    }];

    [_button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.describeLabel.mas_centerY);
        make.left.equalTo(self->_button1.mas_right).with.offset(5);
    }];

    [_button3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.describeLabel.mas_centerY);
        make.left.equalTo(self->_button2.mas_right).with.offset(5);
    }];

    [_button4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.describeLabel.mas_centerY);
        make.left.equalTo(self->_button3.mas_right).with.offset(5);
    }];

    [_button5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.describeLabel.mas_centerY);
        make.left.equalTo(self->_button4.mas_right).with.offset(5);
    }];

    [_evaluationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.button5.mas_right).with.offset(15);
        make.centerY.equalTo(self.describeLabel.mas_centerY);
    }];

    [_LogisticsServiceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.describeLabel.mas_bottom).with.offset(10);
        make.left.equalTo(self.view).with.offset(10);
    }];

    [_button1_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.LogisticsServiceLabel.mas_centerY);
        make.left.equalTo(self.LogisticsServiceLabel.mas_right).with.offset(10);
    }];

    [_button2_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.LogisticsServiceLabel.mas_centerY);
        make.left.equalTo(self.button1_1.mas_right).with.offset(5);
    }];

    [_button3_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.LogisticsServiceLabel.mas_centerY);
        make.left.equalTo(self.button2_1.mas_right).with.offset(5);
    }];

    [_button4_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.LogisticsServiceLabel.mas_centerY);
        make.left.equalTo(self.button3_1.mas_right).with.offset(5);
    }];

    [_button5_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.LogisticsServiceLabel.mas_centerY);
        make.left.equalTo(self.button4_1.mas_right).with.offset(5);
    }];

    [_evaluationLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.LogisticsServiceLabel.mas_centerY);
        make.left.equalTo(self.button5_1.mas_right).with.offset(15);
    }];

    [_serviceAttitudeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.LogisticsServiceLabel.mas_bottom).with.offset(10);
        make.left.equalTo(self.view).with.offset(10);
    }];

    [_button1_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.serviceAttitudeLabel.mas_centerY);
        make.left.equalTo(self.serviceAttitudeLabel.mas_right).with.offset(10);
    }];

    [_button2_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.serviceAttitudeLabel.mas_centerY);
        make.left.equalTo(self.button1_2.mas_right).with.offset(5);
    }];

    [_button3_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.serviceAttitudeLabel.mas_centerY);
        make.left.equalTo(self.button2_2.mas_right).with.offset(5);
    }];

    [_button4_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.serviceAttitudeLabel.mas_centerY);
        make.left.equalTo(self.button3_2.mas_right).with.offset(5);
    }];

    [_button5_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.serviceAttitudeLabel.mas_centerY);
        make.left.equalTo(self.button4_2.mas_right).with.offset(5);
    }];

    [_evaluationLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.serviceAttitudeLabel.mas_centerY);
        make.left.equalTo(self.button5_2.mas_right).with.offset(15);
    }];

    [_anonymousLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.serviceAttitudeLabel.mas_bottom).with.offset(10);
        make.left.equalTo(self.view).with.offset(10);
    }];

    [_anonymousButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.anonymousLabel.mas_centerY);
        make.left.equalTo(self.anonymousLabel.mas_right).with.offset(10);
    }];

    [_addImageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.anonymousLabel.mas_bottom).with.offset(40);
        make.left.equalTo(self.view).with.offset(10);
    }];

    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.addImageButton.mas_centerY);
        make.left.equalTo(self.addImageButton.mas_right).with.offset(10);
        make.width.height.mas_equalTo(50);
    }];

    [_imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.imageView.mas_centerY);
        make.left.equalTo(self.imageView.mas_right).with.offset(10);
        make.width.height.mas_equalTo(50);
    }];

    [_imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.imageView.mas_centerY);
        make.left.equalTo(self.imageView1.mas_right).with.offset(10);
        make.width.height.mas_equalTo(50);
    }];

    [_imageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.imageView.mas_centerY);
        make.left.equalTo(self.imageView2.mas_right).with.offset(10);
        make.width.height.mas_equalTo(50);
    }];

    [_imageView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.imageView.mas_centerY);
        make.left.equalTo(self.imageView3.mas_right).with.offset(10);
        make.width.height.mas_equalTo(50);
    }];
}

- (void)setOrderID:(NSInteger)orderID{
    _orderID = orderID;

    [http_user order_detail:_orderID success:^(id responseObject) {
        [self showData:responseObject];
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.domain];
    }];
}

- (void)showData:(id)responseObject{
    if (kObjectIsEmpty(responseObject)) {
        return;
    }
    self.editModel = [ZFAddressEditModel mj_objectWithKeyValues:responseObject];
    ZFOrderModel *orderModel = self.editModel.goods[0];
    if (!kStringIsEmpty(orderModel.original_img))
    {
        NSString* str = [NSString stringWithFormat:@"%@%@",ImageUrl,orderModel.original_img];
        [_goodImageView sd_setImageWithURL:[NSURL URLWithString:str]];
    }
    self.keyLabel.text = [NSString stringWithFormat:@"%@\n%@",orderModel.goods_name,orderModel.spec_key_name];
}


- (UIImageView *)goodImageView{
    if (_goodImageView == nil) {
        _goodImageView = [[UIImageView alloc]init];
    }return _goodImageView;
}

- (UILabel *)keyLabel{
    if (_keyLabel == nil) {
        _keyLabel = [[UILabel alloc]init];
        _keyLabel.font = [UIFont systemFontOfSize:12];
        _keyLabel.textColor = RGBColorHex(0x333333);
    }return _keyLabel;
}

- (UILabel *)describeLabel{
    if (_describeLabel == nil) {
        _describeLabel = [[UILabel alloc]init];
        _describeLabel.font = [UIFont systemFontOfSize:12];
        _describeLabel.textColor = RGBColorHex(0x333333);
        _describeLabel.text = @"描述相符";
    }return _describeLabel;
}

- (UIButton *)button1{
    if (_button1 == nil) {
        _button1 = [[UIButton alloc]init];
        [_button1 setImage:[UIImage imageNamed:@"xingxing1"] forState:UIControlStateNormal];
        [_button1 setImage:[UIImage imageNamed:@"xingxing"] forState:UIControlStateSelected];
        [_button1 addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
        _button1.tag = 11;
    }return _button1;
}

- (UIButton *)button2{
    if (_button2 == nil) {
        _button2 = [[UIButton alloc]init];
        [_button2 setImage:[UIImage imageNamed:@"xingxing1"] forState:UIControlStateNormal];
        [_button2 setImage:[UIImage imageNamed:@"xingxing"] forState:UIControlStateSelected];
        [_button2 addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
        _button2.tag = 12;
    }return _button2;
}

- (UIButton *)button3{
    if (_button3 == nil) {
        _button3 = [[UIButton alloc]init];
        [_button3 setImage:[UIImage imageNamed:@"xingxing1"] forState:UIControlStateNormal];
        [_button3 setImage:[UIImage imageNamed:@"xingxing"] forState:UIControlStateSelected];
        [_button3 addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
        _button3.tag = 13;
    }return _button3;
}

- (UIButton *)button4{
    if (_button4 == nil) {
        _button4 = [[UIButton alloc]init];
        [_button4 setImage:[UIImage imageNamed:@"xingxing1"] forState:UIControlStateNormal];
        [_button4 setImage:[UIImage imageNamed:@"xingxing"] forState:UIControlStateSelected];
        [_button4 addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
        _button4.tag = 14;
    }return _button4;
}

- (UIButton *)button5{
    if (_button5 == nil) {
        _button5 = [[UIButton alloc]init];
        [_button5 setImage:[UIImage imageNamed:@"xingxing1"] forState:UIControlStateNormal];
        [_button5 setImage:[UIImage imageNamed:@"xingxing"] forState:UIControlStateSelected];
        [_button5 addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
        _button5.tag = 15;
    }return _button5;
}

- (UILabel *)evaluationLabel{
    if (_evaluationLabel ==nil) {
        _evaluationLabel = [[UILabel alloc]init];
        _evaluationLabel.font = [UIFont systemFontOfSize:12];
        _evaluationLabel.textColor = RGBColorHex(0x333333);
    }return _evaluationLabel;
}

- (UITextView *)evaluationTV{
    if (_evaluationTV == nil) {
        _evaluationTV = [[UITextView alloc]init];
        _evaluationTV.delegate = self;
    }return _evaluationTV;
}

- (UILabel *)placeHolderLabel{
    if (_placeHolderLabel == nil) {
        _placeHolderLabel = [[UILabel alloc]init];
        _placeHolderLabel.font = [UIFont systemFontOfSize:10];
        _placeHolderLabel.textColor = RGBColorHex(0x999999);
       _placeHolderLabel.text = @"写下购买体会和使用感受来帮助其他小伙伴~";
    }return _placeHolderLabel;
}

- (UILabel *)LogisticsServiceLabel{
    if (_LogisticsServiceLabel == nil) {
        _LogisticsServiceLabel = [[UILabel alloc]init];
        _LogisticsServiceLabel.font = [UIFont systemFontOfSize:12];
        _LogisticsServiceLabel.textColor = RGBColorHex(0x333333);
        _LogisticsServiceLabel.text = @"物流服务";
    }return _LogisticsServiceLabel;
}

- (UIButton *)button1_1{
    if (_button1_1 == nil) {
        _button1_1 = [[UIButton alloc]init];
        [_button1_1 setImage:[UIImage imageNamed:@"xingxing1"] forState:UIControlStateNormal];
        [_button1_1 setImage:[UIImage imageNamed:@"xingxing"] forState:UIControlStateSelected];
        [_button1_1 addTarget:self action:@selector(selectClick1:) forControlEvents:UIControlEventTouchUpInside];
        _button1_1.tag = 21;
    }return _button1_1;
}

- (UIButton *)button2_1{
    if (_button2_1 == nil) {
        _button2_1 = [[UIButton alloc]init];
        [_button2_1 setImage:[UIImage imageNamed:@"xingxing1"] forState:UIControlStateNormal];
        [_button2_1 setImage:[UIImage imageNamed:@"xingxing"] forState:UIControlStateSelected];
        [_button2_1 addTarget:self action:@selector(selectClick1:) forControlEvents:UIControlEventTouchUpInside];
        _button2_1.tag = 22;
    }return _button2_1;
}

- (UIButton *)button3_1{
    if (_button3_1 == nil) {
        _button3_1 = [[UIButton alloc]init];
        [_button3_1 setImage:[UIImage imageNamed:@"xingxing1"] forState:UIControlStateNormal];
        [_button3_1 setImage:[UIImage imageNamed:@"xingxing"] forState:UIControlStateSelected];
        [_button3_1 addTarget:self action:@selector(selectClick1:) forControlEvents:UIControlEventTouchUpInside];
        _button3_1.tag = 23;
    }return _button3_1;
}

- (UIButton *)button4_1{
    if (_button4_1 == nil) {
        _button4_1 = [[UIButton alloc]init];
        [_button4_1 setImage:[UIImage imageNamed:@"xingxing1"] forState:UIControlStateNormal];
        [_button4_1 setImage:[UIImage imageNamed:@"xingxing"] forState:UIControlStateSelected];
        [_button4_1 addTarget:self action:@selector(selectClick1:) forControlEvents:UIControlEventTouchUpInside];
        _button4_1.tag = 24;
    }return _button4_1;
}

- (UIButton *)button5_1{
    if (_button5_1 == nil) {
        _button5_1 = [[UIButton alloc]init];
        [_button5_1 setImage:[UIImage imageNamed:@"xingxing1"] forState:UIControlStateNormal];
        [_button5_1 setImage:[UIImage imageNamed:@"xingxing"] forState:UIControlStateSelected];
        [_button5_1 addTarget:self action:@selector(selectClick1:) forControlEvents:UIControlEventTouchUpInside];
        _button5_1.tag = 25;
    }return _button5_1;
}

- (UILabel *)evaluationLabel1{
    if (_evaluationLabel1 == nil) {
        _evaluationLabel1 = [[UILabel alloc]init];
        _evaluationLabel1.font = [UIFont systemFontOfSize:12];
        _evaluationLabel1.textColor = RGBColorHex(0x333333);
    }return _evaluationLabel1;
}

- (UILabel *)serviceAttitudeLabel{
    if (_serviceAttitudeLabel == nil) {
        _serviceAttitudeLabel = [[UILabel alloc]init];
        _serviceAttitudeLabel.font = [UIFont systemFontOfSize:12];
        _serviceAttitudeLabel.textColor = RGBColorHex(0x333333);
        _serviceAttitudeLabel.text = @"服务态度";
    }return _serviceAttitudeLabel;
}

- (UIButton *)button1_2{
    if (_button1_2 == nil) {
        _button1_2 = [[UIButton alloc]init];
        [_button1_2 setImage:[UIImage imageNamed:@"xingxing1"] forState:UIControlStateNormal];
        [_button1_2 setImage:[UIImage imageNamed:@"xingxing"] forState:UIControlStateSelected];
        [_button1_2 addTarget:self action:@selector(selectClick2:) forControlEvents:UIControlEventTouchUpInside];
        _button1_2.tag = 31;
    }return _button1_2;
}

- (UIButton *)button2_2{
    if (_button2_2 == nil) {
        _button2_2 = [[UIButton alloc]init];
        [_button2_2 setImage:[UIImage imageNamed:@"xingxing1"] forState:UIControlStateNormal];
        [_button2_2 setImage:[UIImage imageNamed:@"xingxing"] forState:UIControlStateSelected];
        [_button2_2 addTarget:self action:@selector(selectClick2:) forControlEvents:UIControlEventTouchUpInside];
        _button2_2.tag = 32;
    }return _button2_2;
}

- (UIButton *)button3_2{
    if (_button3_2 == nil) {
        _button3_2 = [[UIButton alloc]init];
        [_button3_2 setImage:[UIImage imageNamed:@"xingxing1"] forState:UIControlStateNormal];
        [_button3_2 setImage:[UIImage imageNamed:@"xingxing"] forState:UIControlStateSelected];
        [_button3_2 addTarget:self action:@selector(selectClick2:) forControlEvents:UIControlEventTouchUpInside];
        _button3_2.tag = 33;
    }return _button3_2;
}

- (UIButton *)button4_2{
    if (_button4_2 == nil) {
        _button4_2 = [[UIButton alloc]init];
        [_button4_2 setImage:[UIImage imageNamed:@"xingxing1"] forState:UIControlStateNormal];
        [_button4_2 setImage:[UIImage imageNamed:@"xingxing"] forState:UIControlStateSelected];
        [_button4_2 addTarget:self action:@selector(selectClick2:) forControlEvents:UIControlEventTouchUpInside];
        _button4_2.tag = 34;
    }return _button4_2;
}

- (UIButton *)button5_2{
    if (_button5_2 == nil) {
        _button5_2 = [[UIButton alloc]init];
        [_button5_2 setImage:[UIImage imageNamed:@"xingxing1"] forState:UIControlStateNormal];
        [_button5_2 setImage:[UIImage imageNamed:@"xingxing"] forState:UIControlStateSelected];
        [_button5_2 addTarget:self action:@selector(selectClick2:) forControlEvents:UIControlEventTouchUpInside];
        _button5_2.tag = 35;
    }return _button5_2;
}

- (UILabel *)evaluationLabel2{
    if (_evaluationLabel2 == nil) {
        _evaluationLabel2 = [[UILabel alloc]init];
        _evaluationLabel2.font = [UIFont systemFontOfSize:12];
        _evaluationLabel2.textColor = RGBColorHex(0x333333);
    }return _evaluationLabel2;
}

- (UILabel *)anonymousLabel{
    if (_anonymousLabel == nil) {
        _anonymousLabel = [[UILabel alloc]init];
        _anonymousLabel.font = [UIFont systemFontOfSize:12];
        _anonymousLabel.textColor = RGBColorHex(0x333333);
        _anonymousLabel.text = @"是否匿名";
    }return _anonymousLabel;
}

- (UIButton *)anonymousButton{
    if (_anonymousButton == nil) {
        _anonymousButton = [[UIButton alloc]init];
        [_anonymousButton setImage:[UIImage imageNamed:@"button_default"] forState:UIControlStateNormal];
        [_anonymousButton setImage:[UIImage imageNamed:@"button_click"] forState:UIControlStateSelected];
        [_anonymousButton addTarget:self action:@selector(anonymousClick:) forControlEvents:UIControlEventTouchUpInside];
    }return _anonymousButton;
}

- (UIImageView *)imageView{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc]init];
        _imageView.layer.borderColor = RGBColor(218, 221, 214).CGColor;
        _imageView.layer.borderWidth = 0.5f;

    }return _imageView;
}

- (UIImageView *)imageView1{
    if (_imageView1 == nil) {
        _imageView1 = [[UIImageView alloc]init];
        _imageView1.layer.borderColor = RGBColor(218, 221, 214).CGColor;
        _imageView1.layer.borderWidth = 0.5f;

    }return _imageView1;
}

- (UIImageView *)imageView2{
    if (_imageView2 == nil) {
        _imageView2 = [[UIImageView alloc]init];
        _imageView2.layer.borderColor = RGBColor(218, 221, 214).CGColor;
        _imageView2.layer.borderWidth = 0.5f;

    }return _imageView2;
}
- (UIImageView *)imageView3{
    if (_imageView3 == nil) {
        _imageView3 = [[UIImageView alloc]init];
        _imageView3.layer.borderColor = RGBColor(218, 221, 214).CGColor;
        _imageView3.layer.borderWidth = 0.5f;

    }return _imageView3;
}
- (UIImageView *)imageView4{
    if (_imageView4 == nil) {
        _imageView4 = [[UIImageView alloc]init];
        _imageView4.layer.borderColor = RGBColor(218, 221, 214).CGColor;
        _imageView4.layer.borderWidth = 0.5f;

    }return _imageView4;
}

- (UIButton *)addImageButton{
    if (_addImageButton == nil) {
        _addImageButton = [[UIButton alloc]init];
        [_addImageButton setImage:[UIImage imageNamed:@"jia"] forState:UIControlStateNormal];
        [_addImageButton addTarget:self action:@selector(addClick) forControlEvents:UIControlEventTouchUpInside];
    }return _addImageButton;

}



#pragma mark -- 方法
//选择评价
- (void)selectClick: (UIButton*)btn{
    if (btn.tag == 11) {
        btn.selected = YES;
        self.button2.selected = NO;
        self.button3.selected = NO;
        self.button4.selected = NO;
        self.button5.selected = NO;
        _evaluationLabel.text = @"很差";
    }else if (btn.tag == 12) {
        self.button1.selected = YES;
        self.button2.selected = YES;
        self.button3.selected = NO;
        self.button4.selected = NO;
        self.button5.selected = NO;
        _evaluationLabel.text = @"中等";
    }else if (btn.tag == 13){
        self.button1.selected = YES;
        self.button2.selected = YES;
        self.button3.selected = YES;
        self.button4.selected = NO;
        self.button5.selected = NO;
        _evaluationLabel.text = @"还行";
    }else if (btn.tag == 14){
        self.button1.selected = YES;
        self.button2.selected = YES;
        self.button3.selected = YES;
        self.button4.selected = YES;
        self.button5.selected = NO;
        _evaluationLabel.text = @"不错";
    }else if (btn.tag == 15){
        self.button1.selected = YES;
        self.button2.selected = YES;
        self.button3.selected = YES;
        self.button4.selected = YES;
        self.button5.selected = YES;
        _evaluationLabel.text = @"非常好";
     }

}
- (void)selectClick1: (UIButton*)btn{
    if (btn.tag == 21) {
        btn.selected = YES;
        self.button2_1.selected = NO;
        self.button3_1.selected = NO;
        self.button4_1.selected = NO;
        self.button5_1.selected = NO;
         _evaluationLabel1.text = @"很差";
    }else if (btn.tag == 22) {
            self.button1_1.selected = YES;
            self.button2_1.selected = YES;
            self.button3_1.selected = NO;
            self.button4_1.selected = NO;
            self.button5_1.selected = NO;
            _evaluationLabel1.text = @"中等";
        }else if (btn.tag == 23){
            self.button1_1.selected = YES;
            self.button2_1.selected = YES;
            self.button3_1.selected = YES;
            self.button4_1.selected = NO;
            self.button5_1.selected = NO;
            _evaluationLabel1.text = @"还行";
        }else if (btn.tag == 24){
            self.button1_1.selected = YES;
            self.button2_1.selected = YES;
            self.button3_1.selected = YES;
            self.button4_1.selected = YES;
            self.button5_1.selected = NO;
            _evaluationLabel1.text = @"不错";
        }else if (btn.tag == 25){
            self.button1_1.selected = YES;
            self.button2_1.selected = YES;
            self.button3_1.selected = YES;
            self.button4_1.selected = YES;
            self.button5_1.selected = YES;
            _evaluationLabel1.text = @"非常好";
    }
}
- (void)selectClick2: (UIButton*)btn{
    if (btn.tag == 31) {
        btn.selected = YES;
        self.button2_2.selected = NO;
        self.button3_2.selected = NO;
        self.button4_2.selected = NO;
        self.button5_2.selected = NO;
        _evaluationLabel1.text = @"很差";
    }else if (btn.tag == 32) {
            self.button1_2.selected = YES;
            self.button2_2.selected = YES;
            self.button3_2.selected = NO;
            self.button4_2.selected = NO;
            self.button5_2.selected = NO;
        _evaluationLabel2.text = @"中等";
        }else if (btn.tag == 33){
            self.button1_2.selected = YES;
            self.button2_2.selected = YES;
            self.button3_2.selected = YES;
            self.button4_2.selected = NO;
            self.button5_2.selected = NO;
            _evaluationLabel2.text = @"还行";
        }else if (btn.tag == 34){
            self.button1_2.selected = YES;
            self.button2_2.selected = YES;
            self.button3_2.selected = YES;
            self.button4_2.selected = YES;
            self.button5_2.selected = NO;
            _evaluationLabel2.text = @"不错";
        }else if (btn.tag == 35){
            self.button1_2.selected = YES;
            self.button2_2.selected = YES;
            self.button3_2.selected = YES;
            self.button4_2.selected = YES;
            self.button5_2.selected = YES;
            _evaluationLabel2.text = @"非常好";
    }
}

#pragma mark -- 方法
- (void)anonymousClick: (UIButton *)btn{
    btn.selected = !btn.selected;
}


- (void)rightButtonClick{//发布

    ZFFinishEvaluationVC *vc = [[ZFFinishEvaluationVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)addClick{
    //添加图片
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    imagePickerVc.allowTakeVideo = NO;
    imagePickerVc.naviBgColor = [UIColor blackColor];
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
    ZWeakSelf
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto)
     {
         [weakSelf uploadImage:[photos firstObject]];
     }];
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}

-(void)uploadImage:(UIImage*)image
{
    NSData *imageData = UIImageJPEGRepresentation(image, 1.0f);

    ZWeakSelf
    [http_user common_upload_pic:imageData success:^(id responseObject) {
         [weakSelf uploadImage_ok:responseObject];
     } failure:^(NSError *error) {
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
}

-(void)uploadImage_ok:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }

    NSString *file = responseObject[@"dir"];
    NSString* str = [NSString stringWithFormat:@"%@%@",ImageUrl,file];

    if (_imageView.image == nil) {
        [_imageView sd_setImageWithURL:[NSURL URLWithString:str]];
    }else if (_imageView1.image == nil){
        [_imageView1 sd_setImageWithURL:[NSURL URLWithString:str]];
    }else if (_imageView2.image == nil){
        [_imageView2 sd_setImageWithURL:[NSURL URLWithString:str]];
    }else if (_imageView3.image == nil){
        [_imageView3 sd_setImageWithURL:[NSURL URLWithString:str]];
    }else if (_imageView4.image == nil){
        [_imageView4 sd_setImageWithURL:[NSURL URLWithString:str]];
    }

}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    self.placeHolderLabel.hidden = YES;
}
@end
