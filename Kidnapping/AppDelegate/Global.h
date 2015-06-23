//
//  Global.h
//  Kidnapping
//
//  Created by shadow on 2015/6/23.
//  Copyright (c) 2015年 shadow. All rights reserved.
//

#ifndef Kidnapping_Global_h
#define Kidnapping_Global_h


#define IS_TEST_MODE 0 //送審要用0
#define IS_ARCHIVED 1 //包版和送審要用1

#if IS_TEST_MODE
#define kServiceDomain @""
#else
#define kServiceDomain @""
#endif

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define DeviceHeight self.view.bounds.size.height - [UIApplication sharedApplication].statusBarFrame.size.height - self.navigationController.navigationBar.frame.size.height


#endif
