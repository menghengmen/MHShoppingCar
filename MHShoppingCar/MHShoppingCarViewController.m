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

@interface MHShoppingCarViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) MHDataManager *manager;
@property (nonatomic,strong) NSMutableArray *goodCarDataArr;

@end

@implementation MHShoppingCarViewController

-(NSMutableArray*)goodCarDataArr{
    if (!_goodCarDataArr) {
        _goodCarDataArr = [NSMutableArray new];
    }
    return _goodCarDataArr;
    
}


-(UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
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
    self.manager = [MHDataManager new];
    [self.manager getShopCarData:^(NSArray * _Nonnull commonArr, NSArray * _Nonnull luxuryArr) {
        [self.goodCarDataArr addObject:commonArr];
        [self.goodCarDataArr addObject:luxuryArr];
   
    
    }];

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
    
    cell.model = [[self.goodCarDataArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    return cell;

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
