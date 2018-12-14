//
//  MHTableViewProxy.h
//  MHShoppingCar
//
//  Created by 哈哈 on 2018/12/14.
//  Copyright © 2018 MengHeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^shopCarProxyProductSelectBlock)(BOOL isSelect ,NSIndexPath* indexpath);//商品选择
typedef void(^shopCarProxyBrandSelectBlock)(BOOL isSelect,NSInteger interger);// 品牌选择

NS_ASSUME_NONNULL_BEGIN

@interface MHTableViewProxy : NSObject<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) NSMutableArray *dataArray;
@property(nonatomic,copy) shopCarProxyProductSelectBlock productSelectBlock;
@property(nonatomic,copy) shopCarProxyBrandSelectBlock    brandSelectBlock;


@end

NS_ASSUME_NONNULL_END
