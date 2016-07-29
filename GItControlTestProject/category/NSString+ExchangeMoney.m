//
//  NSString+ExchangeMoney.m
//  GItControlTestProject
//
//  Created by cloudesy02 on 16/7/29.
//  Copyright © 2016年 CloudEasy. All rights reserved.
//

#import "NSString+ExchangeMoney.h"

@implementation NSString (ExchangeMoney)

/** 直接传入精度丢失有问题的Double类型*/
+(NSString *)decimalNumberWithDouble:(double)conversionValue {
    NSString *doubleString        = [NSString stringWithFormat:@"%lf", conversionValue];
    NSDecimalNumber *decNumber    = [NSDecimalNumber decimalNumberWithString:doubleString];
    return [decNumber stringValue];
}
+(NSString *)decimalNumberWithNumber:(NSNumber*)conversionValue {
    return [self decimalNumberWithDouble:[conversionValue doubleValue]];
}

@end
