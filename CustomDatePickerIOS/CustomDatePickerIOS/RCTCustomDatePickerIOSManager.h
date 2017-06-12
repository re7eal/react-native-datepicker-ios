#import <React/RCTConvert.h>
#import <React/RCTViewManager.h>

@interface RCTConvert(UIDatePicker)

+ (UIDatePickerMode)UIDatePickerMode:(id)json;

@end

@interface RCTConvert(Calendar)

+ (NSCalendar *)NSCalendar:(id)json;

@end

@interface RCTCustomDatePickerIOSManager : RCTViewManager

@end
