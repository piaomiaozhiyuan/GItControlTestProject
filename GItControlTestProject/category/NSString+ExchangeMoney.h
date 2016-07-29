//
//  NSString+ExchangeMoney.h
//  GItControlTestProject
//
//  Created by cloudesy02 on 16/7/29.
//  Copyright © 2016年 CloudEasy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ExchangeMoney)

/** 
 直接传入精度丢失有问题的Double类型
 转换成字符串数据
 */
+(NSString *)decimalNumberWithDouble:(double)conversionValue;
/**
 直接传入精度丢失有问题的NSNumber类型
 转换成字符串数据
 */
+(NSString *)decimalNumberWithNumber:(NSNumber*)conversionValue;
@end
