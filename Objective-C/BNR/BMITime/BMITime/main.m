//
//  main.m
//  BMITime
//
//  Created by Arun Sivakumar on 29/11/20.
//

#import <Foundation/Foundation.h>
#import "BNRPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BNRPerson *mikey = [[BNRPerson alloc] init];
        
        mikey.weightInKilos = 96;
        mikey.heightInMeters = 1.8;
        
        NSLog(@"mikey is %.2f meters tall and weighs %d kilos", [mikey heightInMeters], [mikey weightInKilos]);
        
        float bmi = [mikey bodyMassIndex];
        NSLog(@"mikey's BMI %f", bmi);
    }
    return 0;
}
