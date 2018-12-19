//
//  MHShopCarHeaderView.h
//  MHShoppingCar
//
//  Created by 哈哈 on 2018/12/14.
//  Copyright © 2018 MengHeng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^shopCarHeaderViewBlock)(BOOL isSelected);

NS_ASSUME_NONNULL_BEGIN

@interface MHShopCarHeaderView : UITableViewHeaderFooterView
@property(nonatomic,strong) shopCarHeaderViewBlock headerViewBlock;
-(void)configShopHeaderViewWithBrandname:(NSString*)brandName brandSelect:(BOOL)brandSelect;
@end

NS_ASSUME_NONNULL_END
