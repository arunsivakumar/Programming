//
//  BNRAppliance.h
//  Appliance
//
//  Created by Arun Sivakumar on 1/12/20.
//

#import <Foundation/Foundation.h>

@interface BNRAppliance : NSObject

@property (nonatomic) int voltage;

// The designated initializer
-(instancetype)initWithProductName:(NSString *)pn;
@end

