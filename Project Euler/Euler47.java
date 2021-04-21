class Main {
  public static void main(String[] args) {
	  	int[] primes = new int[1000000];
	  	primes[0]=2;
	  	primes[1]=3;
	  	int a=2;
	  	for(int i = 4; a<1000000;i++){
		  boolean isPrime = true;
		  for(int i2 = 0; Math.pow(primes[i2],2)<=i;i2++){
				  if(i%primes[i2]==0){
					 isPrime=false;
					 break; 
		  		}
			}
			if(isPrime){
				primes[a]=i;
				a++;
			}
		}
		// for(int i = 0; i < a;i++){
		// 	System.out.println(primes[i]);
		// }
		int amountInARow=0;
		int difFactors=0;
		for(int i = 120;amountInARow!=4;i++){
			difFactors=0;
			int num=i;
			for(int i2 = 0; num!=1;i2++){
				if(num%primes[i2]==0){
					difFactors++;
					num=num/primes[i2];
				}
				while(num%primes[i2]==0){
					num=num/primes[i2];
				}
				if(num<primes[i2]){
					// System.out.println(num);
				}
			}
			if(difFactors>3){
				amountInARow++;
			} else {
				amountInARow=0;
			}
			if(amountInARow==4){
				System.out.println(i-3);
			}
		}
  }
}