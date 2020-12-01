//
//  BNROwnedAppliance.h
//  Appliance
//
//  Created by Arun Sivakumar on 1/12/20.
//

#import <Foundation/Foundation.h>
#import "BNRAppliance.h"

@interface BNROwnedAppliance : BNRAppliance

@property (readonly) NSSet *ownerNames;

// The designated initializer
- (instancetype)initWithProductName:(NSString *)pn
                     firstOwnerName:(NSString *)n;
- (void)addOwnerName: (NSString *)n;
- (void)removeOwnerName: (NSString *)n;
@end

