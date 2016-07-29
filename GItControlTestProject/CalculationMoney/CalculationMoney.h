//
//  CalculationMoney.h
//  GItControlTestProject
//
//  Created by cloudesy02 on 16/7/28.
//  Copyright © 2016年 CloudEasy. All rights reserved.
//  参考 http://blog.csdn.net/u014063717/article/details/51862048

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, Operator) {
    //以下是枚举成员(用于管理运算类型)
    OperatorAdd               = 0,       //加法
    OperatorSubtracting       = 1,       //减法
    OperatorMultiplying       = 2,       //乘法
    OperatorDividing          = 3        //除法
};

@interface CalculationMoney : NSObject

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
                                    afterPoint:(short)position;
/**
 减法操作
 @param leftOperand rightOperand 两个字符串类型数字
 @returns 字符串类型数的差
 */
+(NSString*)calculationMoneySubWithLeftOperand:(NSString*)leftOperand
                                  rightOperand:(NSString*)rightOperand
                                  roundingMode:(NSRoundingMode)roundingModel
                                    afterPoint:(short)position;
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
                                    afterPoint:(short)position;
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
                                    afterPoint:(short)position;
/**
 四则运算操作
 @param leftOperand rightOperand 两个字符串类型数字
 @param roundingModel 取舍方式
 @param position 小数点后几位
 @param operatorType 运算类型
 @returns 字符串类型数的商
 */
+(NSString*)calculationMoneyWithLeftOperand:(NSString*)leftOperand
                                  rightOperand:(NSString*)rightOperand
                                  roundingMode:(NSRoundingMode)roundingModel
                                   operator:(Operator)operatorType
                                    afterPoint:(short)position;

@end
