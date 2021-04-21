#include <stdio.h>
#include <math.h>

int check(int num, int num2){
	int val = 1;
	for(int i = num2+1; i < num+1; i++){
		val=val*i;
		val=val/(i-num2);
		if(val>1000000){
			return(1);
		}
	}
	if(val>1000000){
		return(1);
	} else {
		return(0);
	}
}
int main(void) {
	int vals = 0;
	for(int i = 0; i < 101; i++){
		for(int i2 = 0; i2 < i+1; i2++){
			if(check(i,i2)==1){
				vals++;
			}
		}
	}
	printf("%i\n",vals);
  	return 0;
}