//
//  CalculationMoney.m
//  GItControlTestProject
//
//  Created by cloudesy02 on 16/7/28.
//  Copyright © 2016年 CloudEasy. All rights reserved.
//

#import "CalculationMoney.h"

@implementation CalculationMoney

/**
 取舍方式 小数点位数
 */
+(NSDecimalNumberHandler *)instanceDecimalNumberHandlerWithRoundingMode:(NSRoundingMode)roundingModel afterPoint:(short)position {
    NSDecimalNumberHandler *decimalNumberHandler = [NSDecimalNumberHandler
                                       decimalNumberHandlerWithRoundingMode:roundingModel
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
 @param roundingModel 取舍方式
 @param position 小数点后几位
 @returns 计算结果
 @exception 减法时rightOperand不能为0
 */
+(NSString*)calculationMoneyWithLeftOperand:(NSString*)leftOperand
                               rightOperand:(NSString*)rightOperand
                                   operator:(Operator)operatorType
                               roundingMode:(NSRoundingMode)roundingModel
                                 afterPoint:(short)position {
    
    NSDecimalNumber *numberA = [NSDecimalNumber decimalNumberWithString:leftOperand];
    NSDecimalNumber *numberB = [NSDecimalNumber decimalNumberWithString:rightOperand];
    NSDecimalNumber *numberResult = [NSDecimalNumber zero];
    switch (operatorType) {
        case OperatorAdd: {//加法
            numberResult = [numberA decimalNumberByAdding:numberB withBehavior:[self instanceDecimalNumberHandlerWithRoundingMode:roundingModel afterPoint:position]];
        }
            break;
        case OperatorSubtracting: {//减法
            numberResult = [numberA decimalNumberBySubtracting:numberB withBehavior:[self instanceDecimalNumberHandlerWithRoundingMode:roundingModel afterPoint:position]];
        }
            break;
        case OperatorMultiplying: {//乘法
            numberResult = [numberA decimalNumberByMultiplyingBy:numberB withBehavior:[self instanceDecimalNumberHandlerWithRoundingMode:roundingModel afterPoint:position]];
        }
            break;
        case OperatorDividing: {//除法
            if (![[NSDecimalNumber notANumber]isEqualToNumber:numberB]) {//除数不为0
                numberResult = [numberA decimalNumberByDividingBy:numberB withBehavior:[self instanceDecimalNumberHandlerWithRoundingMode:roundingModel afterPoint:position]];
                }
        }
            break;
            
        default:
            break;
    }
    /**
     基本思想 1、当小数点后的参数>0的话 代表取小数点后几位（特殊情况：计算完的值小数位小于给定的position 我们要用零占位）
             2、当小数点后的参数<=0的话 小于零 向整数位取
     */
    NSString* strResult = [NSString stringWithFormat:@"%@",numberResult];
    if (position <= 0) {
        
    } else {
        strResult = [self normalizerData:strResult afterPoint:position];
    }
    
    return strResult;
}
/**
 规整数据
 */
+ (NSString*)normalizerData:(NSString*)strDecimal
                 afterPoint:(short)position {
    NSString *strResult = [strDecimal copy];
    //统一样式 0.00
    if ([strResult rangeOfString:@"."].length==0) {
        strResult = [strResult stringByAppendingString:@"."];
        for (int i = 0; i < position; i++) {
            strResult = [strResult stringByAppendingString:@"0"];
        }
    }else{
        NSRange range = [strResult rangeOfString:@"."];
        NSUInteger afterPointCurrent = strResult.length-range.location-1;
        if (afterPointCurrent == position) {
            
        }else{
            NSUInteger complementingCount = position - afterPointCurrent;
            for (int i = 0; i < complementingCount; i++) {
                strResult = [strResult stringByAppendingString:@"0"];
            }
        }
    }
    return strResult;
}
/**
 加法操作
 @param leftOperand rightOperand 两个字符串类型数字
 @param roundingModel 取舍方式
 @param position 小数点后几位
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
 @param roundingModel 取舍方式
 @param position 小数点后几位
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
 @param roundingModel 取舍方式
 @param position 小数点后几位
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
 @param roundingModel 取舍方式
 @param position 小数点后几位
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
/**
 四则运算操作
 @param leftOperand rightOperand 两个字符串类型数字
 @param roundingModel 取舍方式
 @param position 小数点后几位
 @param operatorType 运算类型
 @returns 字符串类型数的商
 @exception 注意strB不能为0
 */
+(NSString*)calculationMoneyWithLeftOperand:(NSString*)leftOperand
                               rightOperand:(NSString*)rightOperand
                               roundingMode:(NSRoundingMode)roundingModel
                                   operator:(Operator)operatorType
                                 afterPoint:(short)position {
    
    return [self calculationMoneyWithLeftOperand:leftOperand
                                    rightOperand:rightOperand
                                        operator:operatorType
                                    roundingMode:roundingModel
                                      afterPoint:position];
}
@end
