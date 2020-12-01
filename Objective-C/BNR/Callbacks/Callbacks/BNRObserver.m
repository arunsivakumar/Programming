//
//  BNRObserver.m
//  Callbacks
//
//  Created by Arun Sivakumar on 1/12/20.
//

#import "BNRObserver.h"

@implementation BNRObserver
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    NSString *oldValue = [change objectForKey:NSKeyValueChangeOldKey];
    NSString *newValue = [change objectForKey:NSKeyValueChangeNewKey];
    
    NSLog(@"Observed: %@ of %@ wad changed from %@ to %@", keyPath, object, oldValue, newValue);
    
}
@end
