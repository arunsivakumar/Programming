//
//  BNREmployee.m
//  BMITime
//
//  Created by Arun Sivakumar on 30/11/20.
//

#import "BNREmployee.h"
#import "BNRAsset.h"

@interface BNREmployee()

{
    NSMutableArray *_assets;
}

@property(nonatomic) unsigned int officeAlarmCode;
@end

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
    return [NSString stringWithFormat:@"<Employee %u: $%u in assets>", self.employeeID, self.valueOfAssets];
}

-(void)dealloc {
    NSLog(@"deallocating %@", self);
}

- (void)setAssets: (NSArray *)a {
    _assets = [a mutableCopy];
}

- (NSArray *)assets {
    return [_assets copy];
}

-(void)addAsset: (BNRAsset *)a {
    if (!_assets) {
        _assets = [[NSMutableArray alloc] init];
    }
    [_assets addObject:a];
}

-(unsigned int)valueOfAssets {
    unsigned int sum = 0;
    for (BNRAsset *a in _assets) {
        sum += [a resaleValue];
    }
    return sum;
}

@end
