//
//  SPScreeningView.m
//  Taurus
//
//  Created by ppan on 2017/5/5.
//  Copyright © 2017年 ppan. All rights reserved.
//

#import "SPScreeningView.h"
@interface SPScreeningView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong)UIView  *subIV;
@property (nonatomic , strong)UITableView   *mTableView;
@property (nonatomic , strong)NSArray       *datas;
@property (nonatomic , strong)NSArray       *images;
@end
#define kSPScreeningViewHeight       300*SPScaleNumber
#define kSPScreeningViewWidth        200*SPScaleNumber
#define kSPScreeningTableViewIndentifi @"SPScreeningTableViewIndentifi"
@implementation SPScreeningView

- (instancetype)initWithSubView:(UIView *)subview{
    self = [super init];
    if (self) {
        self.subIV = subview;
        [self createUI];
    };
    return self;
}
- (void)createUI {
    _datas = @[@"新建项目",@"续建项目",@"公益项目",@"自营项目"];
    _images = @[@"上移",@"下移",@"筛选_gray",@"全屏"];
    self.frame = CGRectMake(_subIV.frame.origin.x + _subIV.frame.size.width -kSPScreeningViewWidth, _subIV.frame.origin.y + _subIV.frame.size.height+10, kSPScreeningViewWidth, kSPScreeningViewHeight);
    self.layer.cornerRadius = 5.0;
    self.layer.masksToBounds = YES;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOpacity = 0.8f;
    self.layer.shadowRadius = 5.0;
    self.layer.shadowOffset = CGSizeMake(0,0);
    self.layer.borderWidth = 1;
    self.layer.borderColor = DSHexColor(@"#bababa").CGColor;
    
    self.mTableView = [UITableView newAutoLayoutView];
    [self addSubview:self.mTableView];
    [self.mTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    self.mTableView.backgroundColor = [UIColor grayColor];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _datas.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kSPScreeningTableViewIndentifi];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kSPScreeningTableViewIndentifi];
    }
    cell.imageView.image = [UIImage imageNamed:[_images objectAtIndex:indexPath.row]];
    cell.textLabel.text =[_datas objectAtIndex:indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_block) {
        _block ([_datas objectAtIndex:indexPath.row]);
    }
}
@end
