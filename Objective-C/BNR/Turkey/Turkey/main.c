//
//  main.c
//  Turkey
//
//  Created by Arun Sivakumar on 26/1/20.
//  Copyright © 2020 Arun Sivakumar. All rights reserved.
//

#include <stdio.h>
#include <objc/objc.h>

int main(int argc, const char * argv[]) {
    float weight = 14.2;
    printf("The Turkey weighs %f.\n", weight);
    
    float cookingTime = (15.0 + 15.0) * weight;
    printf("The cooking time in minutes %f.\n", cookingTime);
    
    
    float a = 3.14;
    float b = 42.0;
    
    double c = a + b;
    printf("value is %f \n", c);
    
    int value = -1;
    BOOL isNotLegal = NO;
    
    if (isNotLegal) {
        printf("true\n");
    }else {
        printf("false\n");
    }
    
    int i = 20;
    int j = 25;
    int k = ( i > j ) ? 10 : 5;
    if ( 5 < j - k ) {
        printf("The first expression is true.");
    } else if ( j > i ) {
        printf("The second expression is true.");
    } else {
    printf("Neither expression is true."); }
    
    
    return 0;
}
