import java.util.Arrays; 
import java.util.List;
import java.lang.Math;
class Main {
	private static int[] primes;
  	public static boolean isPrime(int num){
		boolean isPrime = true;
		for(int i = 0; Math.pow(primes[i],2)<=num;i++){
			if(num%primes[i]==0){
				isPrime=false;
				break; 
		  	}
		}
		return(isPrime);
	}
	public static boolean works(char[] num){
		int workingVals = 0;
		int i = 0;
		if(num[0]=='%'){
			i++;
		}
		for(; i < 10; i++){
			char[] test = num.clone();
			for(int i2 = 0; i2 < test.length; i2++){
				if(test[i2]=='%'){
					test[i2]=Character.forDigit(i,10);
				}
			}
			String str = "";
			for(int i2 = 0; i2 < test.length; i2++){
				str += Character.toString(test[i2]);
			}
			if(isPrime(Integer.parseInt(str))){
				workingVals++;
			}
		}
		if(workingVals>7){
			return(true);
		} else {
			return(false);
		}
	}
  public static void main(String[] args) {
     	primes = new int[100000];
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
		int minNum = 2147483647;
		for(int z = 0; z < 3; z++){
			char valCheck=Character.forDigit(z, 10);
			for(int i = 0; i < 100000; i++){
				char[] currentPrime = String.valueOf(primes[i]).toCharArray();
				int numOfZeros = 0;
				int[] zeroSpots=new int[currentPrime.length];
				for(int i2 = 0; i2 < currentPrime.length;i2++){
					if(currentPrime[i2]==valCheck){
						zeroSpots[numOfZeros]=i2;
						numOfZeros++;
					}
				}
				for(int i2 = 1; i2 < Math.pow(2,numOfZeros); i2++){
					char[] whatToDo = new char[numOfZeros];
					char[] whatToDoA = String.valueOf	(Integer.toBinaryString(i2)).toCharArray();
					int x = numOfZeros-whatToDoA.length;
					for(int i3 = 0; i3 < x; i3++){
						whatToDo[i3]='0';
					}
					for(int i3 = 0; i3 < whatToDoA.length; i3++){
						whatToDo[i3+x]=whatToDoA[i3];
					}
					char[] test = currentPrime.clone();
					for(int i3 = 0; i3 < numOfZeros; i3++){
						if(whatToDo[i3]=='1'){
							test[zeroSpots[i3]]='%';
						}
					}
					if(works(test)){
						minNum=Math.min(minNum,primes[i]);
					}
				}
			}
		}
		System.out.println(minNum);
  	}
}