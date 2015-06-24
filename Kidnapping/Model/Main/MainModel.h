//
//  MainModel.h
//  Kidnapping
//
//  Created by shadow on 2015/6/24.
//  Copyright (c) 2015年 shadow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainModel : NSObject

//LoginView
/**
 *  帳號
 */
@property (nonatomic, copy) NSString *accountString;
/**
 *  密碼
 */
@property (nonatomic, copy) NSString *passwordString;
/**
 *  信箱
 */
@property (nonatomic, copy) NSString *emailString;
/**
 *  手機號碼
 */
@property (nonatomic, copy) NSString *phoneString;
+(MainModel *)sharedInstance;

@end
