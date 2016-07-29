
#import "NSString+DocumentPath.h"

@implementation NSString (DocumentPath)

//document 路径
+(NSString *)documentPathWithFileName:(NSString *)fileName
{
    return [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",fileName]];
}
//caches文件路径
+(NSString *)cachesPathWithFileName:(NSString *)fileName
{
    return [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",fileName]];
}
//本地文件路径
+(NSString*)localDocPathWithFileName:(NSString*)strName type:(NSString*)strType
{
    NSString *path = [[NSBundle mainBundle] pathForResource:strName ofType:strType];
    return path;
}
@end
