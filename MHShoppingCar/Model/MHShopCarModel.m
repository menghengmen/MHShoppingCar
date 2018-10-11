//
//  MHShopCarModel.m
//  MHShoppingCar
//
//  Created by 哈哈 on 2018/10/10.
//  Copyright © 2018年 MengHeng. All rights reserved.
//

#import "MHShopCarModel.h"

@implementation MHShopCarModel

-(void)setManager:(MHDataManager *)manager{
    _manager = manager;
    [self addObserver:manager forKeyPath:@"isSelect" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
}

-(void)dealloc{
    [self removeObserver:_manager forKeyPath:@"isSelect"];
}


@end

@implementation MHItemInfoModel



@end
