//
//  RRBaseView.m
//  RayCollege
//
//  Created by manito on 15/6/8.
//  Copyright (c) 2015年 manito. All rights reserved.
//

#import "SPBaseView.h"

@implementation SPBaseView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
        [self createDate];
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self createUI];
        [self createDate];
    }
    return self;
}

- (void)createUI {
    
}

- (void)createDate {
    
}

@end
