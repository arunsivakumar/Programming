//
//  BNREmployee.m
//  BNRPerson
//
//  Created by Lakshmi on 1/21/18.
//  Copyright © 2018 com.arunsivakumar. All rights reserved.
//

#import "BNREmployee.h"

@implementation BNREmployee


-(double)yearsOFEmployment{
    
    if(self.hireDate){
        // NSTimeInterval is the same as double
        
        NSDate *now = [NSDate date];
        NSTimeInterval secs = [now timeIntervalSinceDate:self.hireDate];
        return secs / 31557600.0; // seconds per year
    }else{
        return 0;
    }
}

-(float)bodyMassIndex{
    return [super bodyMassIndex] * 0.9;
}

@end
