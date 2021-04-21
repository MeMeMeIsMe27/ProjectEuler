#include <stdio.h>
#include <math.h>
static int listVals[6];

int P(int x, int n){
  return(n*((x+1)*n-(x-1))/2);
}

double inP(double x, double z){
  return(((x-1)/2+sqrt((x-1)*(x-1)/4+2*z*(x+1)))/(x+1));
}

int isP(int x, int z){
  double v = inP(x,z);
  if(floor(v)==v){
    return(1);
  }
  return(0);
}

int workingValsIn(int cS, int tUsed[6]){
  if(cS==6){
    int v = 0;
    for(int i = 0; i < 5; i++){
      if(tUsed[i]){
        v = i+1;
        break;
      }
    }
    if(isP(v,listVals[5]*100+listVals[0])){
      return(1);
    }
    return(0);
  }
  for(int i = 0; i < 5; i++){
    if(tUsed[i]){
      tUsed[i]=0;
      int u = ceil(inP(i+1,listVals[cS-1]*100+100));
      int l = ceil(inP(i+1,listVals[cS-1]*100+10));
      for(int i2 = l; i2 < u; i2++){
        int v = P(i+1,i2);
            listVals[cS] = v%100;
            if(workingValsIn(cS+1,tUsed)){
              return(1);
            }
      }
      tUsed[i]=1;
    }
  }
  return(0);
}

int workingValsInFirst(){
  int e = ceil(inP(0,10000));
  for(int i = ceil(inP(0,1000)); i < e; i++){
    int v = P(0,i);
    if(v%100>9){
        listVals[1] = v%100;
        listVals[0] = (v-listVals[1])/100;
        int tUsed[6] = {1,1,1,1,1};
        if(workingValsIn(2,tUsed)){
          return(1);
        }
      }
  }
  return(0);
}

int main(void) {
  workingValsInFirst();
  int t = 0;
  for(int i = 0; i < 5; i++){
    printf("%d%d,",listVals[i],listVals[i+1]);
    t+=listVals[i]*100+listVals[i+1];
  }
  printf("%d%d\n",listVals[5],listVals[0]);
  t+=listVals[5]*100+listVals[0];
  printf("%d\n",t);
  return(0);
}
