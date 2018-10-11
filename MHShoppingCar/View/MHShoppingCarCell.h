//
//  MHShoppingCarCell.h
//  MHShoppingCar
//
//  Created by 哈哈 on 2018/10/10.
//  Copyright © 2018年 MengHeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MHShopCarModel.h"

@protocol CellDelegate <NSObject>

-(void)changeGoodCountClick;///改变商品数量

@end

@interface MHShoppingCarCell : UITableViewCell
@property (nonatomic,strong) MHShopCarModel *model;
@property (nonatomic,weak)  id<CellDelegate>delegate;
@end

