//
//  MHBrandModel.h
//  MHShoppingCar
//
//  Created by 哈哈 on 2018/12/14.
//  Copyright © 2018 MengHeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MHProductModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MHBrandModel : NSObject

@property (nonatomic, copy) NSString *brandId;

@property (nonatomic, strong) NSMutableArray<MHProductModel *> *products;

@property (nonatomic, copy) NSString *brandName;
@end

NS_ASSUME_NONNULL_END
