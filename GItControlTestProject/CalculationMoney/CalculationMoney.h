//
//  CalculationMoney.h
//  GItControlTestProject
//
//  Created by cloudesy02 on 16/7/28.
//  Copyright © 2016年 CloudEasy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculationMoney : NSObject

/**
 加法操作
 @param leftOperand rightOperand 两个字符串类型数字
 @returns 字符串类型数的和
 */
+(NSString*)calculationMoneyAddWithLeftOperand:(NSString*)leftOperand rightOperand:(NSString*)rightOperand;
/**
 减法操作
 @param leftOperand rightOperand 两个字符串类型数字
 @returns 字符串类型数的差
 */
+(NSString*)calculationMoneySubWithLeftOperand:(NSString*)leftOperand rightOperand:(NSString*)rightOperand;
/**
 乘法操作
 @param leftOperand rightOperand 两个字符串类型数字
 @returns 字符串类型数的积
 */
+(NSString*)calculationMoneyMulWithLeftOperand:(NSString*)leftOperand rightOperand:(NSString*)rightOperand;
/**
 除法操作
 @param leftOperand rightOperand 两个字符串类型数字
 @returns 字符串类型数的商
 @exception 注意strB不能为0
 */
+(NSString*)calculationMoneyDivWithLeftOperand:(NSString*)leftOperand rightOperand:(NSString*)rightOperand;

@end
