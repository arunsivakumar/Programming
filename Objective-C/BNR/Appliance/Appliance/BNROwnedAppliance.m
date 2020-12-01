//
//  BNROwnedAppliance.m
//  Appliance
//
//  Created by Arun Sivakumar on 1/12/20.
//

#import "BNROwnedAppliance.h"

@interface BNROwnedAppliance()
{
    NSMutableSet *_ownerNames;
}

@end


@implementation BNROwnedAppliance

- (instancetype)initWithProductName:(NSString *)pn {
    return [self initWithProductName:pn firstOwnerName:nil];
}

- (instancetype)initWithProductName:(NSString *)pn
                     firstOwnerName:(NSString *)n {
    
    self = [super initWithProductName:pn];
    
    if (self) {
        _ownerNames = [[NSMutableSet alloc]init];
        if (n) {
            [_ownerNames addObject:n];
        }
    }
    
    return self;
}

- (void)addOwnerName: (NSString *)n {
    [_ownerNames addObject:n];
}

- (void)removeOwnerName: (NSString *)n {
    [_ownerNames removeObject:n];
}

-(NSSet *)ownerNames {
    return [_ownerNames copy];
}

@end
