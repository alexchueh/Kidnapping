//
//  LoginView.h
//  Kidnapping
//
//  Created by shadow on 2015/6/23.
//  Copyright (c) 2015年 shadow. All rights reserved.
//

#import "BaseView.h"
#import "TPKeyboardAvoidingScrollView.h"

@interface LoginView : BaseView
@property (nonatomic, strong) TPKeyboardAvoidingScrollView *scrollView;
@property (nonatomic, strong) UITextField *accountTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UIButton *loginButton;

@end
