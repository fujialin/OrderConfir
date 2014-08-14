//
//  OrderConfirmationViewController.m
//  OrderConfir
//
//  Created by stupid_pig on 14-8-13.
//  Copyright (c) 2014年 fujl. All rights reserved.
//

#import "OrderConfirmationViewController.h"

@interface OrderConfirmationViewController ()

@end

@implementation OrderConfirmationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:244.0/255.0 alpha:1.0];
    _backgroundView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 1000)];
    _backgroundView.backgroundColor = [UIColor clearColor];
    _backgroundView.scrollEnabled = YES;
    _backgroundView.delegate = self;
    _backgroundView.alwaysBounceVertical = YES;
    [_backgroundView setShowsVerticalScrollIndicator:NO];
    [self.view addSubview:_backgroundView];
    
    self.title = @"订单确认";
    NSLog(@"width:%f height:%f", SCREEN_WIDTH, SCREEN_HEIGHT);
    if (IOS7) {
        [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
        NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, nil];
        
        [self.navigationController.navigationBar setTitleTextAttributes:attributes];
        [[UINavigationBar appearance] setBarTintColor:[UIColor orangeColor]];
        UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(clickBack:)];
        self.navigationItem.leftBarButtonItem = leftBtn;
    }
    
    _receiverInfoView = [[UIView alloc] initWithFrame:CGRectMake(0, 20.0f, SCREEN_WIDTH, 150)];
    _receiverInfoView.backgroundColor = [UIColor whiteColor];
    [_backgroundView addSubview:_receiverInfoView];
    // 217 217 217
    UIView *lineTop = [[UIView alloc] init];
    lineTop.backgroundColor = [UIColor colorWithRed:217.0/255.0 green:217.0/255.0 blue:217.0/255.0 alpha:1.0];
    lineTop.frame = CGRectMake(0, 0, SCREEN_WIDTH, 1);
    [_receiverInfoView addSubview:lineTop];
    // 收货人
    UILabel *lblReceiver = [[UILabel alloc] init];
    lblReceiver.text = @"收货人";
    lblReceiver.textAlignment = NSTextAlignmentLeft;
    lblReceiver.frame = CGRectMake(35, 1, 85, 48);
    lblReceiver.backgroundColor = [UIColor clearColor];
    [_receiverInfoView addSubview:lblReceiver];
    //
    _lblReceiverName = [[UILabel alloc] init];
    _lblReceiverName.textAlignment = NSTextAlignmentLeft;
    _lblReceiverName.text = @"方世玉";
    _lblReceiverName.textColor = [UIColor colorWithRed:175.0/255.0 green:175.0/255.0 blue:175.0/255.0 alpha:1.0];
    _lblReceiverName.frame = CGRectMake(CGRectGetMaxX(lblReceiver.frame), 1, 120, 48);
    _lblReceiverName.backgroundColor = [UIColor clearColor];
    [_receiverInfoView addSubview:_lblReceiverName];
    
    UIView *lineMid1 = [[UIView alloc] init];
    lineMid1.backgroundColor = [UIColor colorWithRed:217.0/255.0 green:217.0/255.0 blue:217.0/255.0 alpha:1.0];
    lineMid1.frame = CGRectMake(35, _receiverInfoView.frame.size.height/3.0f, SCREEN_WIDTH - 35, 1);
    [_receiverInfoView addSubview:lineMid1];
    
    UILabel *lblTel = [[UILabel alloc] init];
    lblTel.text = @"电话";
    lblTel.textAlignment = NSTextAlignmentLeft;
    lblTel.frame = CGRectMake(35, 51, 85, 48);
    lblTel.backgroundColor = [UIColor clearColor];
    [_receiverInfoView addSubview:lblTel];
    _lblTelNo = [[UILabel alloc] init];
    _lblTelNo.textAlignment = NSTextAlignmentLeft;
    _lblTelNo.text = @"186 8888 8888";
    _lblTelNo.textColor = [UIColor colorWithRed:175.0/255.0 green:175.0/255.0 blue:175.0/255.0 alpha:1.0];
    _lblTelNo.frame = CGRectMake(CGRectGetMaxX(lblTel.frame), 51, 120, 48);
    _lblTelNo.backgroundColor = [UIColor clearColor];
    [_receiverInfoView addSubview:_lblTelNo];
    
    UIView *lineMid2 = [[UIView alloc] init];
    lineMid2.backgroundColor = [UIColor colorWithRed:217.0/255.0 green:217.0/255.0 blue:217.0/255.0 alpha:1.0];
    lineMid2.frame = CGRectMake(35, _receiverInfoView.frame.size.height*2/3.0f, SCREEN_WIDTH - 35, 1);
    [_receiverInfoView addSubview:lineMid2];
    
    UILabel *lblAddr = [[UILabel alloc] init];
    lblAddr.text = @"收货地址";
    lblAddr.textAlignment = NSTextAlignmentLeft;
    lblAddr.frame = CGRectMake(35, 101, 85, 48);
    lblAddr.backgroundColor = [UIColor clearColor];
    [_receiverInfoView addSubview:lblAddr];
    _lblAddress = [[UILabel alloc] init];
    _lblAddress.textAlignment = NSTextAlignmentLeft;
    _lblAddress.text = @"......小区......号......室";
    _lblAddress.textColor = [UIColor colorWithRed:175.0/255.0 green:175.0/255.0 blue:175.0/255.0 alpha:1.0];
    _lblAddress.frame = CGRectMake(CGRectGetMaxX(lblAddr.frame), 101, 220, 54);
    _lblAddress.backgroundColor = [UIColor clearColor];
    [_receiverInfoView addSubview:_lblAddress];
    
    UIView *lineBottom = [[UIView alloc] init];
    lineBottom.backgroundColor = [UIColor colorWithRed:217.0/255.0 green:217.0/255.0 blue:217.0/255.0 alpha:1.0];
    lineBottom.frame = CGRectMake(0, _receiverInfoView.frame.size.height-1, SCREEN_WIDTH, 1);
    [_receiverInfoView addSubview:lineBottom];
    
    // 收货方式
    UIView *reciveFuncView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_receiverInfoView.frame)+20, SCREEN_WIDTH, 120)];
    reciveFuncView.backgroundColor = [UIColor whiteColor];
    [_backgroundView addSubview:reciveFuncView];
    UIView *lineFuncTop = [[UIView alloc] init];
    lineFuncTop.backgroundColor = [UIColor colorWithRed:217.0/255.0 green:217.0/255.0 blue:217.0/255.0 alpha:1.0];
    lineFuncTop.frame = CGRectMake(0, 0, SCREEN_WIDTH, 1);
    [reciveFuncView addSubview:lineFuncTop];
    
    UILabel *lblFunc = [[UILabel alloc] init];
    lblFunc.text = @"收货方式";
    lblFunc.textAlignment = NSTextAlignmentLeft;
    lblFunc.frame = CGRectMake(35, 1, 85, 79);
    lblFunc.backgroundColor = [UIColor clearColor];
    [reciveFuncView addSubview:lblFunc];
    // 由物业定时配送
    // 收货人到物业自提
    _rbTimerSend = [[RadioButton alloc] initWithGroupId:@"first" index:0];
    _rbSelfDefine = [[RadioButton alloc] initWithGroupId:@"first" index:1];
    _rbTimerSend.frame = CGRectMake(CGRectGetMaxX(lblFunc.frame), (40 - 22)/2.0f + 6, 22, 22);// 22 22
    UILabel *lblTimerSend = [[UILabel alloc] init];
    lblTimerSend.textAlignment = NSTextAlignmentLeft;
    lblTimerSend.text = @"由物业定时配送";
    lblTimerSend.textColor = [UIColor colorWithRed:175.0/255.0 green:175.0/255.0 blue:175.0/255.0 alpha:1.0];
    lblTimerSend.frame = CGRectMake(CGRectGetMaxX(_rbTimerSend.frame), 0, 220, 54);
    lblTimerSend.backgroundColor = [UIColor clearColor];
    [reciveFuncView addSubview:lblTimerSend];
    
    _rbSelfDefine.frame = CGRectMake(CGRectGetMaxX(lblFunc.frame), 40 + (40 - 22)/2.0f, 22, 22);
    UILabel *lblSelfDefine = [[UILabel alloc] init];
    lblSelfDefine.textAlignment = NSTextAlignmentLeft;
    lblSelfDefine.text = @"收货人到物业自提";
    lblSelfDefine.textColor = [UIColor colorWithRed:175.0/255.0 green:175.0/255.0 blue:175.0/255.0 alpha:1.0];
    lblSelfDefine.frame = CGRectMake(CGRectGetMaxX(_rbSelfDefine.frame), 40, 160, 39);
    lblSelfDefine.backgroundColor = [UIColor clearColor];
    [reciveFuncView addSubview:lblSelfDefine];

    [reciveFuncView addSubview:_rbTimerSend];
    [reciveFuncView addSubview:_rbSelfDefine];
    
    UIView *lineFuncMid1 = [[UIView alloc] init];
    lineFuncMid1.backgroundColor = [UIColor colorWithRed:217.0/255.0 green:217.0/255.0 blue:217.0/255.0 alpha:1.0];
    lineFuncMid1.frame = CGRectMake(35, reciveFuncView.frame.size.height*2/3.0f, SCREEN_WIDTH - 35, 1);
    [reciveFuncView addSubview:lineFuncMid1];
    
    UILabel *lblTipFunc = [[UILabel alloc] init];
    lblTipFunc.frame = CGRectMake(35, reciveFuncView.frame.size.height*2/3.0f + 1, SCREEN_WIDTH - 35, 39);
    lblTipFunc.textAlignment = NSTextAlignmentCenter;
    lblTipFunc.text = @"在民生购买到的商品，统一由您所在的小区物业配送";
    lblTipFunc.font = [UIFont systemFontOfSize:12];
    lblTipFunc.textColor = [UIColor colorWithRed:175.0/255.0 green:175.0/255.0 blue:175.0/255.0 alpha:1.0];
    lblTipFunc.backgroundColor = [UIColor clearColor];
    [reciveFuncView addSubview:lblTipFunc];
    
    UIView *lineFuncBottom = [[UIView alloc] init];
    lineFuncBottom.backgroundColor = [UIColor colorWithRed:217.0/255.0 green:217.0/255.0 blue:217.0/255.0 alpha:1.0];
    lineFuncBottom.frame = CGRectMake(0, reciveFuncView.frame.size.height -1, SCREEN_WIDTH, 1);
    [reciveFuncView addSubview:lineFuncBottom];
}

