//
//  MHShopCarHeaderView.m
//  MHShoppingCar
//
//  Created by 哈哈 on 2018/12/14.
//  Copyright © 2018 MengHeng. All rights reserved.
//

#import "MHShopCarHeaderView.h"
#import <Masonry/Masonry.h>

@interface MHShopCarHeaderView()
@property(nonatomic,strong) UIView *BGview;
@property(nonatomic,strong) UIButton *allSelectBtn;
@property(nonatomic,strong) UILabel *brandLabel;

@end

@implementation MHShopCarHeaderView
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self setUpUI];
    }
    return  self;
    
}

-(void)setUpUI{
    [self addSubview:self.BGview];
    [self addSubview:self.allSelectBtn];
    [self addSubview:self.brandLabel];
    
}

-(void)configShopHeaderViewWithBrandname:(NSString *)brandName brandSelect:(BOOL)brandSelect{
    self.brandLabel.text = brandName;
    self.allSelectBtn.selected = brandSelect;
}


-(void)allSelectButtonAction{
    self.allSelectBtn.selected = !self.allSelectBtn.selected;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self.BGview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
   
    [self.allSelectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.BGview).offset(5);
        make.centerY.equalTo(self.BGview);
        make.size.mas_equalTo(CGSizeMake(64, 64));
        
    }];
    
    [self.brandLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.allSelectBtn.mas_right).offset(0);
        make.width.equalTo(@200);
        make.height.equalTo(@40);
        
    }];
}

#pragma mark lazy init
-(UIView*)BGview{
    if (!_BGview) {
        _BGview = [UIView new];
        _BGview.backgroundColor = [UIColor whiteColor];
    }
    return _BGview;
    
}

-(UIButton*)allSelectBtn{
    
    if (!_allSelectBtn) {
        _allSelectBtn = [UIButton new];
        [_allSelectBtn setImage:[UIImage imageNamed:@"Unselected"] forState:UIControlStateNormal];
        [_allSelectBtn setImage:[UIImage imageNamed:@"Selected"] forState:UIControlStateSelected];
        [_allSelectBtn addTarget:self action:@selector(allSelectButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _allSelectBtn;
}

-(UILabel*)brandLabel{
    if (!_brandLabel) {
        _brandLabel = [UILabel new];
        _brandLabel.textColor = [UIColor blackColor];
        _brandLabel.font = [UIFont systemFontOfSize:14];
    }
    
    return _brandLabel;
}


@end
