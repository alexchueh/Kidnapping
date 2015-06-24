//
//  MainViewController.m
//  Kidnapping
//
//  Created by shadow on 2015/6/23.
//  Copyright (c) 2015年 shadow. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

#pragma mark Life Cycle -- 生命週期

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initModel];
    [self initView];
    [self setReactiveCocoa];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES];
}

#pragma mark Init Model&View -- 初始化模型和畫面

- (void)initModel {
    self.mainModel = [MainModel sharedInstance];
}

- (void)initView {
    self.selectTabView = [[SelectTabView alloc]init];
    [self.view addSubview:self.selectTabView];
    [self.selectTabView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width, 40));
    }];
    [self.selectTabView.loginButton addTarget:self action:@selector(selectTabClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.selectTabView.registerButton addTarget:self action:@selector(selectTabClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.loginView = [[LoginView alloc]init];
    [self.loginView setHidden:NO];
    [self.view addSubview:self.loginView];
    [self.loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.selectTabView.mas_top).with.offset(40);
        make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width, DeviceHeight));
    }];
    [self.loginView.loginButton addTarget:self action:@selector(loginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.registerView = [[RegisterView alloc]init];
    [self.registerView setHidden:YES];
    [self.view addSubview:self.registerView];
    [self.registerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.selectTabView.mas_top).with.offset(40);
        make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width, DeviceHeight));
    }];
    [self.registerView.registerButton addTarget:self action:@selector(registerButtonClick:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark ReactiveCocoa -- 設定ReactiveCocoa

- (void)setReactiveCocoa {
    [RACObserve(self, self.mainModel.accountString) subscribeNext:^(NSString *accountString) {

    }];
    [RACObserve(self, self.mainModel.passwordString) subscribeNext:^(NSString *passwordString) {

    }];
    [RACObserve(self, self.mainModel.emailString) subscribeNext:^(NSString *emailString) {
        
    }];
    [RACObserve(self, self.mainModel.phoneString) subscribeNext:^(NSString *phoneString) {

    }];
}

#pragma mark ButtonClick -- 按鈕點擊事件

- (IBAction)selectTabClick:(id)sender {
    UIButton *button = (UIButton *)sender;
    switch (button.tag) {
        case SelectTabLoginButton: {
            [self.selectTabView.loginButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            [self.selectTabView.registerButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [self.loginView setHidden:NO];
            [self.registerView setHidden:YES];
            [UIView transitionWithView:self.loginView
                              duration:.4
                               options:UIViewAnimationOptionTransitionCrossDissolve
                            animations:^{
                                [self.registerView setContentMode:UIViewContentModeScaleAspectFill];
                                [self.registerView setClipsToBounds:YES];
                            } completion:NULL];
        }
            break;
        case SelectTabRegisterButton: {
            [self.selectTabView.loginButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [self.selectTabView.registerButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            [self.loginView setHidden:YES];
            [self.registerView setHidden:NO];
            [UIView transitionWithView:self.registerView
                              duration:.4
                               options:UIViewAnimationOptionTransitionCrossDissolve
                            animations:^{
                                [self.loginView setContentMode:UIViewContentModeScaleAspectFill];
                                [self.loginView setClipsToBounds:YES];
                            } completion:NULL];
        }
            break;
            
        default:
            break;
    }
}

- (IBAction)loginButtonClick:(id)sender {
    self.mainModel.accountString = self.loginView.accountTextField.text;
    self.mainModel.passwordString = self.loginView.passwordTextField.text;
    [self loginMember];
}

- (IBAction)registerButtonClick:(id)sender {
    self.mainModel.accountString = self.registerView.accountTextField.text;
    self.mainModel.passwordString = self.registerView.passwordTextField.text;
    self.mainModel.emailString = self.registerView.emailTextField.text;
    self.mainModel.phoneString = self.registerView.phoneTextField.text;
    [self registerMember];
}

#pragma mark Method

- (void)loginMember {
    NSString *userName = self.mainModel.accountString;
    NSString *password = self.mainModel.passwordString;
    [PFUser logInWithUsernameInBackground:userName password:password
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            // Do stuff after successful login.
                                            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:[NSString stringWithFormat:@"%@登入成功",user.username] delegate:self cancelButtonTitle:@"確定" otherButtonTitles:nil, nil];
                                            [alertView show];
                                        } else {
                                            // The login failed. Check error to see why.
                                            NSString *errorString = [error userInfo][@"error"];
                                            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:errorString delegate:self cancelButtonTitle:@"確定" otherButtonTitles:nil, nil];
                                            [alertView show];
                                        }
                                    }];
}

- (void)registerMember {
    PFUser *user = [PFUser user];
    user.username = self.mainModel.accountString;
    user.password = self.mainModel.passwordString;
    user.email = self.mainModel.emailString;
    user[@"phone"] = self.mainModel.phoneString;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // Hooray! Let them use the app now.
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:[NSString stringWithFormat:@"%@註冊成功",user.username] delegate:self cancelButtonTitle:@"確定" otherButtonTitles:nil, nil];
            [alertView show];
        } else{
            // Show the errorString somewhere and let the user try again.
            NSString *errorString = [error userInfo][@"error"];
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:errorString delegate:self cancelButtonTitle:@"確定" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }];
}

@end
