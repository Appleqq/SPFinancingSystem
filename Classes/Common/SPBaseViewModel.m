//
//  DSBaseViewModel.m
//  DS_Leo
//
//  Created by manito on 15/11/23.
//  Copyright © 2015年 manito. All rights reserved.
//

#import "SPBaseViewModel.h"

@implementation SPBaseViewModel

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    SPBaseViewModel *viewModel = [super allocWithZone:zone];
    [viewModel initialize];
    return viewModel;
}

- (void)initialize {
}

@end
