//
//  MHShoppingCarCell.m
//  MHShoppingCar
//
//  Created by 哈哈 on 2018/10/10.
//  Copyright © 2018年 MengHeng. All rights reserved.
//

#import "MHShoppingCarCell.h"
#import "MHChangeCountView.h"
#import <SDWebImage/UIImageView+WebCache.h>

#define APPScreenHeight [[UIScreen mainScreen] bounds].size.height
#define APPScreenWidth [[UIScreen mainScreen] bounds].size.width

@interface MHShoppingCarCell()
@property(nonatomic,strong)UIButton *selectBt;///选择
@property(nonatomic,strong)UIImageView *shoppingImgView;///图片
@property(nonatomic,strong)UILabel *titleLabel;///商品的标题
@property(nonatomic,strong)UILabel *priceLab;///价格
@property(nonatomic,strong)MHChangeCountView *changeCountView;///价格
@property(nonatomic,assign)NSInteger goodAccount;///商品数量



@end

@implementation MHShoppingCarCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.goodAccount = 0;
        [self config];
    }
    return  self;
}

-(void)config{
    
    UIImage *btimg = [UIImage imageNamed:@"ic_cb_normal.png"];
    UIImage *selectImg = [UIImage imageNamed:@"ic_cb_checked"];
    
    self.selectBt = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, btimg.size.width +20, 44)];
    [self.selectBt setImage:btimg forState:UIControlStateNormal];
    [self.selectBt setImage:selectImg forState:UIControlStateSelected];
    [self.selectBt addTarget:self action:@selector(selectBtClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.selectBt];
    
    
    self.shoppingImgView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.selectBt.frame)+7, 12, 60, 60)];
    self.shoppingImgView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:self.shoppingImgView];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.shoppingImgView.frame)+10, 12, APPScreenWidth - CGRectGetMaxX(self.shoppingImgView.frame) -5, 10)];
    self.titleLabel.text = @"没法打开什么开门方式肯定积木小孩纸的玩具";
    [self addSubview:self.titleLabel];
    
    self.priceLab = [[UILabel alloc]initWithFrame:CGRectMake(APPScreenWidth-18-100, CGRectGetMaxY(self.titleLabel.frame)+44, 100, 17)];
    self.priceLab.textAlignment=NSTextAlignmentRight;
    self.priceLab.font=[UIFont systemFontOfSize:14];
    self.priceLab.text = @"￥100.00";
    [self.contentView addSubview:self.priceLab];
    
    self.changeCountView = [[MHChangeCountView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.shoppingImgView.frame)+10, CGRectGetMaxY(self.titleLabel.frame)+40, 160, 35)];
    [self.changeCountView.addBtn addTarget:self action:@selector(addAccount) forControlEvents:UIControlEventTouchUpInside];
    [self.changeCountView.reduceBtn addTarget:self action:@selector(reduceAccount) forControlEvents:UIControlEventTouchUpInside];
    self.changeCountView.accountTextField.text = [NSString stringWithFormat:@"%ld",self.goodAccount];
    [self addSubview:self.changeCountView];



}

-(void)setModel:(MHShopCarModel *)model{
    _model = model;
    [self.shoppingImgView sd_setImageWithURL:[NSURL URLWithString:model.item_info.icon]];
    self.changeCountView.accountTextField.text = model.count;
    self.goodAccount = [model.count integerValue];
    self.titleLabel.text = model.item_info.full_name;
    self.priceLab.text = model.item_info.sale_price;
}



#pragma  mark Action

-(void)selectBtClick:(UIButton*)btn{
    _selectBt.selected = !_selectBt.selected;
    _model.isSelect = btn.selected;
    
}
-(void)addAccount{
    self.goodAccount ++;
    self.changeCountView.accountTextField.text = [NSString stringWithFormat:@"%ld",(long)self.goodAccount];
    _model.count = self.changeCountView.accountTextField.text;
    [self.delegate changeGoodCountClick];
    
}

-(void)reduceAccount{
    self.goodAccount --;
    self.changeCountView.accountTextField.text = [NSString stringWithFormat:@"%ld",(long)self.goodAccount];
    _model.count = self.changeCountView.accountTextField.text;
    [self.delegate changeGoodCountClick];

    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
