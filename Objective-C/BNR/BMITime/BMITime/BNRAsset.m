//
//  BNRAsset.m
//  BMITime
//
//  Created by Arun Sivakumar on 30/11/20.
//

#import "BNRAsset.h"

@implementation BNRAsset

-(NSString *)description {
    return [NSString stringWithFormat:@"<%@ : $%u>", self.label, self.resaleValue];
}

-(void)dealloc {
    NSLog(@"deallocating %@", self);
}
@end
