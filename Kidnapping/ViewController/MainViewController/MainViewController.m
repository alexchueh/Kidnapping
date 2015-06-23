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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.loginView = [[LoginView alloc]init];
    [self.view addSubview:self.loginView];
    [self.loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width, DeviceHeight));
    }];
    
    [self.loginView.loginButton addTarget:self action:@selector(loginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    NSLog(@"loginView:%@",self.loginView);
    NSLog(@"accountTextField:%@",self.loginView.accountTextField);
    NSLog(@"loginButton:%@",self.loginView.loginButton);
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)loginButtonClick:(id)sender
{
    NSLog(@"login");
}

- (void)myMethod {
    PFUser *user = [PFUser user];
    user.username = @"my name";
    user.password = @"my pass";
    user.email = @"email@example.com";
    
    // other fields can be set just like with PFObject
    user[@"phone"] = @"415-392-0202";
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // Hooray! Let them use the app now.
        } else{
            NSString *errorString = [error userInfo][@"error"];   // Show the errorString somewhere and let the user try again.
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:errorString delegate:self cancelButtonTitle:@"確定" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
