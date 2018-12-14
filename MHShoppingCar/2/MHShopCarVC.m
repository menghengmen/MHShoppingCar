//
//  MHShopCarVC.m
//  MHShoppingCar
//
//  Created by 哈哈 on 2018/12/14.
//  Copyright © 2018 MengHeng. All rights reserved.
//

#import "MHShopCarVC.h"
#import "MHShopCarCell.h"
#import "MHTableViewProxy.h"
#import "MHShopCarFormat.h"
#import <Masonry/Masonry.h>

@interface MHShopCarVC ()<MHShopCarFormatDelegate>
@property(nonatomic,strong) UITableView *shopCarTableView;/// 购物车列表
@property(nonatomic,strong) MHTableViewProxy *mhProxy;/// 自定义协议
@property(nonatomic,strong) MHShopCarFormat *format;/// 逻辑处理


@end

@implementation MHShopCarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor  = [UIColor whiteColor];
    [self.format requestShopCarData];

    [self.view addSubview:self.shopCarTableView];
    [self.shopCarTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    

}

#pragma mark MHShopCarFormatDelegate
-(void)shopCarFormatRequestData:(NSMutableArray*)dataArray{
    self.mhProxy.dataArray = dataArray;
    [self.shopCarTableView reloadData];
}

#pragma mark lazy init
-(MHTableViewProxy*)mhProxy{
    if (!_mhProxy) {
        _mhProxy = [MHTableViewProxy new];
    }
    return _mhProxy;
}

-(MHShopCarFormat*)format{
    if (!_format) {
        _format = [MHShopCarFormat new];
        _format.delegate = self;
    }
    return _format;
    
}


-(UITableView*)shopCarTableView{
    if (!_shopCarTableView) {
        _shopCarTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [_shopCarTableView registerClass:[MHShopCarCell class] forCellReuseIdentifier:@"MHShopCarCell"];
        _shopCarTableView.rowHeight = 120;
        _shopCarTableView.delegate = self.mhProxy;
        _shopCarTableView.dataSource = self.mhProxy;
        
    }
    
    return  _shopCarTableView;
    
}

@end
