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
-(void)shopCarBrandSelected;/// 品牌选择


@end


@interface MHShopCarFormat : NSObject
@property (nonatomic,weak) id<MHShopCarFormatDelegate>delegate;
-(void)requestShopCarData;/// 请求购物车数据
-(void)selectBrandWithSection:(NSInteger)section isSelected:(BOOL)selected;/// 选中反选m某个品牌
-(void)selectProductWith:(NSIndexPath*)index isSelected:(BOOL)selected;/// 选中某个商品

@end

