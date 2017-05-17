//
//  RRBaseView.h
//  RayCollege
//
//  Created by manito on 15/6/8.
//  Copyright (c) 2015年 manito. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPBaseView : UIView

@property (nonatomic, strong) UITableView *mTableView;

- (void)createUI;
- (void)createDate;

@end
