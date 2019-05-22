//
//  ZFGoodDetailVC.m
//  ZF
//
//  Created by weiming zhang on 2019/4/28.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFGoodDetailVC.h"
#import <SDCycleScrollView.h>
#import "ZFSpellListCell.h"
#import "ZFSpellListHeaderView.h"
#import "ZFEvaluationVC.h"
#import "http_groupbuy.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "ZFBuyToolBarView.h"
#import "ZFAssembleModel.h"
#import "ZFSearchModel.h"
#import "ZFTool.h"


@interface ZFGoodDetailVC ()<SDCycleScrollViewDelegate,UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)UIButton *backButton;
@property (nonatomic, strong)UIButton *shareButton;
/* 轮播图 */
@property (strong , nonatomic)SDCycleScrollView *cycleScrollView;
@property (nonatomic, strong)NSMutableArray *imageUrls;

@property (nonatomic, strong)UILabel *activityNameLabel;
@property (nonatomic, strong)UILabel *endTimeLabel;
@property (nonatomic, strong)UILabel *goodNameLabel;
@property (nonatomic, strong)UIButton *priceButton;
@property (nonatomic, strong)UIButton *oldPriceButton;
@property (nonatomic, strong)UILabel *FreightLabel;
@property (nonatomic, strong)UILabel *groupBuyNumber;

@property (nonatomic, strong)UILabel *evaluationLabel;
@property (nonatomic, strong)UILabel *commentRateLabel;
@property (nonatomic, strong)UILabel *commentNumber;
@property (nonatomic, strong)UIImageView *jumpImageView;
@property (nonatomic, strong)UIButton *jumpButton;
@property (nonatomic, strong)UIButton *praiseButton;
@property (nonatomic, strong)UIButton *mediumReviewButton;
@property (nonatomic, strong)UIButton *badReviewButton;
@property (nonatomic, strong)UIButton *baskInButton;

@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic, strong)UIImageView *imageView1;
@property (nonatomic, strong)UIImageView *imageView2;
@property (nonatomic, strong)UIImageView *imageView3;
@property (nonatomic, strong)UIImageView *imageView4;
@property (nonatomic, strong)UILabel *writeTimeLabel;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UIImageView *goodImgView;
@property (nonatomic, strong)UIImageView *goodImgView1;
@property (nonatomic, strong)UIImageView *goodImgView2;

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)ZFSpellListHeaderView *headerView;
@property (nonatomic, strong)ZFBuyToolBarView *toolView;

@property (nonatomic, strong)ZFAssembleListModel *listModel;
@end

@implementation ZFGoodDetailVC

static NSString *const ZFSpellListCellID = @"ZFSpellListCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"fenxiang"] style:UIBarButtonItemStylePlain target:self action:@selector(shareClick)];
    [self setup];
}

