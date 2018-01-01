//
//  main.m
//  BNRPerson
//
//  Created by Lakshmi on 11/30/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

#import <Foundation/Foundation.h>

#include "BNRPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        
        
        BNRPerson *mikey = [[BNRPerson alloc] init];
        
        
        // values
        
        [mikey setWeightInKilos:96];
        [mikey setHeightInMeters:1.8];
        
        
        // getters
        
        float height = [mikey heightInMeters];
        int weight = [mikey weightInKilos];
        
        NSLog(@"height : %f",height);

        NSLog(@"weight : %d",weight);

        
        // custom methods
        
        float bmi = [mikey bodyMassIndex];
        NSLog(@"bmi : %f",bmi);
    }
    return 0;
}
