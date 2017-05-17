//
//  ViewController.m
//  SPFinancingSystem
//
//  Created by ppan on 2017/5/17.
//  Copyright © 2017年 ppan. All rights reserved.
//

#import "ViewController.h"
#import "SPProjectDistributionViewController.h"
#import "SPTestViewController.h"
#import "SPFinancingMainViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)go:(id)sender {
    SPFinancingMainViewController *distributVC = [SPFinancingMainViewController new];
    [self.navigationController pushViewController:distributVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
