//
//  BNREmployee.m
//  BMITime
//
//  Created by Arun Sivakumar on 30/11/20.
//

#import "BNREmployee.h"

@implementation BNREmployee

-(double)yearsOfEmployment; {
    if (self.hireDate) {
        NSDate *now = [NSDate date];
        NSTimeInterval secs = [now timeIntervalSinceDate:self.hireDate];
        return secs / (365 * 24 * 60 * 60);
    } else {
        return 0;
    }
}

-(float)bodyMassIndex {
    return [super bodyMassIndex] * 0.9;
}

-(NSString *)description {
    return [NSString stringWithFormat:@"<Employee %d>", self.employeeID];
}

@end
