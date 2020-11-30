//
//  main.m
//  StringZ
//
//  Created by Arun Sivakumar on 30/11/20.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Writing String
        NSMutableString *str = [[NSMutableString alloc]init];
        for(int i = 0; i < 10; i++) {
            [str appendString:@"Aaron is cool!\n"];
        }
        
        NSError *error;
        BOOL success = [str writeToFile:@"/tmp/cool.txt"
              atomically:YES
                encoding:NSUTF8StringEncoding
                   error:&error];
        NSLog(@"done writing /tmp/cool.txt");
        
        if (success) {
            NSLog(@"done writing");
        } else {
            NSLog(@"%@", [error localizedDescription]);
        }
        
        // Reading String
        NSString *readStr = [[NSString alloc] initWithContentsOfFile:@"/etc/resolv.conf" encoding:NSASCIIStringEncoding error:&error];
        
        if(!str) {
            NSLog(@"read failed: %@", [error localizedDescription]);
        } else {
            NSLog(@"resolc.conf looks like this %@" , readStr);
        }
        
        
        // Writing Data
        
        NSURL *url = [NSURL URLWithString:@"http://www.google.com/images/logos/ps_logo2.png"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        NSData *data = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:NULL error: &error];
        
        if (!data) {
            NSLog(@"fetch failed: %@", [error localizedDescription]);
            return 1;
        }
        
        NSLog(@"the file is %lu bytes", (unsigned long) [data length]);
        
        BOOL written = [data writeToFile: @"/tmp/google.png"
                                 options: NSDataWritingAtomic
                                   error: &error];
        
        if (!written) {
            NSLog(@"write failed: %@", [error localizedDescription]);
            return 1;
        }
        
        NSLog(@"Success!");
        
        
        // Reading data
        
        NSData *readData = [NSData dataWithContentsOfFile:@"/tmp/google.png"];
        NSLog(@"the file read from the disk has %lu bytes", (unsigned long)[readData length]);
    }
    return 0;
}
