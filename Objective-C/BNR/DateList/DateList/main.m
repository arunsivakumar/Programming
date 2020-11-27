//
//  main.m
//  DateList
//
//  Created by Lakshmi on 11/28/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        
//chapter 17 - NSArray
        
        /*
          id selectedDog = dogs[tableView selectedRow] instead of this
         use
         id selectedDog = [dogs objkectAtIndex:[tableView selectedRow]];
         */
        
        
        NSDate *now = [NSDate date];
        NSDate *yesterday = [now dateByAddingTimeInterval:-24*60*60];
        NSDate *tomorrow = [now dateByAddingTimeInterval:24*60*60];
        
        NSArray *dateList = @[now,tomorrow, yesterday]; //immutable
        
        
        //accessing
        
        NSLog(@"first item %@",dateList[0]);
        NSLog(@"second item %@",dateList[1]);
        
        NSLog(@"count %lu",[dateList count]);
        
        //iterating
        
        NSUInteger dateCount = [dateList count];
        
        for (int i = 0; i < dateCount; i++){
            NSLog(@"%@",dateList[i]);
        }
        
        for (NSDate *date in dateList){ // fast enumeration
            NSLog(@"%@",date);
        }
        
        
        // NSMutable Array
        
        NSMutableArray *dateListMutable = [NSMutableArray array]; // alt [[NSMutableArray alloc] init];
        
        
        [dateListMutable addObject:now];
        [dateListMutable addObject:tomorrow];

        [dateListMutable insertObject:yesterday atIndex:0]; // insert
       [dateListMutable removeObjectAtIndex:1]; //remove

        for(NSDate *date in dateListMutable){
            //[dateListMutable removeObjectAtIndex:1]; this will crash avoid adding or removing in fast enumeration. use standard for loops
            NSLog(@"The date mutable is %@", date);
        }
        
        //challenge // old style array methods
        NSMutableArray *groceryList = [NSMutableArray arrayWithObjects:@"My grocey list is", @"Loaf of bread", @"Milk",@"Butter", nil];
        
        for(int i = 0 ; i < [groceryList count]; i++){
            NSLog(@"%@",[groceryList objectAtIndex:i]);
        } //also use fast enumeration
        
        //literal syntax [NSArray array] and subscripting dateList[0]
        //id selectedDog = [dogs[tableView selectedRow] ]; // this might be confusing -
        //id selectedDog = [dogs objectAtIndex: [tableView selectedRow]]; use this
        

        // interesting names
        
        // read the file
        
        NSLog(@"Read file challenge ------");
        
        NSString *nameString = [NSString stringWithContentsOfFile:@"/usr/share/dict/propernames" encoding:NSUTF8StringEncoding error:NULL];
        
        
        // break it into an array
        
        NSArray *names = [nameString componentsSeparatedByString:@"\n"];
        
        for (NSString *n in names) {
            NSRange r = [n rangeOfString:@"AA" options:NSCaseInsensitiveSearch];
            
            // found??
            if(r.location != NSNotFound){
                NSLog(@"%@",n);
            }
        }
        
        
        
    }
    return 0;
}
