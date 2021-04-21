def numOfAnswers(num):
	total=0
	for num1 in range (1,int(num/2+1)):
		for num2 in range (1,num1+1):
			if(num1+num2+(num1**2+num2**2)**0.5==num):
				total+=1
	return(total)

maxValue = 0
answer = 0
for i in range (1,1000):
	print(i)
	a=numOfAnswers(i)
	if(numOfAnswers(i)>maxValue):
		maxValue=a
		answer=i
print(answer)