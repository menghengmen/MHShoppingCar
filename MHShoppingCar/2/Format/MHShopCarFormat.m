//
//  MHShopCarFormat.m
//  MHShoppingCar
//
//  Created by 哈哈 on 2018/12/14.
//  Copyright © 2018 MengHeng. All rights reserved.
//

#import "MHShopCarFormat.h"
#import "MHBrandModel.h"
#import <MJExtension/MJExtension.h>
#import <UIKit/UIKit.h>

@interface MHShopCarFormat()

@property (nonatomic, strong) NSMutableArray *shopcartListArray;    /**< 购物车数据源 */
@end

@implementation MHShopCarFormat
-(void)requestShopCarData{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"shopcart" ofType:@"plist"];
    NSMutableArray *arr = [NSMutableArray arrayWithContentsOfFile:path];
    self.shopcartListArray = [MHBrandModel mj_objectArrayWithKeyValuesArray:arr];
    [self.delegate shopCarFormatRequestData:self.shopcartListArray];
    
}
-(void)selectBrandWithSection:(NSInteger)section isSelected:(BOOL)selected{
    MHBrandModel *brand = self.shopcartListArray[section];
    brand.isSelect = selected;
    for (MHProductModel *productModel in brand.products) {
        productModel.isSelected = brand.isSelect;
    }
    [self.delegate shopCarBrandSelected];

}

-(void)selectProductWith:(NSIndexPath *)index isSelected:(BOOL)selected{
    
    MHBrandModel *brandModel = self.shopcartListArray[index.section];
    MHProductModel *productModel = brandModel.products[index.row];
    productModel.isSelected = selected;
    
    BOOL isBrandSelected = YES;
    
    for (MHProductModel *aProductModel in brandModel.products) {
        if (aProductModel.isSelected == NO) {
            isBrandSelected = NO;
        }
    }
    
    brandModel.isSelect = isBrandSelected;
    [self.delegate shopCarIsAllSelected:[self isAllSelected]];
}

-(BOOL)isAllSelected{
    if (self.shopcartListArray.count == 0) {
        return NO;
    }
    BOOL isBrandSelected = YES;
    for (MHBrandModel *brandModel in self.shopcartListArray) {
           if (brandModel.isSelect == NO) {
               isBrandSelected = NO;
           }
       }
    return  isBrandSelected;
}

@end
