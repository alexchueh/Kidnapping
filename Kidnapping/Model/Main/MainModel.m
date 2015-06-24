//
//  MainModel.m
//  Kidnapping
//
//  Created by shadow on 2015/6/24.
//  Copyright (c) 2015年 shadow. All rights reserved.
//

#import "MainModel.h"

@implementation MainModel

+ (MainModel *)sharedInstance {
    static id mainModel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mainModel = [[MainModel alloc]init];
    });
    return mainModel;
}

@end
