primes = [2];
for i in range (3,30000):
	i2 = 0
	working = True
	while(primes[i2]*primes[i2]<=i):
		if(i%primes[i2]==0):
			working = False
			break
		i2+=1
	if working==True:
		primes.append(i)
# print(primes)
posibilities=[];
i = 9
i2=4
while(i<6000):
	if(primes[i2]<i):
		i2+=1;
	if(primes[i2]!=i):
		posibilities.append(i)
	i+=2
for i in range (len(posibilities)):
	works = True;
	i2 = 1
	while(2+primes[i2]<=posibilities[i]):
		if(works==False):
			break;
		i3=0
		while(2*(i3**2)+primes[i2]<posibilities[i]):
			i3+=1;
			if(2*(i3**2)+primes[i2]==posibilities[i]):
				works=False;
				break;
		i2+=1;
	if(works==True):
		print(posibilities[i])
		break;