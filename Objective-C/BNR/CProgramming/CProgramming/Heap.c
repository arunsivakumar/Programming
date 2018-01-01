//
//  Heap.c
//  CProgramming
//
//  Created by Lakshmi on 11/24/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

typedef struct{

    float heightInMeters;
    int weightInKilos;

} Person;


float bmiPointer(Person *p){
    return p->weightInKilos / (p->heightInMeters * p->heightInMeters);

}

float bmi (Person p){
    return p.weightInKilos / (p.heightInMeters * p.heightInMeters);
}

int main(int argc, const char * argv[]) {
    
    float *memory;
    
    memory = malloc(1000 * sizeof(float));
    
    
    free(memory);
    printf("%p\n",memory);
    
    memory = NULL;
    printf("%p\n",memory);
    
    Person arun;
    arun.heightInMeters = 1.7;
    arun.weightInKilos = 80;
    
    Person *arthi = (Person *)malloc(sizeof(Person));
    printf("%p\n",arthi);
    arthi->heightInMeters = 1.5;
    arthi->weightInKilos = 50;
    
    
    printf("bmi = %.2f \n",bmi(arun));
    printf("bmi = %.2f \n",bmiPointer(arthi));
  
    
    free(arthi);
    printf("%p\n",arthi);
    
    arthi = NULL;
    printf("%p\n",arthi);
    
    int i = 17;
    int *a = &i;
    printf("%d\n",&i);
    printf("%d\n",a);
    
    
}
