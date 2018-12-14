//
//  MHShoppingCarBottomView.h
//  MHShoppingCar
//
//  Created by 哈哈 on 2018/10/11.
//  Copyright © 2018年 MengHeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MHShoppingCarBottomView : UIView
@property(nonatomic,strong) UILabel*allPrice;///合计价格

-(instancetype)initWithFrame:(CGRect)frame;
@end

NS_ASSUME_NONNULL_END