- (void)setup{
    
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.cycleScrollView];
    [self.cycleScrollView addSubview:self.backButton];
    [self.cycleScrollView addSubview:self.shareButton];
    [self.scrollView addSubview:self.activityNameLabel];
    [self.scrollView addSubview:self.endTimeLabel];
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = RGBColor(245, 245, 245);
    [self.scrollView addSubview:lineView];
    [self.scrollView addSubview:self.goodNameLabel];
    [self.scrollView addSubview:self.priceButton];
    [self.scrollView addSubview:self.oldPriceButton];
    [self.scrollView addSubview:self.FreightLabel];
    [self.scrollView addSubview:self.groupBuyNumber];
    UIView *lineView2 = [[UIView alloc]init];
    lineView2.backgroundColor = RGBColor(245, 245, 245);
    [self.scrollView addSubview:lineView2];
    
    [self.scrollView addSubview:self.evaluationLabel];
    [self.scrollView addSubview:self.commentRateLabel];
    [self.scrollView addSubview:self.commentNumber];
    [self.scrollView addSubview:self.jumpImageView];
    [self.scrollView addSubview:self.jumpButton];
    UIView *lineView3 = [[UIView alloc]init];
    lineView3.backgroundColor = RGBColor(245, 245, 245);
    [self.scrollView addSubview:lineView3];
    [self.scrollView addSubview:self.praiseButton];
    [self.scrollView addSubview:self.mediumReviewButton];
    [self.scrollView addSubview:self.badReviewButton];
    [self.scrollView addSubview:self.baskInButton];
    
    [self.scrollView addSubview:self.nameLabel];
    [self.scrollView addSubview:self.imageView];
    [self.scrollView addSubview:self.imageView1];
    [self.scrollView addSubview:self.imageView2];
    [self.scrollView addSubview:self.imageView3];
    [self.scrollView addSubview:self.imageView4];
    [self.scrollView addSubview:self.writeTimeLabel];
    [self.scrollView addSubview:self.titleLabel];
    [self.scrollView addSubview:self.goodImgView];
    [self.scrollView addSubview:self.goodImgView1];
    [self.scrollView addSubview:self.goodImgView2];
    UIView *lineView4 = [[UIView alloc]init];
    lineView4.backgroundColor = RGBColor(245, 245, 245);
    [self.scrollView addSubview:lineView4];
    [self.scrollView addSubview:self.tableView];
    
    self.headerView = [[ZFSpellListHeaderView alloc]initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, 35)];
    
    self.tableView.tableHeaderView = self.headerView;
    
    self.toolView = [[ZFBuyToolBarView alloc]init];
    [self.view addSubview:self.toolView];
    
    [_activityNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cycleScrollView.mas_bottom).with.offset(15);
        make.left.equalTo(self.view).with.offset(25);
    }];
    
    [_endTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cycleScrollView.mas_bottom).with.offset(15);
        make.right.equalTo(self.view).with.offset(-25);
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.activityNameLabel.mas_bottom).with.offset(15);
        make.height.mas_equalTo(1);
    }];
    
    [_goodNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).with.offset(10);
        make.left.equalTo(self.view).with.offset(25);
    }];
    
    [_priceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(25);
        make.top.equalTo(self.goodNameLabel.mas_bottom).with.offset(10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(25);
    }];
    
    [_oldPriceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.priceButton.mas_right);
        make.top.equalTo(self.priceButton.mas_top);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(25);
    }];

    [_FreightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.priceButton.mas_bottom).with.offset(10);
        make.left.equalTo(self.priceButton.mas_left);
    }];

    [_groupBuyNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).with.offset(-25);
        make.top.equalTo(lineView.mas_bottom).with.offset(50);
    }];
    
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.FreightLabel.mas_bottom).with.offset(7);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(10);
    }];
    
    [_evaluationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView2.mas_bottom).with.offset(10);
        make.left.equalTo(self.view).with.offset(25);
    }];
    
    [_commentRateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.evaluationLabel.mas_right).with.offset(5);
        make.bottom.equalTo(self.evaluationLabel.mas_bottom).with.offset(-5);
    }];
    
    [_jumpImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).with.offset(-25);
        make.bottom.equalTo(self.evaluationLabel.mas_bottom).with.offset(-5);
    }];

    [_commentNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.jumpImageView.mas_left).with.offset(-10);
        make.bottom.equalTo(self.evaluationLabel.mas_bottom).with.offset(-5);
    }];
    
    [_jumpButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView2.mas_bottom);
        make.right.equalTo(self.view);
        make.width.mas_equalTo(130);
        make.bottom.equalTo(self.evaluationLabel.mas_bottom).with.offset(-5);
    }];
    
    [lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.evaluationLabel.mas_bottom).with.offset(15);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(1);
    }];
    
    [_praiseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(25);
        make.top.equalTo(lineView3.mas_bottom).with.offset(15);
        make.width.mas_equalTo(71);
        make.height.mas_equalTo(25);
    }];
    
    [_mediumReviewButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.praiseButton.mas_right).with.offset(10);
        make.top.equalTo(lineView3.mas_bottom).with.offset(15);
        make.width.mas_equalTo(71);
        make.height.mas_equalTo(25);
    }];
    
    [_badReviewButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mediumReviewButton.mas_right).with.offset(10);
        make.top.equalTo(lineView3.mas_bottom).with.offset(15);
        make.width.mas_equalTo(71);
        make.height.mas_equalTo(25);
    }];
    
    [_baskInButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.badReviewButton.mas_right).with.offset(10);
        make.top.equalTo(lineView3.mas_bottom).with.offset(15);
        make.width.mas_equalTo(71);
        make.height.mas_equalTo(25);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(25);
        make.top.equalTo(self.praiseButton.mas_bottom).with.offset(23);
    }];
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_right).with.offset(10);
        make.centerY.equalTo(self.nameLabel.mas_centerY);
    }];
    [_imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageView.mas_right).with.offset(2.5);
        make.centerY.equalTo(self.nameLabel.mas_centerY);
    }];
    [_imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageView1.mas_right).with.offset(2.5);
        make.centerY.equalTo(self.nameLabel.mas_centerY);
    }];
    [_imageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageView2.mas_right).with.offset(2.5);
        make.centerY.equalTo(self.nameLabel.mas_centerY);
    }];
    [_imageView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageView3.mas_right).with.offset(2.5);
        make.centerY.equalTo(self.nameLabel.mas_centerY);
    }];
    
    [_writeTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).with.offset(-25);
        make.centerY.equalTo(self.nameLabel.mas_centerY);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).with.offset(20);
        make.left.equalTo(self.view).with.offset(25);
        make.right.equalTo(self.view).with.offset(-50);
    }];
    
    [_goodImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(10);
        make.left.equalTo(self.view).with.offset(25);
        make.width.height.mas_equalTo(55);
    }];
    [_goodImgView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(10);
        make.left.equalTo(self.goodImgView.mas_right).with.offset(10);
        make.width.height.mas_equalTo(55);
    }];
    [_goodImgView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(10);
        make.left.equalTo(self.goodImgView1.mas_right).with.offset(10);
        make.width.height.mas_equalTo(55);
    }];
    
    [lineView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodImgView.mas_bottom).with.offset(15);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(10);
    }];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView4.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(150);
    }];
    
    [_toolView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(50);
        make.left.right.bottom.equalTo(self.view);
    }];
    
    
}

