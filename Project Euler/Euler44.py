def isPentagonal(num):
	if(((1+(1+24*num)**0.5)/6)%1==0):
		return(True)
	else:
		return(False)
pNums = [];
for i in range (1,10000):
	pNums.append(i*(3*i-1)/2)
print("hi")
bestDif=10000000000
bestTwoNums=[0,0]
for i in range (len(pNums)):
	for i2 in range (round((1+(1+24*i)**0.5)/6),i):
		if(isPentagonal(pNums[i]+pNums[i2])):
			if(isPentagonal(pNums[i]-pNums[i2])):
				print([pNums[i],pNums[i2]])
				if(isPentagonal(pNums[i]-pNums[i2])<bestDif):
					bestDif=pNums[i]-pNums[i2]
					bestTwoNums=[pNums[i],pNums[i2]]
print(bestTwoNums)
print(bestDif)