#include <stdio.h>
#include <math.h>
int len(int num){
	int i = 0;
	while(num>0){
		num=num/10;
		i++;
	}
	return(i);
}
int main(void) {
	int solution = 0;
	for(int i = 1; i<10000000; i++){
		int leni=len(i);
		if(leni==len(i*6)){
		int working = 1;
			int numNums[10]={0,0,0,0,0,0,0,0,0,0};
			for(int i2 = 0; i2 < leni;i2++){
				int x = pow(10,i2+1);
				numNums[(i%x-i%(x/10))*10/x]++;
			}
			for(int i2 = 2; i2<7;i2++){
				int testNum=i*i2;
				int testNumNums[10]={0,0,0,0,0,0,0,0,0,0};
				for(int i3 = 0; i3 < leni;i3++){
					int x = pow(10,i3+1);
					testNumNums[(testNum%x-testNum%(x/10))*10/x]++;
				}
				for(int i3 = 0; i3 < 10; i3++){
					if(numNums[i3]!=testNumNums[i3]){
						working=0;
						break;
					}
				}
				if(working==0){
					break;
				}
			}
			if(working==1){
				printf("%i\n",i);
			}
		}
	}
}