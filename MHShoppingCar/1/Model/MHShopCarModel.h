//
//  MHShopCarModel.h
//  MHShoppingCar
//
//  Created by 哈哈 on 2018/10/10.
//  Copyright © 2018年 MengHeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MHDataManager.h"
@class MHItemInfoModel;

@interface MHShopCarModel : NSObject
@property(nonatomic,copy) NSString *count;//数量
@property(nonatomic,copy) NSString *item_id;//
@property(nonatomic,strong) MHItemInfoModel *item_info;//详情
@property(nonatomic,strong) MHDataManager *manager;///观察者
@property(nonatomic,assign)BOOL isSelect;



@end

/// 商品详情
@interface MHItemInfoModel : NSObject
@property(nonatomic,copy) NSString *full_name;//名称
@property(nonatomic,copy) NSString *icon;//图片
@property(nonatomic,copy) NSString *sale_price;//价格
@property(nonatomic,copy) NSString *type;//状态



@end


