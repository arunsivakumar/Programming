//
//  BNREmployee.h
//  BMITime
//
//  Created by Arun Sivakumar on 30/11/20.
//

#import "BNRPerson.h"
@class BNRAsset;

@interface BNREmployee : BNRPerson

@property(nonatomic) unsigned int employeeID;
@property(nonatomic) NSDate *hireDate;
@property(nonatomic) NSString *lastName;
@property(nonatomic) BNRPerson *spouce;
@property(nonatomic) NSMutableArray *children;
@property(nonatomic, copy) NSArray *assets;

-(void)addAsset: (BNRAsset *)a;
-(unsigned int)valueOfAssets;

-(double)yearsOfEmployment;

@end

