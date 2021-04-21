var possibleValues = []
function fill(unusedNums,usedNums){
	if(unusedNums.length==1){
		var v = Math.cbrt(usedNums*10+unusedNums[0])
		if(v===Math.floor(v)){
			possibleValues.push(usedNums*10+unusedNums[0])
			return(1)
		}
		return(0)
	}
	var t = 0;
	var canDo = [true,true,true,true,true,true,true,true,true,true]
	if(usedNums.length==0){
		canDo[0]=false
	}
	var z = 0;
	for(var i = 0; i < unusedNums.length; i++){
	var b = unusedNums.splice(0,1)[0]
		if(canDo[b]){
			canDo[b]=false
			t+=fill(unusedNums,usedNums*10+b)
		}
		unusedNums.push(b)
	}
	return(t)
}
var allStuff = {}
var i = 0;
while(true){
	var z = ((Math.pow(i,3))+"").split("");
	z=z.sort();
	k = ""
	for(var i2 = 0; i2< z.length;i2++){
		k+=z[i2]
	}
	if(!allStuff[k]){
		allStuff[k]=1
	} else{
		allStuff[k]++
		if(allStuff[k]==5){
			break;
		}
	}
	i++;
}
var l = ((Math.pow(i,3))+"").split("");
for(var i2 = 0; i2 < l.length;i2++){
	l[i2]=Number(l[i2])
}
fill(l,"")
console.log(possibleValues.sort(function (a,b){return(a-b)})[0])
