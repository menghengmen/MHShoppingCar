//
//  MHDataManager.m
//  MHShoppingCar
//
//  Created by 哈哈 on 2018/10/10.
//  Copyright © 2018年 MengHeng. All rights reserved.
//

#import "MHDataManager.h"
#import "MHShopCarModel.h"
#import <MJExtension/MJExtension.h>

@implementation MHDataManager

-(void)getShopCarData:(void (^)(NSArray * _Nonnull, NSArray * _Nonnull))shopDataBlock{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
    NSDictionary *dataDict = [NSDictionary dictionaryWithContentsOfFile:path];
    NSMutableArray *comonArr = [NSMutableArray new];
    NSMutableArray *luxruyArr = [NSMutableArray new];
    NSMutableArray *commonDataArr = [dataDict objectForKey:@"common"];
    NSMutableArray *luxruyDataArr = [dataDict objectForKey:@"Luxury"];

    for (int i =0;i <commonDataArr.count; i ++) {
         MHShopCarModel *model =   [MHShopCarModel mj_objectWithKeyValues:commonDataArr[i]];
        [comonArr addObject:model];
        
    }
    
    for (int i =0;i <luxruyDataArr.count; i ++) {
        MHShopCarModel *model =   [MHShopCarModel mj_objectWithKeyValues:luxruyDataArr[i]];
        [luxruyArr addObject:model];
        
    }
    shopDataBlock(comonArr,luxruyArr);
    
}


@end
