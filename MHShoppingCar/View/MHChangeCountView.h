//
//  MHChangeCountView.h
//  MHShoppingCar
//
//  Created by 哈哈 on 2018/10/10.
//  Copyright © 2018年 MengHeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MHChangeCountView : UIView

@property (nonatomic,strong) UIButton *addBtn;///j增加
@property (nonatomic,strong) UIButton *reduceBtn;///j减少
@property (nonatomic,strong) UITextField *accountTextField;///输入框

-(instancetype)initWithFrame:(CGRect)frame;
@end

NS_ASSUME_NONNULL_END
