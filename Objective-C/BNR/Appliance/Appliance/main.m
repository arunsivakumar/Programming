//
//  main.m
//  Appliance
//
//  Created by Arun Sivakumar on 1/12/20.
//

#import <Foundation/Foundation.h>
#import "BNRAppliance.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BNRAppliance *a = [[BNRAppliance alloc] init];
        NSLog(@" a is %@", a);
        //[a setProductName:@"Washing Machine"];
//        [a setVoltage:240];
        [a setValue:[NSNumber numberWithInt:240] forKey:@"voltage"];
        NSLog(@" a is %@", a);
        
        // KVC
        NSLog(@"The product name is %@", [a valueForKey:@"productName"]);
    }
    return 0;
}
