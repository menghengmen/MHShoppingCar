//
//  MHShoppingCarViewController.m
//  MHShoppingCar
//
//  Created by 哈哈 on 2018/10/10.
//  Copyright © 2018年 MengHeng. All rights reserved.
//

#import "MHShoppingCarViewController.h"
#import "MHShoppingCarCell.h"
#import "MHDataManager.h"
#import "MHShoppingCarBottomView.h"

#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define WS(weakSelf)      __weak typeof(self) weakSelf = self


@interface MHShoppingCarViewController ()<UITableViewDelegate,UITableViewDataSource,CellDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) MHDataManager *manager;
@property (nonatomic,strong) NSMutableArray *goodCarDataArr;
@property (nonatomic,strong) MHShoppingCarBottomView *bottomView;///尾部视图
@property (nonatomic,assign) NSUInteger totalPrice;///总价格

@end

@implementation MHShoppingCarViewController

-(NSMutableArray*)goodCarDataArr{
    if (!_goodCarDataArr) {
        _goodCarDataArr = [NSMutableArray new];
    }
    return _goodCarDataArr;
    
}

-(MHShoppingCarBottomView*)bottomView{
    if (!_bottomView) {
        _bottomView = [[MHShoppingCarBottomView alloc] initWithFrame:CGRectMake(0, ScreenHeight-44, ScreenWidth, 44)];
        _bottomView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomView;
}



-(UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 100;
        [_tableView registerClass:[MHShoppingCarCell class] forCellReuseIdentifier:@"MHShoppingCarCell"];
        
    }
  return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"购物车";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomView];
    self.manager = [MHDataManager new];
    self.totalPrice = 0;
    WS(weakSelf);
    [self.manager getShopCarData:^(NSArray * _Nonnull commonArr, NSArray * _Nonnull luxuryArr) {
        [self.goodCarDataArr addObject:commonArr];
        [self.goodCarDataArr addObject:luxuryArr];
        [weakSelf calculatePrice];

    } priceBlock:^{
        [weakSelf calculatePrice];
    }];

}

#pragma  mark 计算价格
-(void)calculatePrice{
    self.totalPrice = 0;
    for (int i =0; i <self.goodCarDataArr.count; i ++) {
        NSArray *modelArray = self.goodCarDataArr[i];
        for (int j =0; j <modelArray.count; j++) {
            MHShopCarModel *model = modelArray[j];
            NSInteger count = [model.count integerValue];
            float singlePrice = [model.item_info.sale_price floatValue];
          if (model.isSelect == YES) {
                self.totalPrice += count*singlePrice;
            }
        }
    }
    self.bottomView.allPrice.text = [NSString stringWithFormat:@"总计:￥%.2ld.00",self.totalPrice];

}

#pragma mark CellDelegate
-(void)changeGoodCountClick{
    [self calculatePrice];
}

#pragma mark UITableViewDataSource

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.goodCarDataArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray * arr = [self.goodCarDataArr objectAtIndex:section];
    return arr.count ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MHShoppingCarCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MHShoppingCarCell" forIndexPath:indexPath];
    cell.delegate = self;
    cell.model = [[self.goodCarDataArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    return cell;

}

@end