- (void)setTeam_id:(NSInteger)team_id{
    _team_id = team_id;
    [http_groupbuy detail:self.team_id success:^(id responseObject) {
        [self showData:responseObject];
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.domain];
    }];
}

- (void)showData: (id)responseObject{
    if (kObjectIsEmpty(responseObject)) {
        return;
    }
    self.listModel = [ZFAssembleListModel mj_objectWithKeyValues:responseObject];
    ZFAssembleModel *detailModel = self.listModel.info;
    for (int i=0; i<self.listModel.goodsImg.count; i++)
    {
        ZFGoodsImageModel *imageModel = [self.listModel.goodsImg objectAtIndex:i];
        NSString* str = [NSString stringWithFormat:@"%@%@",ImageUrl,imageModel.image_url];
        [self.imageUrls addObject:str];
    }
    _cycleScrollView.imageURLStringsGroup = self.imageUrls;
//    团购类型：1小团，2大团，3 阶梯团
    if (!kStringIsEmpty(detailModel.cluster_type)) {
        if (detailModel.cluster_type.integerValue == 1) {
            _activityNameLabel.text = @"小团";
        }else if (detailModel.cluster_type.integerValue == 2){
            _activityNameLabel.text = @"大团";
        }else if (detailModel.cluster_type.integerValue == 3){
            _activityNameLabel.text = @"阶级团";
        }
    }
    _endTimeLabel.text = [ZFTool startDate:detailModel.end_time];
    _goodNameLabel.text = detailModel.goods_name;
    [_priceButton setTitle:[NSString stringWithFormat:@"￥%@起",detailModel.shop_price] forState:UIControlStateNormal];
     [_oldPriceButton setTitle:[NSString stringWithFormat:@"￥%@起",detailModel.market_price] forState:UIControlStateNormal];
    _groupBuyNumber.text = [NSString stringWithFormat:@"已团%@件",detailModel.sales_sum];
    ZFGoodCommentModel *commentModel = self.listModel.info.comment_fr;
    _commentRateLabel.text = [NSString stringWithFormat:@"好评  %ld",commentModel.high_rate];
    _commentNumber.text = [NSString stringWithFormat:@"共%ld+条评论",commentModel.total_sum];
    [_praiseButton setTitle:[NSString stringWithFormat:@"好评(%ld+)",commentModel.high_sum] forState:UIControlStateNormal];
    [_mediumReviewButton setTitle:[NSString stringWithFormat:@"中评(%ld+)",commentModel.center_sum] forState:UIControlStateNormal];
    [_badReviewButton setTitle:[NSString stringWithFormat:@"差评(%ld+)",commentModel.low_sum] forState:UIControlStateNormal];
    [_baskInButton setTitle:[NSString stringWithFormat:@"晒图(%ld+)",commentModel.img_sum] forState:UIControlStateNormal];
    self.headerView.team_found_num = self.listModel.team_found_num;
    self.toolView.assembleModel = self.listModel;
}

