import math
numbersToCheck=[]
for i in range(1,10):
	numbersToCheck.append(i)
for i in range(1,10):
	b = str(i)
	numbersToCheck.append(int(b+b))	
for i in range(10,100):
	b = str(i)
	numbersToCheck.append(int(b[0]+b[1]+b[0]))
for i in range(10,100):
	b = str(i)
	numbersToCheck.append(int(b[0]+b[1]+b[1]+b[0]))
for i in range(100,1000):
	b = str(i)
	numbersToCheck.append(int(b[0]+b[1]+b[2]+b[1]+b[0]))
for i in range(100,1000):
	b = str(i)
	numbersToCheck.append(int(b[0]+b[1]+b[2]+b[2]+b[1]+b[0]))
workingNumbers = []
for i2 in range(len(numbersToCheck)):
	num = (str(bin(numbersToCheck[i2]))).split("0b")[1]
	works=True
	for i in range(math.floor(len(num)/2)):
		if(num[i]!=num[len(num)-1-i]):
			works=False
	if works==True:
		workingNumbers.append(numbersToCheck[i2])
print(workingNumbers)
total = 0
for i in range(len(workingNumbers)):
	total +=workingNumbers[i]
print(total)