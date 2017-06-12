#import "RCTCustomDatePickerIOSManager.h"

#import "RCTCustomDatePickerIOS.h"
#import <React/UIView+React.h>


@implementation RCTConvert(UIDatePicker)

RCT_ENUM_CONVERTER(UIDatePickerMode, (@{
                                        @"time": @(UIDatePickerModeTime),
                                        @"date": @(UIDatePickerModeDate),
                                        @"datetime": @(UIDatePickerModeDateAndTime),
                                        @"countdown": @(UIDatePickerModeCountDownTimer), // not supported yet
                                        }), UIDatePickerModeTime, integerValue)

@end

@implementation RCTConvert(Calendar)

+ (NSCalendar *)NSCalendar:(id)json
{
    NSDictionary * calendarDict = @{@"gregorian": NSCalendarIdentifierGregorian,
                                    @"islamicUmmAlQura" : NSCalendarIdentifierIslamicUmmAlQura,
                                    @"islamic": NSCalendarIdentifierIslamic,
                                    @"chinese":NSCalendarIdentifierChinese,
                                    @"coptic":NSCalendarIdentifierCoptic,
                                    @"iso8601":NSCalendarIdentifierISO8601,
                                    @"indian":NSCalendarIdentifierIndian,
                                    @"islamicCivil":NSCalendarIdentifierIslamicCivil,
                                    @"japanese":NSCalendarIdentifierJapanese,
                                    @"persian":NSCalendarIdentifierPersian,
                                    @"republicOfChina":NSCalendarIdentifierRepublicOfChina,
                                    @"buddhist":NSCalendarIdentifierBuddhist,
                                    @"islamicTabular":NSCalendarIdentifierIslamicTabular};
    
    if (json) {
        return [NSCalendar calendarWithIdentifier:calendarDict[json]];
    } else {
        return nil;
    }
}

@end

@implementation RCTCustomDatePickerIOSManager

RCT_EXPORT_MODULE()

- (UIView *)view
{
    return [RCTCustomDatePickerIOS new];
}

RCT_EXPORT_VIEW_PROPERTY(date, NSDate)
RCT_EXPORT_VIEW_PROPERTY(minimumDate, NSDate)
RCT_EXPORT_VIEW_PROPERTY(maximumDate, NSDate)
RCT_EXPORT_VIEW_PROPERTY(minuteInterval, NSInteger)
RCT_EXPORT_VIEW_PROPERTY(onChange, RCTBubblingEventBlock)
RCT_REMAP_VIEW_PROPERTY(mode, datePickerMode, UIDatePickerMode)
RCT_REMAP_VIEW_PROPERTY(timeZoneOffsetInMinutes, timeZone, NSTimeZone)
RCT_EXPORT_VIEW_PROPERTY(calendar, NSCalendar)

@end
