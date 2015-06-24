//
//  RegisterView.m
//  Kidnapping
//
//  Created by shadow on 2015/6/24.
//  Copyright (c) 2015年 shadow. All rights reserved.
//

#import "RegisterView.h"

@implementation RegisterView

- (instancetype)init{
    self = [super init];
    if (self) {
        self.scrollView = [[TPKeyboardAvoidingScrollView alloc]init];
        self.accountTextField = [[UITextField alloc]init];
        self.passwordTextField = [[UITextField alloc]init];
        self.emailTextField = [[UITextField alloc]init];
        self.phoneTextField = [[UITextField alloc]init];
        [MainModel sharedInstance].registerTextFiledArray = @[self.accountTextField,self.passwordTextField,self.emailTextField,self.phoneTextField];
        self.registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self buildView];
}

- (void)buildView {
    [self.scrollView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(self.bounds.size.width, self.bounds.size.height));
    }];
    
    [self.accountTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.accountTextField setPlaceholder:NSLocalizedString(@"Account", nil)];
    [self.accountTextField setToolBar];
    [self.scrollView addSubview:self.accountTextField];
    
    [self.passwordTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.passwordTextField setPlaceholder:NSLocalizedString(@"Password", nil)];
    [self.passwordTextField setToolBar];
    [self.passwordTextField setSecureTextEntry:YES];
    [self.scrollView addSubview:self.passwordTextField];
    
    [self.emailTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.emailTextField setPlaceholder:NSLocalizedString(@"Email", nil)];
    [self.emailTextField setToolBar];
    [self.scrollView addSubview:self.emailTextField];
    
    [self.phoneTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.phoneTextField setPlaceholder:NSLocalizedString(@"Phone", nil)];
    [self.phoneTextField setToolBar];
    [self.scrollView addSubview:self.phoneTextField];

    [self.registerButton setTitle:NSLocalizedString(@"Register", nil) forState:UIControlStateNormal];
    [self.scrollView addSubview:self.registerButton];
    
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
    
    [self.emailTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passwordTextField.mas_top).with.offset(70);
        make.left.equalTo(self.scrollView.mas_left).with.offset(10);
        make.right.equalTo(self.scrollView.mas_right).with.offset(-10);
        make.size.mas_equalTo(CGSizeMake(self.bounds.size.width - 10 * 2, 40));
    }];
    
    [self.phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.emailTextField.mas_top).with.offset(70);
        make.left.equalTo(self.scrollView.mas_left).with.offset(10);
        make.right.equalTo(self.scrollView.mas_right).with.offset(-10);
        make.size.mas_equalTo(CGSizeMake(self.bounds.size.width - 10 * 2, 40));
    }];
    
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneTextField.mas_top).with.offset(70);
        make.left.equalTo(self.scrollView.mas_left).with.offset(10);
        make.right.equalTo(self.scrollView.mas_right).with.offset(-10);
        make.size.mas_equalTo(CGSizeMake(self.bounds.size.width - 10 * 2, 40));
    }];
}

@end
