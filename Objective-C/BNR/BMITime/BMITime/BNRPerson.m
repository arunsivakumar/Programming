//
//  BNRPerson.m
//  BMITime
//
//  Created by Arun Sivakumar on 29/11/20.
//

#import "BNRPerson.h"

@implementation BNRPerson
//
//-(float)heightInMeters {
//    return _heightInMeters;
//}
//
//-(void)setHeightInMeters:(float)h {
//    _heightInMeters = h;
//}
//
//-(int)weightInKilos {
//    return  _weightInKilos;
//}
//
//-(void)setWeightInKilos:(int)w {
//    _weightInKilos = w;
//}

-(float)bodyMassIndex {
    float h = _heightInMeters;
    return _weightInKilos / ( h * h);
}

@end
