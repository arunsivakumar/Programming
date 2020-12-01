//
//  BNRLogger.m
//  Callbacks
//
//  Created by Arun Sivakumar on 30/11/20.
//

#import "BNRLogger.h"

@interface BNRLogger()
@end

@implementation BNRLogger

-(void) zoneChange:(NSNotification *)note {
    NSLog(@"The has changed!");
}
- (NSString *)lastTimeString {
    static NSDateFormatter *dateFormatter = nil;
    
    if(!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        NSLog(@"create formatter");
    }
    return [dateFormatter stringFromDate:self.lastTime];
}


- (void)updateLastTime:(NSTimer *)t {
    NSDate *now = [NSDate date];
    [self willChangeValueForKey:@"lastTime"];
    _lastTime = now;
    [self didChangeValueForKey:@"lastTime"];
//    [self setLastTime:now];
    NSLog(@"Just set time to %@", self.lastTimeString);
}

+ (NSSet<NSString *> *)keyPathsForValuesAffectingLastTimeString
{
    return [NSSet setWithObject:@"lastTime"];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSLog(@"received %lu bytes", [data length]);
    
    if (!_incomingData) {
        _incomingData = [[NSMutableData alloc] init];
    }
    [_incomingData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"Got it all");
    NSString *string = [[NSString alloc]initWithData:_incomingData encoding:NSUTF8StringEncoding];
    _incomingData = nil;
    NSLog(@"the whole sting is %@", string);
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"connection failed %@", [error localizedDescription]);
    _incomingData = nil;
}
@end
