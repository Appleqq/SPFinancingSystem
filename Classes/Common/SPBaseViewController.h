//
//  RRBaseViewController.h
//  RayCollege
//
//  Created by manito on 15/6/8.
//  Copyright (c) 2015年 manito. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPBaseViewController : UIViewController

@property (nonatomic, assign) BOOL haveBack;//是否显示返回键
@property (nonatomic, assign) BOOL showNavi;//是否显示导航栏
@property (nonatomic, assign) BOOL showModal;//是否弹出模态
@property (nonatomic, assign) BOOL hiddenNaviBar; /**< 是否使导航栏透明*/
@property (nonatomic, assign) BOOL showToolBar;/**< 是否显示toolBar */
@property (nonatomic, strong) UITableView *mTableview;
@property (nonatomic, strong) UICollectionView *mCollectionView;


- (id)initWithTableviewOrNot:(BOOL)haveTableview;
- (void)returnBtnTapped:(id)sender;
- (void)createUI;//创建ui
- (void)createData;//请求数据


@end
