//
//  main.m
//  BMITime
//
//  Created by Arun Sivakumar on 29/11/20.
//

#import <Foundation/Foundation.h>
#import "BNREmployee.h"
#import "BNRAsset.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        BNREmployee *mikey = [[BNREmployee alloc] init];
//
//        mikey.weightInKilos = 96;
//        mikey.heightInMeters = 1.8;
//
//        mikey.employeeID = 12;
//        mikey.hireDate = [NSDate dateWithNaturalLanguageString:@"Aug 2nd, 2010"];
//
//        NSLog(@"mikey is %.2f meters tall and weighs %d kilos", [mikey heightInMeters], [mikey weightInKilos]);
//        NSLog(@"Employee %@ hired on %@", mikey, mikey.hireDate);
//
//        float bmi = [mikey bodyMassIndex];
//        NSLog(@"mikey's BMI %f", bmi);
        
        NSMutableArray *employees = [[NSMutableArray alloc] init];
        
        for (int i = 0 ; i < 10 ; i++) {
            BNREmployee *mikey = [[BNREmployee alloc]init];
            
            mikey.weightInKilos = 90 + i;
            mikey.heightInMeters = 1.8 - i / 10.0;
            mikey.employeeID = i;
            
            [employees addObject:mikey];
        }
        
        // create 10 assets
        
        NSMutableArray *allAssets = [[NSMutableArray alloc] init];

        
        for (int i = 0 ; i < 10 ; i++) {
            BNRAsset *asset = [[BNRAsset alloc] init];
            
            asset.label = [NSString stringWithFormat:@"Laptop %d", i];
            asset.resaleValue = 350 + i * 17;
            
            NSUInteger randomIndex = random() % [employees count];
            
            BNREmployee *randomEmployee = [employees objectAtIndex:randomIndex];
            
            
            [randomEmployee addAsset:asset];
            
            NSLog(@"Random Employee %@, asset: %@", randomEmployee, randomEmployee.assets);
            [allAssets addObject:asset];
        }
        
        NSLog(@"Employees: %@", employees);
        NSLog(@"Giving up ownership of one employee");
        
        [employees removeObjectAtIndex:5];
        
        NSLog(@"allAssets: %@", allAssets);
        
        NSLog(@"Giving up ownership of arrays");
        
        allAssets = nil;
        employees = nil;
    }
    sleep(100);
    return 0;
}
