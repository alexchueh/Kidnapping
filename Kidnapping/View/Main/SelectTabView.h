//
//  SelectTabView.h
//  Kidnapping
//
//  Created by shadow on 2015/6/24.
//  Copyright (c) 2015年 shadow. All rights reserved.
//

#import "BaseView.h"

typedef NS_ENUM(NSUInteger, SelectTabButton){
    /**
     *  登入按鈕TabButton的Tag
     */
    SelectTabLoginButton,
    /**
     *  註冊按鈕TabButton的Tag
     */
    SelectTabRegisterButton,
};

@interface SelectTabView : BaseView
/**
 *  登入按鈕的TabButton
 */
@property (nonatomic, strong) UIButton *loginButton;
/**
 *  註冊按鈕的TabButton
 */
@property (nonatomic, strong) UIButton *registerButton;

@end
