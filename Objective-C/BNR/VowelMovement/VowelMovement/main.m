//
//  main.m
//  VowelMovement
//
//  Created by Arun Sivakumar on 1/12/20.
//

#import <Foundation/Foundation.h>


typedef void (^ArrayEnumerationBlock) (id, NSUInteger, BOOL *);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *originalStrings = @[@"big nerd ranch", @"arun", @"book"];
        NSLog(@"original strings: %@", originalStrings);
        
        
        NSMutableArray *devowelizedStrings = [NSMutableArray array];
        
        NSArray *vowels = @[@"a", @"e", @"i", @"o", @"u"];
        
        //void (^devowelizer) (id, NSUInteger, BOOL *);
        ArrayEnumerationBlock devowelizer;
        
        devowelizer = ^(id string, NSUInteger i, BOOL *stop) {
            
            // usage of BOOL - stop
            NSRange yRange = [string rangeOfString:@"y" options:NSCaseInsensitiveSearch];
            
            if (yRange.location != NSNotFound) {
                *stop = YES;
                return;
            }
            
            NSMutableString *newString = [NSMutableString stringWithString:string];
            
            for (NSString *s in vowels) {
                NSRange fullRange = NSMakeRange(0, [newString length]);
                [newString replaceOccurrencesOfString:s withString:@"" options:NSCaseInsensitiveSearch range:fullRange];
            }
            
            [devowelizedStrings addObject:newString];
        };
        
        [originalStrings enumerateObjectsUsingBlock:devowelizer];
        NSLog(@"devowelized string: %@", devowelizedStrings);
        
        
        
        // Block with return
        
        double (^divblock) (double, double);
        
        divblock = ^(double divident, double divisor) {
            return (divident / divisor);
        };
        
        double quotient = divblock(36, 6);
        NSLog(@"%f", quotient);
    }
    return 0;
}
