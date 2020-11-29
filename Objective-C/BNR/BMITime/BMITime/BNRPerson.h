//
//  BNRPerson.h
//  BMITime
//
//  Created by Arun Sivakumar on 29/11/20.
//

#import <Foundation/Foundation.h>

@interface BNRPerson : NSObject

@property(nonatomic) float heightInMeters;
@property(nonatomic) int weightInKilos;
//{
//    float _heightInMeters;
//    int _weightInKilos;
//}
//
//-(float)heightInMeters;
//-(void)setHeightInMeters:(float)h;
//-(int)weightInKilos;
//-(void)setWeightInKilos:(int)w;

-(float)bodyMassIndex;

@end

