#import "RCTCustomDatePickerIOS.h"

#import <React/RCTUtils.h>
#import <React/UIView+React.h>

@interface RCTCustomDatePickerIOS ()

@property (nonatomic, copy) RCTBubblingEventBlock onChange;

@end

@implementation RCTCustomDatePickerIOS

- (instancetype)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        [self addTarget:self action:@selector(didChange)
       forControlEvents:UIControlEventValueChanged];
    }
    return self;
}

RCT_NOT_IMPLEMENTED(- (instancetype)initWithCoder:(NSCoder *)aDecoder)

- (void)didChange
{
    if (_onChange) {
        _onChange(@{ @"timestamp": @(self.date.timeIntervalSince1970 * 1000.0) });
    }
}

@end
