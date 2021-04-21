def isPandigital(val):
	val = str(val)
	for i in range(1,len(val)+1):
		if((str(i) in val)==False):
			return False
	return True
primes = [2,3];
i=1
PandigitalPrime=0
while (PandigitalPrime<10000000):
	i+=4
	i2 = 0
	working = True
	while(primes[i2]*primes[i2]<=i):
		if(i%primes[i2]==0):
			working = False
			break
		i2+=1
	if working==True:
		primes.append(i)
		if(isPandigital(i)):
			PandigitalPrime=i	
	i+=2
	i2 = 0
	working = True
	while(primes[i2]*primes[i2]<=i):
		if(i%primes[i2]==0):
			working = False
			break
		i2+=1
	if working==True:
		primes.append(i)
		if(isPandigital(i)):
			PandigitalPrime=i
print(PandigitalPrime)