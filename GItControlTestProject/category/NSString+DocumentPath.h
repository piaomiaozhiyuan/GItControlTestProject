
#import <Foundation/Foundation.h>

@interface NSString (DocumentPath)

/**
 document 下路径
 */
+(NSString *)documentPathWith:(NSString *)fileName;
/**
 caches 下路径
 */
+(NSString *)cachesPathWith:(NSString *)fileName;
/**
 文件路径
 @param strName 文件名
 @param strType 文件类型
 */
+(NSString*)localDocPathWithFileName:(NSString*)strName type:(NSString*)strType;

@end