- (void)clickBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [_backgroundView setContentSize:CGSizeMake(SCREEN_WIDTH, 2000.0f)];
}
//重新画导航栏标题
- (void)setNilValueForKey:(NSString *)title
{
    if (!title || [title isKindOfClass:[NSNull class]] || [title isEqualToString:@""]) {
        title = self.navigationItem.title;
    }
    UIFont *font = [UIFont fontWithName:@"STHeitiSC-Light" size:18];
    if (IOS7) {
        CGSize size = [title sizeWithAttributes:@{NSFontAttributeName:font}];
        [[self navigationItem] setTitle:title];
        CGRect lblRect = CGRectMake((320 - size.width)/2.0f, (self.navigationController.navigationBar.frame.size.height - size.height)/2.0f, size.width, size.height);
        UILabel *lblTiltle = [[UILabel alloc] initWithFrame:lblRect];
        lblTiltle.backgroundColor = [UIColor clearColor];
        lblTiltle.text = title;
        lblTiltle.font = font;
        UIButton *titleBtn = [[UIButton alloc] init];
        titleBtn.frame = CGRectMake(60, 0, 200, 44);
        titleBtn.backgroundColor = [UIColor clearColor];
        lblTiltle.frame = CGRectMake((titleBtn.frame.size.width - lblTiltle.frame.size.width)/2.0f, lblTiltle.frame.origin.y, lblTiltle.frame.size.width, lblTiltle.frame.size.height);
        [titleBtn addSubview:lblTiltle];
        self.navigationItem.titleView = titleBtn;
    }
    
    
    
}

@end
