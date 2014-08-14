//
//  ViewController.m
//  OrderConfir
//
//  Created by stupid_pig on 14-8-13.
//  Copyright (c) 2014年 fujl. All rights reserved.
//

#import "ViewController.h"
#import "OrderConfirmationViewController.h"
#import "SpecialPriceViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)dealloc
{

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    _orderConfirmationBtn = [[UIButton alloc] init];
    _orderConfirmationBtn.frame = CGRectMake(20, 150, 100, 30);
    UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    lblTitle.textColor = [UIColor yellowColor];
    lblTitle.text = @"订单确认";
    lblTitle.backgroundColor = [UIColor clearColor];
    [_orderConfirmationBtn addSubview:lblTitle];
    _orderConfirmationBtn.backgroundColor = [UIColor redColor];
    [_orderConfirmationBtn addTarget:self action:@selector(goOrderConfirmation:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_orderConfirmationBtn];
    
    
    _sepicalPriceBtn = [[UIButton alloc] init];
    _sepicalPriceBtn.frame = CGRectMake(20, CGRectGetMaxY(_orderConfirmationBtn.frame) + 20, 100, 30);
    UILabel *lblTitle1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    lblTitle1.textColor = [UIColor yellowColor];
    lblTitle1.text = @"特价生鲜";
    lblTitle1.backgroundColor = [UIColor clearColor];
    [_sepicalPriceBtn addSubview:lblTitle1];
    _sepicalPriceBtn.backgroundColor = [UIColor redColor];
    [_sepicalPriceBtn addTarget:self action:@selector(goSpecialPrice:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_sepicalPriceBtn];
}
- (void)goSpecialPrice:(id)sender
{
    NSLog(@"特价生鲜");
    SpecialPriceViewController *controller = [[SpecialPriceViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)goOrderConfirmation:(id)sender
{
    NSLog(@"订单确认");
    OrderConfirmationViewController *controller = [[OrderConfirmationViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
