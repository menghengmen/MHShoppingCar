//
//  MHChangeCountView.m
//  MHShoppingCar
//
//  Created by 哈哈 on 2018/10/10.
//  Copyright © 2018年 MengHeng. All rights reserved.
//

#import "MHChangeCountView.h"

@implementation MHChangeCountView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self config];
    }
    
    return self;
}

-(void)config{
    
    self.reduceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.reduceBtn.frame = CGRectMake(0, 0, [UIImage imageNamed:@"product_detail_sub_normal"].size.width, [UIImage imageNamed:@"product_detail_sub_normal"].size.height);
    [self.reduceBtn setBackgroundImage:[UIImage imageNamed:@"product_detail_sub_normal"] forState:UIControlStateNormal];
    [self.reduceBtn setBackgroundImage:[UIImage imageNamed:@"product_detail_sub_no"] forState:UIControlStateDisabled];
    [self addSubview:self.reduceBtn];
    

    self.accountTextField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.reduceBtn.frame), 0, 40, self.reduceBtn.frame.size.height)];
    self.accountTextField.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.accountTextField];
    
    self.addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.addBtn.frame = CGRectMake(CGRectGetMaxY(self.accountTextField.frame)+self.accountTextField.frame.size.width, 0, [UIImage imageNamed:@"product_detail_add_normal"].size.width, [UIImage imageNamed:@"product_detail_add_normal"].size.height);
    [self.addBtn setBackgroundImage:[UIImage imageNamed:@"product_detail_add_normal"] forState:UIControlStateNormal];
    [self.addBtn setBackgroundImage:[UIImage imageNamed:@"product_detail_add_no"] forState:UIControlStateDisabled];
    [self addSubview:self.addBtn];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
