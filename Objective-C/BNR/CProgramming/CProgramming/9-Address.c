//
//  Address.c
//  CProgramming
//
//  Created by Lakshmi on 11/24/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

/*
 Format specifier %p - &i
 NULL pointer - checked using if else
 
*/
#include <stdio.h>


int main(int argc, const char * argv[]) {

    int i = 17;
    int *addressofI = &i;
    
    printf("i stores the value at %p\n",addressofI);
    printf("i has value %d\n",*addressofI);
    printf("main starts at at %p\n",&main);
    
    printf("%zu\n", sizeof(int));
    printf("%zu\n", sizeof(int*));

    
    float a = 0.2;
    
    float *measuredGravityPtr = &a;
    
    float actualGravity;
    
    if(measuredGravityPtr){
        actualGravity = *measuredGravityPtr;
    }else{
        actualGravity = 0.0;
    }
    
    actualGravity = measuredGravityPtr ? *measuredGravityPtr : 0.0;
    
    printf("gravity - %f\n",actualGravity);
    return 0;

}
