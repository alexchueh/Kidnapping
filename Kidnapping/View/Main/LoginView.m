//
//  LoginView.m
//  Kidnapping
//
//  Created by shadow on 2015/6/23.
//  Copyright (c) 2015年 shadow. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView
- (instancetype)init{
    self = [super init];
    if (self) {
        self.scrollView = [[TPKeyboardAvoidingScrollView alloc]init];
        self.accountTextField = [[UITextField alloc]init];
        self.passwordTextField = [[UITextField alloc]init];
        self.loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    }
    return self;
}

- (void)buildView
{
    [self.scrollView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(self.bounds.size.width, self.bounds.size.height));
    }];
    
    [self.accountTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.accountTextField setPlaceholder:@"帳號"];
    [self.accountTextField setToolBar];
    [self.scrollView addSubview:self.accountTextField];
    
    [self.passwordTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.passwordTextField setPlaceholder:@"密碼"];
    [self.passwordTextField setToolBar];
    [self.scrollView addSubview:self.passwordTextField];
    
    [self.loginButton setTitle:@"登入" forState:UIControlStateNormal];
    [self.scrollView addSubview:self.loginButton];
    
    [self.accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.scrollView.mas_top).with.offset(50);
        make.left.equalTo(self.scrollView.mas_left).with.offset(10);
        make.right.equalTo(self.scrollView.mas_right).with.offset(-10);
        make.size.mas_equalTo(CGSizeMake(self.bounds.size.width - 10 * 2, 40));
    }];
    
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.accountTextField.mas_top).with.offset(70);
        make.left.equalTo(self.scrollView.mas_left).with.offset(10);
        make.right.equalTo(self.scrollView.mas_right).with.offset(-10);
        make.size.mas_equalTo(CGSizeMake(self.bounds.size.width - 10 * 2, 40));
    }];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passwordTextField.mas_top).with.offset(70);
        make.left.equalTo(self.scrollView.mas_left).with.offset(10);
        make.right.equalTo(self.scrollView.mas_right).with.offset(-10);
        make.size.mas_equalTo(CGSizeMake(self.bounds.size.width - 10 * 2, 40));
    }];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    [self buildView];
}


@end
