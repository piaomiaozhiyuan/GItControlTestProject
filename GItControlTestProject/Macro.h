//
//  Macro.h
//  
//
//
//
//  全局宏文件
//  **宏命名规则 K开头＋功能例如:Color + 标示名:Background **

#ifndef UsmileProject_Macro_h
#define UsmileProject_Macro_h

//-------------------获取设备大小-------------------------
//获取屏幕 宽度、高度
#define KMAIN_WINDOW  [[[UIApplication sharedApplication] delegate] window]
#define KScreenWidth  ([UIScreen mainScreen].bounds.size.width)
#define KScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define KLayerCorner  5.0
#define iPhone5 KScreenWidth>=320
//-------------------获取设备大小-------------------------

//-------------------网络及其他常用宏-------------------------

#define KDefaultSet(key,object) {NSUserDefaults *info = [NSUserDefaults standardUserDefaults];[info setObject:object forKey:key];[info synchronize];}
#define KDefaultGet(key)        [[NSUserDefaults standardUserDefaults]valueForKey:key]
#define KDefaultClear(key)      {NSUserDefaults *info = [NSUserDefaults standardUserDefaults];[info removeObjectForKey:key];[info synchronize];}
#define KALERT_VIEW(STR)        do{ if([STR isKindOfClass:[NSString class]]) {UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:STR delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];[alert show];}}while(0);
#define KToaster(message,view)  do{[[ToastManager shared] toastMessage:message InView:view];}while(0)
#define KBeginLoading(view)     do{[[LoadingManager shareInstance]showLoadingWithView:view];}while (0)
#define KEndLoading(view)       do{[[LoadingManager shareInstance]hiddonLoadingWithView:view];}while (0)
//-------------------网络及其他常用宏-------------------------

//----------------------颜色类---------------------------
// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define KColorRGBA(r,g,b,a)      [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define KColorRGB(r,g,b)         KColorRGBA(r,g,b,1.0f)

//背景色
#define KColorBG                 KColorRGBA(245.0,245.0,245.0,1.0f)
#define KColorLightRed           KColorRGB(234,83,93)
#define KColorDarkRed            KColorRGB(214,50,49)
#define KColorBarTini            KColorRGB(59,147,44)
#define KColorLightGray          KColorRGB(137,137,137)
#define KColorDarkGray           KColorRGB(89,86,86)
//(205,205,205)
#define KColorLine               KColorRGB(230,230,230)
#define KColorText               KColorRGB(169,169,169)

//navigation 标题字号颜色
#define KNavigationBarDic @{NSFontAttributeName:[UIFont boldSystemFontOfSize:18],NSForegroundColorAttributeName:KColorLightRed}
//----------------------颜色类--------------------------

//----------------------系统----------------------------
//获取系统版本
#define KIOS_VERSION          [[[UIDevice currentDevice] systemVersion] floatValue]
#define KCurrentSystemVersion [[UIDevice currentDevice] systemVersion]


//获取当前语言
#define KCurrentLanguage      ([[NSLocale preferredLanguages] objectAtIndex:0])
//----------------------系统----------------------------

//-------------------打印日志-------------------------
//DEBUG  模式下打印日志,当前行
#ifdef DEBUG
#   define KDLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define KDLog(...)
#endif

//重写NSLog,Debug模式下打印日志和当前行数
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

//DEBUG  模式下打印日志,当前行 并弹出一个警告
#ifdef DEBUG
#   define KULog(fmt, ...)  { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [alert show]; }
#else
#   define KULog(...)
#endif
//-------------------打印日志-------------------------

//----------------------图片----------------------------

//读取本地图片
#define KLOADIMAGE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]

//定义UIImage对象
#define KIMAGE(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]

//定义UIImage对象
#define KImageNamed(_pointer) [UIImage imageNamed:_pointer]

//建议使用前两种宏定义,性能高于后者
//----------------------图片----------------------------

//其他
/*用于商品详情滑动切换试图*/
#define kJianGe  60


#endif
