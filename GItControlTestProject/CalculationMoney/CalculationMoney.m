//
//  CalculationMoney.m
//  GItControlTestProject
//
//  Created by cloudesy02 on 16/7/28.
//  Copyright © 2016年 CloudEasy. All rights reserved.
//

#import "CalculationMoney.h"

@implementation CalculationMoney

typedef NS_ENUM(NSInteger, Operator) {
    //以下是枚举成员(用于管理运算类型)
    OperatorAdd               = 0,       //加法
    OperatorSubtracting       = 1,       //减法
    OperatorMultiplying       = 2,       //乘法
    OperatorDividing          = 3        //除法
};
+(NSDecimalNumberHandler *)instanceDecimalNumberHandlerWithRoundingMode:(NSRoundingMode)roundingModel afterPoint:(short)position {
    NSDecimalNumberHandler *decimalNumberHandler = [NSDecimalNumberHandler
                                       decimalNumberHandlerWithRoundingMode:NSRoundBankers
                                       scale:position
                                       raiseOnExactness:NO
                                       raiseOnOverflow:NO
                                       raiseOnUnderflow:NO
                                       raiseOnDivideByZero:YES];
    return decimalNumberHandler;
}
/**
 执行运算
 @param leftOperand rightOperand 两个字符串类型数字
 @param operator 运算类型
 @returns 计算结果
 @exception 减法时rightOperand不能为0
 */
+(NSString*)calculationMoneyWithLeftOperand:(NSString*)leftOperand rightOperand:(NSString*)rightOperand operator:(Operator)operator {
    NSString *strResult = @"0";
    NSDecimalNumber *numberA = [NSDecimalNumber decimalNumberWithString:leftOperand];
    NSDecimalNumber *numberB = [NSDecimalNumber decimalNumberWithString:rightOperand];
    switch (operator) {
        case OperatorAdd: {//加法
            strResult = [[numberA decimalNumberByAdding:numberB withBehavior:[self instanceDecimalNumberHandlerWithRoundingMode:roundingModel afterPoint:position]] stringValue];
        }
            break;
        case OperatorSubtracting: {//减法
            strResult = [[numberA decimalNumberBySubtracting:numberB withBehavior:[self instanceDecimalNumberHandlerWithRoundingMode:roundingModel afterPoint:position]] stringValue];
        }
            break;
        case OperatorMultiplying: {//乘法
            strResult = [[numberA decimalNumberByMultiplyingBy:numberB withBehavior:[self instanceDecimalNumberHandlerWithRoundingMode:roundingModel afterPoint:position]] stringValue];
        }
            break;
        case OperatorDividing: {//除法
            if (![[NSDecimalNumber notANumber]isEqualToNumber:numberB]) {//除数不为0
               strResult = [[numberA decimalNumberByDividingBy:numberB withBehavior:[self instanceDecimalNumberHandlerWithRoundingMode:roundingModel afterPoint:position]] stringValue];
            }
        }
            break;
            
        default:
            break;
    }
    return strResult;
}
/**
 加法操作
 @param leftOperand rightOperand 两个字符串类型数字
 @returns 字符串类型数的和
 */
+(NSString*)calculationMoneyAddWithLeftOperand:(NSString*)leftOperand
                                  rightOperand:(NSString*)rightOperand
                                  roundingMode:(NSRoundingMode)roundingModel
                                    afterPoint:(short)position {
    return [self calculationMoneyWithLeftOperand:leftOperand
                                    rightOperand:rightOperand
                                        operator:OperatorAdd
                                    roundingMode:roundingModel
                                      afterPoint:position];
}
/**
 减法操作
 @param leftOperand rightOperand 两个字符串类型数字
 @returns 字符串类型数的差
 */
+(NSString*)calculationMoneySubWithLeftOperand:(NSString*)leftOperand
                                  rightOperand:(NSString*)rightOperand
                                  roundingMode:(NSRoundingMode)roundingModel
                                    afterPoint:(short)position {
    return [self calculationMoneyWithLeftOperand:leftOperand
                                    rightOperand:rightOperand
                                        operator:OperatorSubtracting
                                    roundingMode:roundingModel
                                      afterPoint:position];
}
/**
 乘法操作
 @param leftOperand rightOperand 两个字符串类型数字
 @returns 字符串类型数的积
 */
+(NSString*)calculationMoneyMulWithLeftOperand:(NSString*)leftOperand
                                  rightOperand:(NSString*)rightOperand
                                  roundingMode:(NSRoundingMode)roundingModel
                                    afterPoint:(short)position {
    return [self calculationMoneyWithLeftOperand:leftOperand
                                    rightOperand:rightOperand
                                        operator:OperatorMultiplying
                                    roundingMode:roundingModel
                                      afterPoint:position];
}
/**
 除法操作
 @param leftOperand rightOperand 两个字符串类型数字
 @returns 字符串类型数的商
 @exception 注意rightOperand不能为0
 */
+(NSString*)calculationMoneyDivWithLeftOperand:(NSString*)leftOperand
                                  rightOperand:(NSString*)rightOperand
                                  roundingMode:(NSRoundingMode)roundingModel
                                    afterPoint:(short)position {
    return [self calculationMoneyWithLeftOperand:leftOperand
                                    rightOperand:rightOperand
                                        operator:OperatorDividing
                                    roundingMode:roundingModel
                                      afterPoint:position];
}

@end
