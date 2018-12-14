//
//  MHShopCarCell.h
//  MHShoppingCar
//
//  Created by 哈哈 on 2018/12/14.
//  Copyright © 2018 MengHeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MHShopCarCell : UITableViewCell

- (void)configureShopcartCellWithProductURL:(NSString *)productURL
                                productName:(NSString *)productName
                                productSize:(NSString *)productSize
                               productPrice:(NSInteger)productPrice
                               productCount:(NSInteger)productCount
                               productStock:(NSInteger)productStock
                            productSelected:(BOOL)productSelected;
@end

NS_ASSUME_NONNULL_END
