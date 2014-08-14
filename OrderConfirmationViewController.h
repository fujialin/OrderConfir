//
//  OrderConfirmationViewController.h
//  OrderConfir
//
//  Created by stupid_pig on 14-8-13.
//  Copyright (c) 2014年 fujl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RadioButton.h"

//ios7
#define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
@interface OrderConfirmationViewController : UIViewController<UIScrollViewDelegate>
{
    UIView *_receiverInfoView;
    UILabel *_lblReceiverName;
    UILabel *_lblTelNo;
    UILabel *_lblAddress;
    UIScrollView *_backgroundView;
    
    RadioButton *_rbTimerSend;
    RadioButton *_rbSelfDefine;
}

@end
