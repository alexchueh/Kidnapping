//
//  SelectTabView.m
//  Kidnapping
//
//  Created by shadow on 2015/6/24.
//  Copyright (c) 2015年 shadow. All rights reserved.
//

#import "SelectTabView.h"

@implementation SelectTabView

- (instancetype)init{
    self = [super init];
    if (self) {
        self.loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self buildView];
}

- (void)buildView {
    [self.loginButton setTitle:NSLocalizedString(@"Login", nil) forState:UIControlStateNormal];
    [self.loginButton setTag:SelectTabLoginButton];
    [self.loginButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self addSubview:self.loginButton];
    
    [self.registerButton setTitle:NSLocalizedString(@"Register", nil) forState:UIControlStateNormal];
    [self.registerButton setTag:SelectTabRegisterButton];
    [self.registerButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self addSubview:self.registerButton];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.left.equalTo(self.mas_left).with.offset(0);
        make.right.equalTo(self.registerButton.mas_left).with.offset(0);
        make.height.mas_equalTo(@(self.frame.size.height));
        make.width.equalTo(self.registerButton);
    }];
    
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.left.equalTo(self.loginButton.mas_right).with.offset(0);
        make.right.equalTo(self.mas_right).with.offset(0);
        make.height.mas_equalTo(@(self.frame.size.height));
        make.width.equalTo(self.loginButton);
    }];
}

@end
