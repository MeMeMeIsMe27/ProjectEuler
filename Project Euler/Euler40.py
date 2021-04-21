currentPlace=-1
answer = 1
nextValue=1
for number in range(190000):
	val=str(number)
	currentPlace+=len(val)
	if(currentPlace>=nextValue):
		answer*=int(val[len(val)-1+nextValue-currentPlace])
		nextValue*=10
print(answer)