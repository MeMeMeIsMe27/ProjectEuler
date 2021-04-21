def findAllPandigital(digits):
	if(len(digits)==1):
		return(digits)
	else:
		values = [];
		for i in range(len(digits)):
			remainingDigits=digits.copy()
			x=remainingDigits.pop(i)
			newValues=findAllPandigital(remainingDigits)
			for i2 in range(len(newValues)):
				newValues[i2]=(x+newValues[i2])
			values = values+newValues
		return(values)
possibilites=findAllPandigital(["0","1","2","3","4","5","6","7","8","9"])
primes = [1,2,3,5,7,11,13,17]
solutions = []
for i in range(len(possibilites)):
	a=possibilites[i]
	works = True
	for i in range(1,8):
		if(int(a[i]+a[i+1]+a[i+2])%primes[i]!=0):
			works = False
	if(works==True):
		solutions.append(a)
total = 0
for i in range(len(solutions)):
	total+=int(solutions[i])
print(total)