//
//  BNRAsset.h
//  BMITime
//
//  Created by Arun Sivakumar on 30/11/20.
//

#import <Foundation/Foundation.h>
#import "BNREmployee.h"

@interface BNRAsset : NSObject

@property (nonatomic, copy) NSString *label;
@property (nonatomic, weak) BNREmployee *holder;
@property (nonatomic) unsigned int resaleValue;
@end

