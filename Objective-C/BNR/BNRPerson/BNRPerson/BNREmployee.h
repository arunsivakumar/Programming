//
//  BNREmployee.h
//  BNRPerson
//
//  Created by Lakshmi on 1/21/18.
//  Copyright © 2018 com.arunsivakumar. All rights reserved.
//

#import "BNRPerson.h"

@interface BNREmployee : BNRPerson

@property (nonatomic) unsigned int employeeID;
@property (nonatomic) unsigned int officeAlarmCode;
@property (nonatomic) NSDate *hireDate;

-(double)yearsOFEmployment;

@end
