//
//  SPFinancingMainViewController.m
//  Taurus
//
//  Created by ppan on 2017/5/3.
//  Copyright © 2017年 ppan. All rights reserved.
//

#import "SPFinancingMainViewController.h"
#import "SPFinancingMainTableCell.h"
#import "SPFinacingHeadCell.h"
#import "SPHalfCicrleTableViewCell.h"
#import "SPProjectDistributionViewController.h"
@interface SPFinancingMainViewController ()<UITableViewDelegate,UITableViewDataSource>
@end
#define SPFinancingMainmapCellIndentifi       @"mapMainCellIndentifi"
#define SPFinancingMainHalfChatCellIndentifi       @"HalfChatMainCellIndentifi"
#define SPFinancingMainlineChartCellIndentifi       @"lineMainCellIndentifi"
#define SPFinancingMainRadarChartCellIndentifi       @"RadarMainCellIndentifi"
@implementation SPFinancingMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.title = @"云岩区政府投融资监管平台";
    //[self createUI];
}

- (void)createUI {
    self.mTableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, RRScreenWith, RRScreenHeight-64) style:UITableViewStyleGrouped];
    [self.view addSubview:self.mTableview];
    self.mTableview.backgroundColor = [UIColor redColor];
    self.mTableview.delegate = self;
    self.mTableview.dataSource = self;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 20*SPScaleNumber;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 224*SPScaleNumber + 174*SPScaleNumber;
    }else
    return 579*SPScaleNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
//    return cell;
    if (indexPath.section == 0) {
        SPFinacingHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"headCell"];
        if (!cell) {
            cell = [[SPFinacingHeadCell
                     alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"headCell"];
        }
        return cell;
       
    }
        if (indexPath.section == 1) {
          SPFinancingMainTableCell *cell = [tableView dequeueReusableCellWithIdentifier:SPFinancingMainmapCellIndentifi];
        if (!cell) {
           cell = [[SPFinancingMainTableCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:SPFinancingMainmapCellIndentifi withType:FinancingCellMapType];
        }
        [cell.blowupImageIV ds_tappedWithBlock:^{
            SPProjectDistributionViewController *distributionVC = [SPProjectDistributionViewController new];
            [self.navigationController wxs_pushViewController:distributionVC makeTransition:^(WXSTransitionProperty *transition) {
                transition.animationType = WXSTransitionAnimationTypeViewMoveToNextVC;
                transition.animationTime = 0.64;
                transition.startView  = cell.mapView;
                transition.targetView = distributionVC.mapView;
                transition.backGestureEnable = NO;
            }]; 
        }];
        @weakify(cell)
       [cell.toprigthView ds_tappedWithBlock:^{
           cell.isShow = !cell.isShow;
           if (cell.isShow) {
               [cell showScreeningView];
               cell.screeningIV.block = ^(id mdata ){
                   @strongify(cell)
                   [cell hidderScreeningView];
               };
           }else{
               [cell hidderScreeningView];
           }
       }];
        return cell;
        
    }else if (indexPath.section == 2){
     SPHalfCicrleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SPFinancingMainHalfChatCellIndentifi];
        if (!cell) {
            cell = [[SPHalfCicrleTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:SPFinancingMainHalfChatCellIndentifi];
        }
        return cell;
    }else if (indexPath.section == 3){
         SPFinancingMainTableCell *cell = [tableView dequeueReusableCellWithIdentifier:SPFinancingMainlineChartCellIndentifi];
        if (!cell) {
             cell = [[SPFinancingMainTableCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:SPFinancingMainlineChartCellIndentifi withType:FinacingCellLineChartType];
        }
        return cell;
    }else {
        SPFinancingMainTableCell *cell = [tableView dequeueReusableCellWithIdentifier:SPFinancingMainRadarChartCellIndentifi];
        if (!cell) {
            cell = [[SPFinancingMainTableCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:SPFinancingMainRadarChartCellIndentifi withType:FinacingCellRadarChartType];
        }
        return cell;
    }
}
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {

};
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
