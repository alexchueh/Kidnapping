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
/**
 *  背景ScrollView，主要目的是繼承TPKeyboardAvoidingScrollView讓TextField在鍵盤彈出時可以滑動到可視範圍
 */
@property (nonatomic, strong) TPKeyboardAvoidingScrollView *scrollView;
/**
 *  輸入帳號的TextField
 */
@property (nonatomic, strong) UITextField *accountTextField;
/**
 *  輸入密碼的TextField
 */
@property (nonatomic, strong) UITextField *passwordTextField;
/**
 *  登入的按鈕
 */
@property (nonatomic, strong) UIButton *loginButton;

@end
