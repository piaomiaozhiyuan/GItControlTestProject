//
//  Common.m
//  GItControlTestProject
//
//  Created by cloudesy02 on 16/7/29.
//  Copyright © 2016年 CloudEasy. All rights reserved.
//

#import "Common.h"

@implementation Common

+(id)analysisLocationJsonWithName:(NSString*)strJsonName
{
    if (!strJsonName) {
        return nil;
    }
    NSString *path = [self documentPathWithName:strJsonName type:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    //3 解析json数据//json数据中的[] 对应OC中的NSArray//json数据中的{} 对应OC中的NSDictionary
    id json =  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    return json;
}
/**
 文件路径
 @param strName 文件名
 @param strType 文件类型
 */
+(NSString*)documentPathWithName:(NSString*)strName type:(NSString*)strType{
    NSString *path = [[NSBundle mainBundle] pathForResource:strName ofType:strType];
    return path;
}

@end
