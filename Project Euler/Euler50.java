class Main {
	public int[] primes;
	public static boolean isPrime(int num,int[] primes){
		boolean isPrime = true;
		for(int i = 0; Math.pow(primes[i],2)<=num;i++){
			if(num%primes[i]==0){
				isPrime=false;
				break; 
		  	}
		}
		return(isPrime);
	}
  	public static void main(String[] args) {
    	int[] primes = new int[100000];
	  	primes[0]=2;
	  	primes[1]=3;
	  	int a=2;
	  	for(int i = 4; a<100000;i++){
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
		for(int length = 546; length > 500; length--){
			for(int i = 0; primes[i+length]<1000000; i++){
				int total = 0;
				for(int i2 = 0; i2 < length; i2++){
					total+=primes[i+i2];
				}
				if(total<1000000 && isPrime(total,primes)){
					System.out.println(total);
				}
			}
		}
  	}
}