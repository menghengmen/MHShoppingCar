//
//  MHTableViewProxy.m
//  MHShoppingCar
//
//  Created by 哈哈 on 2018/12/14.
//  Copyright © 2018 MengHeng. All rights reserved.
//

#import "MHTableViewProxy.h"
#import "MHShopCarCell.h"
#import "MHBrandModel.h"
#import "MHProductModel.h"

@implementation MHTableViewProxy

#pragma mark UITableViewDataSource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MHShopCarCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MHShopCarCell"];
    MHBrandModel *brandModel = self.dataArray[indexPath.section];
    NSArray *productArray = brandModel.products;
    if (productArray.count > indexPath.row) {
        MHProductModel *productModel = productArray[indexPath.row];
        NSString *productName = [NSString stringWithFormat:@"%@%@%@", brandModel.brandName, productModel.productStyle, productModel.productType];
        NSString *productSize = [NSString stringWithFormat:@"W:%ld H:%ld D:%ld", productModel.specWidth, productModel.specHeight, productModel.specLength];
        [cell configureShopcartCellWithProductURL:productModel.productPicUri productName:productName productSize:productSize productPrice:productModel.productPrice productCount:productModel.productQty productStock:productModel.productStocks productSelected:YES];
    }
    return cell;
    
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   MHBrandModel *brandModel  = self.dataArray[section];
    NSArray *productArray = brandModel.products;

    return productArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;{
    return self.dataArray.count;
}


@end
