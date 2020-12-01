//
//  BNRAppliance.m
//  Appliance
//
//  Created by Arun Sivakumar on 1/12/20.
//

#import "BNRAppliance.h"

@implementation BNRAppliance

- (NSString *) description {
    return [NSString stringWithFormat:@"<%@: %d volts>", self.productName, self.voltage];
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
@end
