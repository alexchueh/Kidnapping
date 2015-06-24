//
//  RegisterView.h
//  Kidnapping
//
//  Created by shadow on 2015/6/24.
//  Copyright (c) 2015年 shadow. All rights reserved.
//

#import "BaseView.h"
#import "TPKeyboardAvoidingScrollView.h"

@interface RegisterView : BaseView
/**
 *  背景ScrollView，主要目的是繼承TPKeyboardAvoidingScrollView讓TextFieldView在鍵盤彈出時可以滑動到可視範圍
 */
@property (nonatomic, strong) TPKeyboardAvoidingScrollView *scrollView;
/**
 *  輸入帳號的TextFieldView
 */
@property (nonatomic, strong) UITextField *accountTextField;
/**
 *  輸入密碼的TextFieldView
 */
@property (nonatomic, strong) UITextField *passwordTextField;
/**
 *  輸入信箱的TextFieldView
 */
@property (nonatomic, strong) UITextField *emailTextField;
/**
 *  輸入電話的TextFieldView
 */
@property (nonatomic, strong) UITextField *phoneTextField;
/**
 *  註冊的按鈕
 */
@property (nonatomic, strong) UIButton *registerButton;

@end
