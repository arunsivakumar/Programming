//
//  BNREmployee.m
//  BNRPerson
//
//  Created by Lakshmi on 1/21/18.
//  Copyright © 2018 com.arunsivakumar. All rights reserved.
//

#import "BNREmployee.h"
#import "BNRAsset.h"

@interface BNREmployee()
@property (nonatomic) unsigned int officeAlarmCode;
@end

@implementation BNREmployee

- (NSString *)description
{
    return [NSString stringWithFormat:@"<Employee %u, $%u in assets>", self.employeeID, self.valueOfAssets];
}

- (void)dealloc
{
    NSLog(@"deallocating %@", self);
}

-(double)yearsOfEmployment{
    
    if(self.hireDate){
        // NSTimeInterval is the same as double
        
        NSDate *now = [NSDate date];
        NSTimeInterval secs = [now timeIntervalSinceDate:self.hireDate];
        return secs / 31557600.0; // seconds per year
    }else{
        return 0;
    }
}

-(void)setAssets:(NSArray *)a{
     _assets = [a mutableCopy];
}

-(NSArray *)assets{
    return [_assets copy];
}


-(void)addAsset:(BNRAsset *)a{
   
    if(!_assets){
        _assets = [[NSMutableArray alloc] init];
    }
    [_assets addObject:a];
}

-(unsigned int)valueOfAssets{
    unsigned int sum = 0;
    
    for(BNRAsset *a in _assets){
        sum += [a resaleValue];
    }
    return sum;
}

-(float)bodyMassIndex{
    return [super bodyMassIndex] * 0.9;
}

@end
