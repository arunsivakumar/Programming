//
//  BNRPerson.h
//  BNRPerson
//
//  Created by Lakshmi on 11/30/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRPerson : NSObject
{
  float _heightInMeters;
  int _weightInKilos;
    
}

- (float)heightInMeters;
- (void)setHeightInMeters:(float)h;
- (int)weightInKilos;
- (void)setWeightInKilos:(int)w;


- (float)bodyMassIndex;

@end
