//
//  SpecialPriceViewController.h
//  OrderConfir
//
//  Created by 付加霖 on 14-8-13.
//  Copyright (c) 2014年 fujl. All rights reserved.
//

#import <UIKit/UIKit.h>
#define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

@interface SpecialPriceViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableDataSource;
    UIView *_headView;
    // 筛选
    UIButton *_selectorBtn;
    // 价格最低
    UIButton *_priceLowestBtn;
}

@end
