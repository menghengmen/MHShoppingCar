//
//  MHShopCarFormat.h
//  MHShoppingCar
//
//  Created by 哈哈 on 2018/12/14.
//  Copyright © 2018 MengHeng. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 处理数据
@protocol MHShopCarFormatDelegate <NSObject>

@required
-(void)shopCarFormatRequestData:(NSMutableArray*)dataArray;

@end


@interface MHShopCarFormat : NSObject
@property (nonatomic,weak) id<MHShopCarFormatDelegate>delegate;
-(void)requestShopCarData;/// 请求购物车数据
@end

