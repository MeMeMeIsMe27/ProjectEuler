import java.math.BigInteger; 
class Main {
  public static void main(String[] args) {
	  BigInteger val = new BigInteger("10000000000");
	  System.out.println(val);
	  BigInteger total = new BigInteger("0");
	  for(int i = 1; i < 1000;i++){
		  BigInteger newNum = new BigInteger("1");
		  for(int i2 = 0;i2<i;i2++){
			  newNum=newNum.multiply(BigInteger.valueOf(i));
			  newNum=newNum.mod(val);
		  }
		  total = total.add(newNum);
		  total = total.mod(val);
	  }
	  System.out.println(total);
  }
}