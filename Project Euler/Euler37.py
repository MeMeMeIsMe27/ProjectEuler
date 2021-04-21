primes = [2];
for i in range (3,1000000):
	i2 = 0
	working = True
	while(primes[i2]*primes[i2]<=i):
		if(i%primes[i2]==0):
			working = False
			break
		i2+=1
	if working==True:
		primes.append(i)
print(primes)
workingNums=[]
def isPrime(num):
	if(num==1):
		return False
	i2 = 0
	working = True
	while(primes[i2]*primes[i2]<=num):
		if(num%primes[i2]==0):
			working = False
			break
		i2+=1
	if working==True:
		return True
	else:
		return False
answers=[]
for i in range (4,len(primes)):
	a = str(primes[i])
	b=[]
	works = True
	for i2 in range(1,len(a)):
		placeHold=""
		for i3 in range(i2,len(a)):
			placeHold=placeHold+a[i3]
		if (isPrime(int(placeHold))==False):
			works=False
	for i2 in range(1,len(a)):
		placeHold=""
		for i3 in range(len(a)-i2):
			placeHold=placeHold+a[i3]
		if (isPrime(int(placeHold))==False):
			works=False
	if(works==True):
		answers.append(primes[i])
print(answers)
total=0
for i in range(len(answers)):
	total+=answers[i]
print(total)
print(len(answers))