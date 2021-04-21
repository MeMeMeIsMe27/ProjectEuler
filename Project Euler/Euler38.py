	if(len(val)!=9):
		return False
	for i in range(1,10):
		if((str(i) in val)==False):
			return False
	return True

maxNum=0
for num in range (1,100000):
	total = str(num)
	for i in range(2,10):
		total = total+str(num*i)
		if(isPandigital(total)):
				maxNum=max(maxNum,int(total))
print(maxNum)def isPandigital(val):
