#include<stdio.h>
#include<stdlib.h>
#include<curses.h>
#define INF 99
#define N 16
int final[N];
int selected[N]={0};
int queue[N];
int distance [N][N]={ 
	0,3,99,99,4,5,99,99,99,99,99,99,99,99,99,99,
	3,0,3,99,99,4,5,99,99,99,99,99,99,99,99,99,
  	  99,3,0,3,99,99,4,5,99,99,99,99,99,99,99,99,
	99,99,3,0,99,99,99,4,99,99,99,99,99,99,99,99,
	4,99,99,99,0,3,99,99,4,5,99,99,99,99,99,99,
   	 5,4,99,99,3,0,3,99,99,4,5,99,99,99,99,99,
	99,5,4,99,99,3,0,3,99,99,4,5,99,99,99,99,
	99,99,5,4,99,99,3,0,99,99,99,4,99,99,99,99,
    	99,99,99,99,4,99,99,99,0,3,99,99,4,5,99,99,
	99,99,99,99,5,4,99,99,3,0,3,99,99,4,5,99,
	99,99,99,99,99,5,4,99,99,3,0,3,99,99,4,5,
   	 99,99,99,99,99,99,5,4,99,99,3,0,99,99,99,4,
	99,99,99,99,99,99,99,99,4,99,99,99,0,3,99,99,
	99,99,99,99,99,99,99,99,5,4,99,99,3,0,3,99,
	99,99,99,99,99,99,99,99,99,5,4,99,99,3,0,3,
	99,99,99,99,99,99,99,99,99,99,5,4,99,99,3,0,};
void findShortDiagonal(int,int);
void findShortEast(int,int);
int main(){
	int i,j;
	int source;
	int target;
	char go;
	char direction;	
 while(1){
	 fflush(stdin);
	system("clear");
	printf("-------------------------Welcome to FAST GPS-------------------------------");
	printf("\nDistance Table\n");
	printf("\t");
	for(i=0;i<N;i++)
		printf(" %d|",i);
	
	printf("\n");
	for(i=0;i<N;i++){
		printf(" %d\t",i);
		for(j=0;j< N;j++){	
			printf(" %d,",distance[i][j]);
		}
		printf("\n");
    }
		printf("\nEnter The Source:");
		scanf(" %d", &source);
		printf("\nEnter The Destination:");
		scanf(" %d", &target);
		printf("\nEnter The Direction to proceed..\nEast    :E\nNorth-  
                       East:D\n\nOPTION?");
		scanf(" %c", &direction);
		if(direction=='E'){
			findShortEast(source,target);
		}else{
			findShortDiagonal(source,target);
		}
		printf("continue?y/n:");
		 scanf(" %c",&go);
		if(go=='n')
			break;
	}
	return 0;
}
void findShortDiagonal(int source,int target){
	int temp=INF;
	int i,value,result;
	for(i=0;i<N;i++)
		queue[i]=INF;
	    final[i]=0;
      while(selected[target]!=1){
	     for(i=0;i<N;i++){
			if(i==source+4||i==source+5||i==source+1){
				 result=final[source]+distance[source][i];
				 if(queue[i]>result){
				 queue[i]=result;
				 }
				if(queue[i]<temp&&queue[i]!=0){
					temp=queue[i];
					value=i;
						
				}
			}
		 }
			  source=value;
			  final[source]=temp;
			  selected[source]=1;
			  queue[source]=0;
			  temp=INF;
	  }
		printf("LOCATION|");
		for(i=0;i< N;i++)
			printf(" %d",i);
		printf("\n--------------------------------------------------------\n");
		printf("DISTANCE|");
		for(i=0;i< N;i++)
			printf(" %d",final[i]);
		printf("\n");
}
void findShortEast(int source,int target){
	int temp=INF;
	int i,value,result;
	
	for(i=0;i<N;i++)
		queue[i]=INF;
	    final[i]=0;
	while(selected[target]!=1){
		for(i=0;i<N;i++){
			if(i<=target){
				result=final[source]+distance[source][i];
				if(queue[i]>result){
					queue[i]=result;	
				}
				if(queue[i]<temp&&queue[i]!=0){
					temp=queue[i];
					value=i;
				}
			}
		}
		source=value;
		final[source]=temp;
		selected[source]=1;
		queue[source]=0;
		temp=INF;
		
	}
		printf("VIA     |");
		for(i=0;i< N;i++)
	      printf(" %d",i);
		printf("\n--------------------------------------------------------\n");
		printf("DISTANCE|");
		for(i=0;i< N;i++)
			printf(" %d",final[i]);
		printf("\n");
}