- (UIScrollView *)scrollView{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, LL_ScreenHeight-47)];
        _scrollView.delegate = self;
        _scrollView.contentSize = CGSizeMake(0,970);
        _scrollView.showsVerticalScrollIndicator = NO;
    }return _scrollView;
}


- (SDCycleScrollView *)cycleScrollView{
    if (_cycleScrollView == nil) {
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, LL_ScreenWidth, 423) delegate:self placeholderImage:nil];
        _cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
        _cycleScrollView.autoScrollTimeInterval = 3.0;
        _cycleScrollView.imageURLStringsGroup = self.imageUrls;
    }return _cycleScrollView;
}

-(NSMutableArray*)imageUrls
{
    if (_imageUrls==nil) {
        _imageUrls = [[NSMutableArray alloc]init];
    }
    return _imageUrls;
}

- (UILabel *)activityNameLabel{
    if (_activityNameLabel == nil) {
        _activityNameLabel = [[UILabel alloc]init];
        _activityNameLabel.font = [UIFont systemFontOfSize:14];
        _activityNameLabel.textColor = RGBColor(232, 47, 92);
        _activityNameLabel.text = @"小团";
    }return _activityNameLabel;
}

- (UILabel *)endTimeLabel{
    if (_endTimeLabel == nil) {
        _endTimeLabel = [[UILabel alloc]init];
        _endTimeLabel.font = [UIFont systemFontOfSize:12];
        _endTimeLabel.textColor = RGBColor(232, 47, 92);
        _endTimeLabel.text = @"距离结束还有00:10:00";
    }return _endTimeLabel;
}

- (UILabel *)goodNameLabel{
    if (_goodNameLabel == nil) {
        _goodNameLabel = [[UILabel alloc]init];
        _goodNameLabel.font = [UIFont systemFontOfSize:16];
        _goodNameLabel.textColor = RGBColor(51, 51, 51);
        _goodNameLabel.text = @"Dior /迪奥 黑色羊毛真丝排扣夹克";
    }return _goodNameLabel;
}

- (UIButton *)priceButton{
    if (_priceButton == nil) {
        _priceButton = [[UIButton alloc]init];
        _priceButton.backgroundColor = RGBColor(232, 47, 92);
        _priceButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [_priceButton setTitle:@"￥279起" forState:UIControlStateNormal];
        [_priceButton setTitleColor:RGBColor(255, 255, 255) forState:UIControlStateNormal];
    }return _priceButton;
}

- (UIButton *)oldPriceButton{
    if (_oldPriceButton == nil) {
        _oldPriceButton = [[UIButton alloc]init];
        _oldPriceButton.layer.borderWidth = 1;
        _oldPriceButton.layer.borderColor = RGBColor(232, 47, 92).CGColor;
        _oldPriceButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [_oldPriceButton setTitle:@"￥279起" forState:UIControlStateNormal];
        [_oldPriceButton setTitleColor:RGBColor(153, 153, 153) forState:UIControlStateNormal];
        [self createLineInView:_oldPriceButton Mark:0];
    }return _oldPriceButton;
}

- (UILabel *)FreightLabel{
    if (_FreightLabel == nil) {
        _FreightLabel = [[UILabel alloc]init];
        _FreightLabel.font = [UIFont systemFontOfSize:10];
        _FreightLabel.textColor = RGBColor(153, 153, 153);
        _FreightLabel.text = @"运费：免运费";
    }return _FreightLabel;
}

- (UILabel *)groupBuyNumber{
    if (_groupBuyNumber == nil) {
        _groupBuyNumber = [[UILabel alloc]init];
        _groupBuyNumber.font = [UIFont systemFontOfSize:13];
        _groupBuyNumber.textColor = RGBColor(102, 102, 102);
        _groupBuyNumber.text = @"已团20件";
    }return _groupBuyNumber;
}

- (UILabel *)evaluationLabel{
    if (_evaluationLabel == nil) {
        _evaluationLabel = [[UILabel alloc]init];
        _evaluationLabel.font = [UIFont systemFontOfSize:15];
        _evaluationLabel.textColor = RGBColor(51, 51, 51);
        _evaluationLabel.text = @"评价";
    }return _evaluationLabel;
}

