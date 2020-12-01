//
//  BNRLogger.h
//  Callbacks
//
//  Created by Arun Sivakumar on 30/11/20.
//

#import <Foundation/Foundation.h>


@interface BNRLogger : NSObject <NSURLConnectionDelegate, NSURLConnectionDataDelegate>
{
    NSMutableData *_incomingData;
}
@property (nonatomic) NSDate *lastTime;
- (NSString *)lastTimeString;
- (void)updateLastTime:(NSTimer *)t;
-(void) zoneChange:(NSNotification *)note;

@end

