//
//  SPFinacingHeadCell.h
//  Taurus
//
//  Created by ppan on 2017/5/3.
//  Copyright © 2017年 ppan. All rights reserved.
//

#import "SPBaseTableViewCell.h"
#import "SPHeadCellView.h"
@interface SPFinacingHeadCell : SPBaseTableViewCell
@property (nonatomic ,strong)SPHeadCellView  *moneygapIV; /**< 资金缺口*/
@property (nonatomic ,strong)SPHeadCellView  *agreementIV; /**< 协议总额*/
@property (nonatomic ,strong)SPHeadCellView  *arriveIV; /**< 到位总额*/
@property (nonatomic ,strong)SPHeadCellView  *debtIV; /**< 债务总额*/
@property (nonatomic ,strong)UILabel         *cashpoolingLab;/**< 资金池数字*/
@property (nonatomic ,strong)UIButton        *cashpoolBtn;/**< 资金池*/
@end
