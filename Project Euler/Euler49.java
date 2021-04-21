class Main {
	public static boolean isPrime(int num,int[] primes){
		boolean isPrime = true;
	  	for(int i2 = 0; Math.pow(primes[i2],2)<=num;i2++){
			if(num%primes[i2]==0){
				isPrime=false;
				break; 
	  		}
		}
		return(isPrime);
	}
	public static void main(String[] args) {
		int[] primes = new int[10000];
	  	primes[0]=2;
	  	primes[1]=3;
	  	int a=2;
	  	for(int i = 4; a<10000;i++){
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
		for(int i = 1000; i < 10000; i++){
			for(int i2 = 1; i2 < 10000; i2++){
				boolean works=true;
				if(isPrime(i,primes)==false){
					works=false;
					break;
				}
				int[] vals = new int[10];
				for(int i3 = 0; i3 < 10; i3++){
					vals[i3]=0;
				}
				for(int i3 = 0; i3 < 4; i3++){
					vals[Character.getNumericValue(String.valueOf(i).charAt(i3))]++;
				}
				for(int i3 = 1; i3<3;i3++){
					int num = i+(i2*i3);
					if(isPrime(num,primes)==false){
						works=false;
						break;
					}
					int[] newVals = new int[10];
					for(int i4 = 0; i4 < 10; i4++){
						newVals[i4]=0;
					}
					for(int i4 = 0; i4 < 4; i4++){
						newVals[Character.getNumericValue(String.valueOf(num).charAt(i4))]++;
					}
					for(int i4 = 0; i4 < 10; i4++){
						if(newVals[i4]!=vals[i4]){
							works=false;
							break;
						}
					}
					if(works==false){
						break;
					}
				}
				if(works){
					System.out.println(String.valueOf(i)+","+String.valueOf(i2));
				}
			}
		}
	}
}
