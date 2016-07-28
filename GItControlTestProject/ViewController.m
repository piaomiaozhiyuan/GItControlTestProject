//
//  ViewController.m
//  GItControlTestProject
//
//  Created by cloudesy02 on 16/7/28.
//  Copyright © 2016年 CloudEasy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *txtNumberOne;/**<数一*/
@property (weak, nonatomic) IBOutlet UITextField *txtNumberTwo;/**<数二*/
@property (weak, nonatomic) IBOutlet UITextField *txtNumberValue;/**<结果一*/
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"货币计算";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 点击事件
//加
- (IBAction)clickPlus:(id)sender {
    [self testCaseOne];
}
//减
- (IBAction)clickSubtract:(UIButton *)sender forEvent:(UIEvent *)event {
    [self testCaseTwo];
}
//乘
- (IBAction)clickMultiply:(UIButton *)sender {
    [self testCaseThree];
}
//除
- (IBAction)clickDivide:(UIButton *)sender {
    
}
//等于
- (IBAction)clickEqual:(UIButton *)sender {
    
}
-(void)testCaseOne {
    //90.7049+0.22 然后四舍五入
    
    NSDecimalNumber *subtotal = [NSDecimalNumber decimalNumberWithString:@"90.7049"];
    
    NSDecimalNumber *discount = [NSDecimalNumber decimalNumberWithString:@"0.22"];
    
    /**
     NSRoundPlain,   // Round up on a tie ／／貌似取整 翻译出来是个圆 吗的垃圾百度翻译
     
     NSRoundDown,    // Always down == truncate  ／／只舍不入
     
     NSRoundUp,      // Always up    ／／ 只入不舍
     
     NSRoundBankers  // on a tie round so last digit is even  貌似四舍五入
     */
    
    NSDecimalNumberHandler *roundUp = [NSDecimalNumberHandler
                                       
                                       decimalNumberHandlerWithRoundingMode:NSRoundBankers
                                       
                                       scale:2
                                       
                                       raiseOnExactness:NO
                                       
                                       raiseOnOverflow:NO
                                       
                                       raiseOnUnderflow:NO
                                       
                                       raiseOnDivideByZero:YES];
    
    NSDecimalNumber *total = [subtotal decimalNumberByAdding:discount withBehavior:roundUp];
    
    NSLog(@"Rounded total: %@", total);
}

-(void)testCaseTwo {
    NSDecimalNumber*price1 = [NSDecimalNumber decimalNumberWithString:@"15.99"];
    
    NSDecimalNumber*price2 = [NSDecimalNumber decimalNumberWithString:@"29.99"];
    
    NSDecimalNumber*coupon = [NSDecimalNumber decimalNumberWithString:@"5.00"];
    
    NSDecimalNumber*discount = [NSDecimalNumber decimalNumberWithString:@".90"];
    
    NSDecimalNumber*numProducts = [NSDecimalNumber decimalNumberWithString:@"2.0"];
    
    
    
    NSDecimalNumber *subtotal = [price1 decimalNumberByAdding:price2];
    
    NSDecimalNumber *afterCoupon = [subtotal decimalNumberBySubtracting:coupon];
    
    NSDecimalNumber *afterDiscount = [afterCoupon decimalNumberByMultiplyingBy:discount];
    
    NSDecimalNumber *average = [afterDiscount decimalNumberByDividingBy:numProducts];
    
    NSDecimalNumber*averageSquared = [average decimalNumberByRaisingToPower:2];
}
-(void)testCaseThree {
    //保留小数点后两位
    
    NSDecimalNumberHandler*roundUp = [NSDecimalNumberHandler
                                      
                                      decimalNumberHandlerWithRoundingMode:NSRoundUp
                                      
                                      scale:2
                                      
                                      raiseOnExactness:NO
                                      
                                      raiseOnOverflow:NO
                                      
                                      raiseOnUnderflow:NO
                                      
                                      raiseOnDivideByZero:YES];
    
    
    
    //9折后 36.882 有余进位结果 36.89
    
    NSDecimalNumber*subtotal = [NSDecimalNumber decimalNumberWithString:@"40.98"];
    
    NSDecimalNumber*discount = [NSDecimalNumber decimalNumberWithString:@".90"];
    
    
    
    NSDecimalNumber*total = [subtotal decimalNumberByMultiplyingBy:discount
                             
                                                      withBehavior:roundUp];
    
    NSLog(@"Rounded total: %@", total);
}
    
@end
