//
//  MHShoppingCarBottomView.m
//  MHShoppingCar
//
//  Created by 哈哈 on 2018/10/11.
//  Copyright © 2018年 MengHeng. All rights reserved.
//

#import "MHShoppingCarBottomView.h"

#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width

@interface MHShoppingCarBottomView()
@property(nonatomic,strong) UIButton*allSelectBtn;///全选
@property(nonatomic,strong) UIButton*submitBtn;///结算


@end

@implementation MHShoppingCarBottomView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self config];
    }
    return self;
}

-(void)config{
    UIImage *btimg = [UIImage imageNamed:@"ic_cb_normal.png"];
    UIImage *selectImg = [UIImage imageNamed:@"ic_cb_checked"];
    
    self.allSelectBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, btimg.size.width +60, 44)];
    [self.allSelectBtn setImage:btimg forState:UIControlStateNormal];
    [self.allSelectBtn setImage:selectImg forState:UIControlStateSelected];
    [self.allSelectBtn addTarget:self action:@selector(allSelectBtClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.allSelectBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.allSelectBtn.titleLabel setFont:[UIFont systemFontOfSize:13]];
    [self.allSelectBtn setTitle:@"全选" forState:UIControlStateNormal];
    [self.allSelectBtn setTitle:@"取消全选" forState:UIControlStateSelected];

    [self addSubview:self.allSelectBtn];
    
    
    self.allPrice = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.allSelectBtn.frame), 0, 100, 44)];
    self.allPrice.font = [UIFont systemFontOfSize:13];
    self.allPrice.text = @"合计:0";
    [self addSubview:self.allPrice];
    
    self.submitBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth-90, 10, 80, 30)];
    [self.submitBtn setTitle:@"结算" forState:UIControlStateNormal];
    self.submitBtn.backgroundColor = [UIColor redColor];
    [self addSubview:self.submitBtn];

}

#pragma mark Action
-(void)allSelectBtClick:(UIButton*)btn{
    btn.selected = !btn.selected;
}




@end
