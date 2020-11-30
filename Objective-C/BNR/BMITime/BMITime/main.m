//
//  main.m
//  BMITime
//
//  Created by Arun Sivakumar on 29/11/20.
//

#import <Foundation/Foundation.h>
#import "BNREmployee.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BNREmployee *mikey = [[BNREmployee alloc] init];
        
        mikey.weightInKilos = 96;
        mikey.heightInMeters = 1.8;
        
        mikey.employeeID = 12;
        mikey.hireDate = [NSDate dateWithNaturalLanguageString:@"Aug 2nd, 2010"];
        
        NSLog(@"mikey is %.2f meters tall and weighs %d kilos", [mikey heightInMeters], [mikey weightInKilos]);
        NSLog(@"Employee %@ hired on %@", mikey, mikey.hireDate);
        
        float bmi = [mikey bodyMassIndex];
        NSLog(@"mikey's BMI %f", bmi);
    }
    return 0;
}
