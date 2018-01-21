//
//  BNRAsset.m
//  BNRPerson
//
//  Created by Lakshmi on 1/21/18.
//  Copyright © 2018 com.arunsivakumar. All rights reserved.
//

#import "BNRAsset.h"

@implementation BNRAsset


- (NSString *)description
{
    return [NSString stringWithFormat:@"%@: $%u", self.label, self.resaleValue];
}

- (void)dealloc
{
    NSLog(@"deallocating %@", self);
}
@end
