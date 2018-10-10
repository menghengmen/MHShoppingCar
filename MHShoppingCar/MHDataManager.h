//
//  MHDataManager.h
//  MHShoppingCar
//
//  Created by 哈哈 on 2018/10/10.
//  Copyright © 2018年 MengHeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MHDataManager : NSObject
-(void)getShopCarData:(void(^)(NSArray*commonArr,NSArray *luxuryArr))shopDataBlock;
@end

NS_ASSUME_NONNULL_END
