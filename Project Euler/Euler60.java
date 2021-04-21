import java.util.*;
import java.lang.Object;
class Main {
	static int primes[];
	static BitSet isPrimes;
	public static boolean passTest(int a, int b){
		int vals[] = {primes[a],primes[b]};
		for(int i = 0; i < 2; i++){
			int i2;
			for(i2 = 6; vals[i]/Math.pow(10,i2)<0.1&&i2>0; i2--){
			}
			if(!isPrime(vals[1-i]*(int)Math.pow(10,i2)+vals[i])){
				return(false);
			}
		}
		return(true);
	}
	public static boolean isPrime(int numTry){
		for(int i = 0; primes[i]*primes[i]<=numTry; i++){
			if(numTry%primes[i]==0){
				return(false);
			}
		}
		return(true);
	}
	public static void main(String[] args){
		long findPrimesTill = 10000000000L;
		primes = new int[17984];
		primes[0]=2;
		primes[1]=3;
		int x = 2;
		for(int i = 4; i <= (int)Math.sqrt(findPrimesTill)+100000; i++){
			if(isPrime(i)){
				primes[x]=i;
				x++;
			}
		}
		System.out.println(primes[x-1]);
		System.out.println(x);
		int maxVal = (int)Math.sqrt(findPrimesTill)*5;
		for(int i = 0; i < x && primes[i]+17<maxVal; i++){
			for(int i2 = 0; i2 < i && primes[i]+primes[i2]+10<maxVal; i2++){
				if(passTest(i,i2)){
					for(int i3 = 0; i3 < i2 && primes[i]+primes[i2]+primes[i3]+5 < maxVal; i3++){
						if(passTest(i,i3)&&passTest(i2,i3)){
							for(int i4 = 0; i4 < i3 && primes[i]+primes[i2]+primes[i3]+primes[i4]+2 < maxVal; i4++){
								if(passTest(i,i4)&&passTest(i2,i4)&&passTest(i3,i4)){
									for(int i5 = 0; i5 < i4 && primes[i]+primes[i2]+primes[i3]+primes[i4]+primes[i5] < maxVal; i5++){
										if(passTest(i,i5)&&passTest(i2,i5)&&passTest(i3,i5)&&passTest(i4,i5)){
											maxVal=primes[i]+primes[i2]+primes[i3]+primes[i4]+primes[i5];
										}
									}
								}
							}
						}
					}
				}
			}
		}
		System.out.println(maxVal);
	}
}
