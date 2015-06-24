//
//  MainViewController.h
//  Kidnapping
//
//  Created by shadow on 2015/6/23.
//  Copyright (c) 2015年 shadow. All rights reserved.
//

//Model
#import "MainModel.h"
//View
#import "SelectTabView.h"
#import "LoginView.h"
#import "RegisterView.h"
//Controller
#import "BaseViewController.h"

@interface MainViewController : BaseViewController
//Model
@property (nonatomic, strong) MainModel *mainModel;
//View
@property (nonatomic, strong) SelectTabView *selectTabView;
@property (nonatomic, strong) LoginView *loginView;
@property (nonatomic, strong) RegisterView *registerView;


@end
