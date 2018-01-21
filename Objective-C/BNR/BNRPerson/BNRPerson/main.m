//
//  main.m
//  BNRPerson
//
//  Created by Lakshmi on 11/30/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

#import <Foundation/Foundation.h>

//#include "BNRPerson.h"
#include "BNREmployee.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        
        
        BNREmployee *mikey = [[BNREmployee alloc] init];
        
        
        // values
        
//        [mikey setWeightInKilos:96];
//        [mikey setHeightInMeters:1.8];
        
        mikey.weightInKilos = 96;
        mikey.heightInMeters = 1.8;
        
        // getters
        
        float height = [mikey heightInMeters];
        int weight = [mikey weightInKilos];
        
        NSLog(@"height : %f",height);

        NSLog(@"weight : %d",weight);

        
        // custom methods
        
        float bmi = [mikey bodyMassIndex];
        NSLog(@"bmi : %f",bmi);
        
        
        mikey.employeeID = 12;
        mikey.hireDate = [NSDate dateWithNaturalLanguageString:@"Aug 2nd, 2010"];
        
        NSLog(@"Employee %u hired on %@",mikey.employeeID, mikey.hireDate);
        
        double yearsOfEmployment = [mikey yearsOfEmployment];
        NSLog(@"Employed with us for %.2f years",yearsOfEmployment);
    }
    return 0;
}
