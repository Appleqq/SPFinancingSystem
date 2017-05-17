//
//  RRBaseViewController.m
//  RayCollege
//
//  Created by manito on 15/6/8.
//  Copyright (c) 2015年 manito. All rights reserved.
//

#import "SPBaseViewController.h"
@interface SPBaseViewController ()

@end

@implementation SPBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setUpUIWithTableOrNot:NO];
    }
    return self;
}

- (id)initWithTableviewOrNot:(BOOL)haveTableview {
    self = [super init];
    if (self) {
        [self setUpUIWithTableOrNot:haveTableview];
    }
    return self;
}

- (id)init {
    self = [super init];
    if (self) {
        [self setUpUIWithTableOrNot:NO];
    }
    return self;
}

- (void)setUpUIWithTableOrNot:(BOOL)haveTableview {
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    _haveBack = YES;
    _showNavi = YES;
    _showToolBar = NO;
    if (haveTableview) {
        _mTableview = [UITableView newAutoLayoutView];
        [self.view addSubview:_mTableview];
        [_mTableview autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        _mTableview.delegate = (id<UITableViewDelegate>)self;
        _mTableview.dataSource = (id<UITableViewDataSource>)self;
        _mTableview.tableFooterView = [[UIView alloc] init];
        _mTableview.showsVerticalScrollIndicator = NO;
        _mTableview.showsHorizontalScrollIndicator = NO;
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    if (_showNavi) {//默认展示导航条
      [self.navigationController setNavigationBarHidden:NO animated:NO];
        [self.navigationController.navigationBar.backItem setHidesBackButton:NO];
    } else {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        [self.navigationController.navigationBar.backItem setHidesBackButton:YES];
    }
    self.view.backgroundColor = DSHexColor(@"#f0f0f2");
    [self createUI];
    [self createData];
}

- (void)returnBtnTapped:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)createUI {
}

- (void)createData {
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (NSString *)description{

    return [NSString stringWithFormat:@"< %@ >",[self class]];
}

@end
