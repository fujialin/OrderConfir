//
//  SpecialPriceViewController.m
//  OrderConfir
//
//  Created by 付加霖 on 14-8-13.
//  Copyright (c) 2014年 fujl. All rights reserved.
//

#import "SpecialPriceViewController.h"

@interface SpecialPriceViewController ()

@end

@implementation SpecialPriceViewController

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
    self.title = @"特价生鲜";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableDataSource = [[UITableView alloc] init];
    _tableDataSource.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    _tableDataSource.backgroundColor = [UIColor yellowColor];
    _tableDataSource.delegate = self;
    [self.view addSubview:_tableDataSource];
    [_tableDataSource reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma EVENT
- (void)selectorProduct:(id)sender
{
    NSLog(@"selector");
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//返回TableView HeaderView 高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 30;
    }
    return 0;
}

//返回HeaderView视图
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        if (!_headView) {
            _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
            // 245 245 242
            _headView.backgroundColor = [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:242.0/255.0 alpha:1.0];
            _selectorBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, (SCREEN_WIDTH - 1)/2.0f, 30)];
            [_selectorBtn setTitle:@"筛选" forState:UIControlStateNormal];
            //_selectorBtn.titleLabel.text = @"筛选";
            _selectorBtn.titleLabel.textAlignment =NSTextAlignmentCenter;
            // 153 153 153
            [_selectorBtn setTitleColor: [UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1.0] forState:UIControlStateNormal];
            [_selectorBtn setTitleColor: [UIColor colorWithRed:117.0/255.0 green:176.0/255.0 blue:43.0/255.0 alpha:1.0] forState:UIControlStateSelected];
            [_selectorBtn addTarget:self action:@selector(selectorProduct:) forControlEvents:UIControlEventTouchUpInside];
            [_headView addSubview:_selectorBtn];
            // 分割线
            UIView *lineView = [[UIView alloc] init];
            lineView.frame = CGRectMake(CGRectGetMaxX(_selectorBtn.frame), (30 - 20)/2.0f, 1, 20);
            lineView.backgroundColor = [UIColor colorWithRed:211.0/255.0 green:211.0/255.0 blue:211.0/255.0 alpha:1.0];
            [_headView addSubview:lineView];
            
            _priceLowestBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lineView.frame), 0, (SCREEN_WIDTH - 1)/2.0f, 30)];
            
            _priceLowestBtn.titleLabel.text = @"价格最低";
            [_selectorBtn setTitle:@"价格最低" forState:UIControlStateNormal];            _priceLowestBtn.titleLabel.textAlignment =NSTextAlignmentCenter;
            // 153 153 153
            [_priceLowestBtn setTitleColor: [UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1.0] forState:UIControlStateNormal];
            [_priceLowestBtn setTitleColor: [UIColor colorWithRed:117.0/255.0 green:176.0/255.0 blue:43.0/255.0 alpha:1.0] forState:UIControlStateSelected];
            [_priceLowestBtn addTarget:self action:@selector(selectorProduct:) forControlEvents:UIControlEventTouchUpInside];
            [_headView addSubview:_priceLowestBtn];
        }
        return _headView;
    }
    return nil;
}

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}
@end
