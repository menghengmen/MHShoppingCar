//
//  ViewController.m
//  MHShoppingCar
//
//  Created by 哈哈 on 2018/10/10.
//  Copyright © 2018年 MengHeng. All rights reserved.
//

#import "ViewController.h"
#import "MHShoppingCarViewController.h"
#import "MHShopCarVC.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)click:(UIButton *)sender {
    [self.navigationController pushViewController:[MHShoppingCarViewController new] animated:YES];

}
- (IBAction)Click2:(UIButton *)sender {
   [self.navigationController pushViewController:[MHShopCarVC new] animated:YES];

}


@end
