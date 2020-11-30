//
//  BNREmployee.h
//  BMITime
//
//  Created by Arun Sivakumar on 30/11/20.
//

#import "BNRPerson.h"


@interface BNREmployee : BNRPerson

@property(nonatomic) unsigned int employeeID;
@property(nonatomic) unsigned int officeAlarmCode;
@property(nonatomic) NSDate *hireDate;
@property(nonatomic) NSString *lastName;
@property(nonatomic) BNRPerson *spouce;
@property(nonatomic) NSMutableArray *children;
-(double)yearsOfEmployment;

@end

