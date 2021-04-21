def isTriangle(num):
	if(((-1+(1+8*num)**0.5)/2)%1==0):
		return(True)
	else:
		return(False)
def isPentagonal(num):
	if(((1+(1+24*num)**0.5)/6)%1==0):
		return(True)
	else:
		return(False)
for i in range (144,1000000):
	num = i*(2*i-1);
	if(isTriangle(num)):
		if(isPentagonal(num)):
			print(num);
