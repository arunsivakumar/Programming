//
//  main.m
//  TimeAfterTime
//
//  Created by Lakshmi on 11/28/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//



#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        /*
         chapter 13 - Objects
         
         Stuct - members
         Class - instance variables (ivar), methods
         #import - is much faster and compiler checks if another calss already imported it
         NSLog - prefaces with date, time, process ID
         
         */
        NSLog(@"chapter 13----------------------------------\n");

        NSDate *now = [NSDate date]; // NSDate claims some memory, init with current date and time,(date) class method
        NSLog(@"This date lives at %p",now);
        NSLog(@"The date is now %@",now); // %@ description of itself
        
        double seconds = [now timeIntervalSince1970]; // (timeIntervalSince1970)instance method
        NSLog(@"The diff in seconds %f",seconds);
        
//        doubletestSeconds = [NSDate timeIntervalSince1970];
//        NSDate *testNow = [now date];
        
        // challenge
        
        NSHost *host = [NSHost currentHost];
        NSString *hostName = [host localizedName];
        NSLog(@"the current host is %@",host);
        NSLog(@"the current host name is %@",hostName);
        

        /*
         chapter 14 - More Messages
         
         dont nest message sends except for allc and init
         
         // NSDate *now = [NSDate date]; // convinience method
         
         id delegate; //pointer to unknown type
         
         */
        NSLog(@"chapter 14----------------------------------\n");

        
        NSDate *later = [now dateByAddingTimeInterval:100000];
        NSLog(@"The date after adding %@",later);
        
        NSCalendar *cal = [NSCalendar currentCalendar];
        NSLog(@"The current calender is %@",[cal calendarIdentifier]);
        NSLog(@"The current calender Day is %lu",(unsigned long)[cal ordinalityOfUnit:NSCalendarUnitDay
                                                                               inUnit:NSCalendarUnitMonth
                                                                              forDate:now]);
        
        // nesting message
        double seconds2 = [[NSDate date] timeIntervalSince1970];
        NSLog(@"The diff in seconds %f",seconds2);
        
        // alloc init
        // NSDate *now = [NSDate date]; // convinience method
        NSDate *date2 = [[NSDate alloc] init];
        NSLog(@"The current date is %@",date2);
        
        //sending messages to nil
        NSDate *fido = nil;
        double seconds3 = [fido timeIntervalSince1970]; // double value is zero
        NSLog(@"The diff in seconds %f",seconds3);
        
        //id
        id delegate; //pointer to unknown type
        
        // challenge
        
        
        NSDateComponents *comp = [[NSDateComponents alloc] init];
        [comp setYear:1985];
        [comp setMonth:11];
        [comp setDay:02];
        [comp setHour:23];
        [comp setMinute:30];
        [comp setSecond:0];
        
        NSCalendar *g = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDate *dateOfBirth = [g dateFromComponents:comp];
        NSLog(@"The date of birth is %@",dateOfBirth);
        
        double secondsSinceEarlierDate = [now timeIntervalSinceDate:dateOfBirth];
        NSLog(@"The diff in seconds %f",secondsSinceEarlierDate);
        
        /*
         chapter 15 Objects and Memory
         
         pointing to a new object will loose the reference to current object
         
         */
        NSLog(@"chapter 15----------------------------------\n");

        
        NSDate *currentTime = [NSDate date];
        NSLog(@"current time is %p",currentTime);
        
        NSDate *startTime = currentTime;
        
        sleep(2);
        
        currentTime = [NSDate date];
        NSLog(@"current time is %p",currentTime);
        NSLog(@"current time is %p",startTime);
        
        
        
        /*
         chapter 16 - NSString
         
         no explicit message sent to create a instance
         can contain unicode \u(number)
         stringWithformat - Create Dynamically
         
         - instance method + class method
         
         -(NSUI)length
         
         
         */
        
        NSLog(@"chapter 16----------------------------------\n");

        
        NSString *slogan = @"I \u2261 New York!";
        NSLog(@"%@",slogan);
        
        NSString *dateString = [NSString stringWithFormat:@"The date is %@",now];
        NSLog(@"The date is in String %@",dateString);
        
        NSUInteger charCount = [dateString length];
        NSLog(@"The length in String %lu",(unsigned long)charCount);
        
        NSString *angryText = @"That makes me sad";
        NSString *reallyAngryString = [angryText uppercaseString];
        NSLog(@"Really angry string - %@",reallyAngryString);
        
        NSString *listOfNames =@"godwand";
        NSString *listOfNamesWithCase =@"godWand";
        NSString *name = @"wand";
        
        NSRange match = [listOfNames rangeOfString:name];
        
        if(match.location == NSNotFound){
            NSLog(@"No Match found");
        }else{
            NSLog(@"Match found at %ld",match.location);
        }
        
        // challenge
        BOOL matchCaseInsensitive = [listOfNamesWithCase localizedCaseInsensitiveContainsString:name];
        
        if(matchCaseInsensitive){
            NSLog(@"Match found");
        }else{
            NSLog(@" No Match found");
        }
    }
    return 0;
}