- (UILabel *)commentRateLabel{
    if (_commentRateLabel == nil) {
        _commentRateLabel = [[UILabel alloc]init];
        _commentRateLabel.font = [UIFont systemFontOfSize:12];
        _commentRateLabel.textColor = RGBColor(232, 47, 92);
        _commentRateLabel.text = @"好评  100%";
    }return _commentRateLabel;
}

- (UIImageView *)jumpImageView{
    if (_jumpImageView == nil) {
        _jumpImageView = [[UIImageView alloc]init];
        _jumpImageView.image = [UIImage imageNamed:@"youjiantou"];
    }return _jumpImageView;
}

- (UILabel *)commentNumber{
    if (_commentNumber == nil) {
        _commentNumber = [[UILabel alloc]init];
        _commentNumber.font = [UIFont systemFontOfSize:10];
        _commentNumber.textColor = RGBColor(153, 153, 153);
        _commentNumber.text = @"共200+条评论";
    }return _commentNumber;
}

- (UIButton *)jumpButton{
    if (_jumpButton == nil) {
        _jumpButton = [[UIButton alloc]init];
        [_jumpButton addTarget:self action:@selector(jumpEvaluation) forControlEvents:UIControlEventTouchUpInside];
    }return _jumpButton;
}

- (UIButton *)praiseButton{
    if (_praiseButton == nil) {
        _praiseButton = [[UIButton alloc]init];
        _praiseButton.backgroundColor = RGBColor(254, 240, 240);
        _praiseButton.titleLabel.font = [UIFont systemFontOfSize:10];
        [_praiseButton setTitle:@"好评(200+)" forState:UIControlStateNormal];
        [_praiseButton setTitleColor:RGBColor(153, 153, 153) forState:UIControlStateNormal];
        [_praiseButton addTarget:self action:@selector(jumpEvaluation) forControlEvents:UIControlEventTouchUpInside];
    }return _praiseButton;
}

- (UIButton *)mediumReviewButton{
    if (_mediumReviewButton == nil) {
        _mediumReviewButton = [[UIButton alloc]init];
        _mediumReviewButton.backgroundColor = RGBColor(254, 240, 240);
        _mediumReviewButton.titleLabel.font = [UIFont systemFontOfSize:10];
        [_mediumReviewButton setTitle:@"中评(0)" forState:UIControlStateNormal];
        [_mediumReviewButton setTitleColor:RGBColor(153, 153, 153) forState:UIControlStateNormal];
        [_mediumReviewButton addTarget:self action:@selector(jumpEvaluation) forControlEvents:UIControlEventTouchUpInside];
    }return _mediumReviewButton;
}

- (UIButton *)badReviewButton{
    if (_badReviewButton == nil) {
        _badReviewButton = [[UIButton alloc]init];
        _badReviewButton.backgroundColor = RGBColor(254, 240, 240);
        _badReviewButton.titleLabel.font = [UIFont systemFontOfSize:10];
        [_badReviewButton setTitle:@"差评(0)" forState:UIControlStateNormal];
        [_badReviewButton setTitleColor:RGBColor(153, 153, 153) forState:UIControlStateNormal];
        [_badReviewButton addTarget:self action:@selector(jumpEvaluation) forControlEvents:UIControlEventTouchUpInside];
    }return _badReviewButton;
}

- (UIButton *)baskInButton{
    if (_baskInButton == nil) {
        _baskInButton = [[UIButton alloc]init];
        _baskInButton.backgroundColor = RGBColor(254, 240, 240);
        _baskInButton.titleLabel.font = [UIFont systemFontOfSize:10];
        [_baskInButton setTitle:@"晒图(0)" forState:UIControlStateNormal];
        [_baskInButton setTitleColor:RGBColor(153, 153, 153) forState:UIControlStateNormal];
        [_baskInButton addTarget:self action:@selector(jumpEvaluation) forControlEvents:UIControlEventTouchUpInside];
    }return _baskInButton;
}

- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = [UIFont systemFontOfSize:10];
        _nameLabel.textColor = RGBColor(51, 51, 51);
        _nameLabel.text = @"l***e";
    }return _nameLabel;
}

