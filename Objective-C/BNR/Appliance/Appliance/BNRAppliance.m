//
//  BNRAppliance.m
//  Appliance
//
//  Created by Arun Sivakumar on 1/12/20.
//

#import "BNRAppliance.h"

@interface BNRAppliance()
{
    NSString *_productName;
}
@end

@implementation BNRAppliance

- (NSString *) description {
    return [NSString stringWithFormat:@"<%@: %d volts>", _productName, self.voltage];
}

- (instancetype)init {
    
    return [self initWithProductName:@"unknown"];
}

- (instancetype)initWithProductName:(NSString *)pn {
    self = [super init];
    
    if (self) {
        _productName = [pn copy];
        _voltage = 120;
    }
    
    return self;
}

- (void)setVoltage:(int)x {
    NSLog(@"setting voltage to %d", x);
    _voltage = x;
}
@end
