def countLength(num):
	onesPlace = [0,3,3,5,4,4,3,5,5,4]
	teens =     [3,6,6,8,8,7,7,9,8,8]
	tensPlace = [0,0,6,6,5,5,5,7,6,6]
	total = 0;
	if (num == 1000):
		return(11)
	if (num>99):
		total+=7
		total+=onesPlace[(num-num%100)//100]
		num=num%100
		if(num>0):
			total+=3
	if(num<10):
		total+=onesPlace[num];
	elif(num<20):
		total+=teens[num-10];
	else:
		total+=tensPlace[(num-num%10)//10]
		num=num%10
		total+=onesPlace[num]
	return(total)
total = 0
for i in range(1,1001):
	total+=countLength(i)
print(total)