- (UIImageView *)imageView{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc]init];
        _imageView.image = [UIImage imageNamed:@"xingxing"];
    }return _imageView;
}
- (UIImageView *)imageView1{
    if (_imageView1 == nil) {
        _imageView1 = [[UIImageView alloc]init];
        _imageView1.image = [UIImage imageNamed:@"xingxing"];
    }return _imageView1;
}
- (UIImageView *)imageView2{
    if (_imageView2 == nil) {
        _imageView2 = [[UIImageView alloc]init];
        _imageView2.image = [UIImage imageNamed:@"xingxing"];
    }return _imageView2;
}
- (UIImageView *)imageView3{
    if (_imageView3 == nil) {
        _imageView3 = [[UIImageView alloc]init];
        _imageView3.image = [UIImage imageNamed:@"xingxing"];
    }return _imageView3;
}
- (UIImageView *)imageView4{
    if (_imageView4 == nil) {
        _imageView4 = [[UIImageView alloc]init];
        _imageView4.image = [UIImage imageNamed:@"xingxing"];
    }return _imageView4;
}

- (UILabel *)writeTimeLabel{
    if (_writeTimeLabel == nil) {
        _writeTimeLabel = [[UILabel alloc]init];
        _writeTimeLabel.font = [UIFont systemFontOfSize:10];
        _writeTimeLabel.textColor = RGBColor(153, 153, 153);
        _writeTimeLabel.text = @"2019-04-28";
    }return _writeTimeLabel;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:10];
        _titleLabel.textColor = RGBColor(51, 51, 51);
        _titleLabel.numberOfLines = 0;
        _titleLabel.text = @"东西收到了，衣服超级好看，特别适合我，也不掉毛凸显了黑色的高贵跟高雅，特别适合我非常感谢店家五星好评";
    }return _titleLabel;
}

- (UIImageView *)goodImgView{
    if (_goodImgView == nil) {
        _goodImgView = [[UIImageView alloc]init];
        _goodImgView.image = [UIImage imageNamed:@"Picture"];
    }return _goodImgView;
}
- (UIImageView *)goodImgView1{
    if (_goodImgView1 == nil) {
        _goodImgView1 = [[UIImageView alloc]init];
        _goodImgView1.image = [UIImage imageNamed:@"Picture"];
    }return _goodImgView1;
}
- (UIImageView *)goodImgView2{
    if (_goodImgView2 == nil) {
        _goodImgView2 = [[UIImageView alloc]init];
        _goodImgView2.image = [UIImage imageNamed:@"Picture"];
    }return _goodImgView2;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[ZFSpellListCell class] forCellReuseIdentifier:ZFSpellListCellID];
        _tableView.rowHeight = 45;
    }return _tableView;
}



#pragma mark - 点击图片Bannar跳转
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"点击了%zd轮播图",index);
}

/**
 * UILabel、UIButton的删除线/下划线
 * mark = 0 删除线、= 1 下划线
 */
- (void)createLineInView:(UIView *)theView Mark:(NSInteger)mark {
    NSString *tempStr = @"";
    UIButton *tempBut;
    if ([[theView class] isSubclassOfClass:[UIButton class]]) {
        tempBut = (UIButton *)theView;
        tempStr = tempBut.titleLabel.text;
    }
    UILabel *tempLab;
    if ([[theView class] isSubclassOfClass:[UILabel class]]) {
        tempLab = (UILabel *)theView;
        tempStr = tempLab.text;
    }
    if (theView && ![tempStr isEqualToString:@""]) {
        // 获取字符串的长度
        NSUInteger length = [tempStr length];
        // 设置富文本的属性
        NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:tempStr];
        if (mark == 1) {
            // 下划线
            [attri addAttribute:NSUnderlineStyleAttributeName
                          value:@(NSUnderlineStyleSingle)
                          range:NSMakeRange(0, length)];
        } else {
            // 删除线
            [attri addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlineStyleSingle)  range:NSMakeRange(0, length)];
        }
        if (tempBut) {
            [tempBut setAttributedTitle:attri forState:UIControlStateNormal];
        }
        if (tempLab) {
            [tempLab setAttributedText:attri];
        }
    }
}

#pragma mark --方法


- (void)shareClick{
    //分享界面
}

- (void)jumpEvaluation{
    //跳到评价界面
    ZFEvaluationVC *vc = [[ZFEvaluationVC alloc]init];
    vc.goods_id = self.listModel.info.goods_id;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark --tableview协议
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.listModel.team_found.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZFSpellListCell *cell = [tableView dequeueReusableCellWithIdentifier:ZFSpellListCellID forIndexPath:indexPath];
    ZFTeamFoundModel *teamModel = [self.listModel.team_found objectAtIndex:indexPath.row];
    cell.teamModel = teamModel;
    return cell;
}
@end
