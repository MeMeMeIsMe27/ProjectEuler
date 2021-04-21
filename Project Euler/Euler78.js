function pos (m,v){
  if(m>v){
    return(0)
  }
  if(m*2>v){
    return(1)
  }
  return((pos(m, (v-m)) + pos((m+1), v))%1000000)
}
var genTo = 10000
var indexs = [];
var vals = []
var storeTo = Math.floor(genTo/3+1)
console.log(storeTo*(storeTo+1)/2)
var arrs = new Array(storeTo*(storeTo+1)/2).fill(0)



function getVal(x){
  return(x*(x-1)/2)
}
for(var i = 1; i < genTo; i++){
  let total = 0;
  if(i<storeTo){
    indexs[i]=0
    let setPoint = getVal(i)
    arrs[setPoint] = 1
  }
  for(var i2 = i; i2>0; i2--){
    if(i2>storeTo){
      i2=storeTo
      // console.log(i+','+i2)
      if(i2*2>i){
        total = 1
      } else {
        total = Math.floor((i-2*i2)/2)+2
      }
      i2--
    }
    setPoint = getVal(i2)+indexs[i2]
    total += arrs[setPoint]%1000000
    arrs[setPoint]=total
    indexs[i2]++
    indexs[i2]%=i2
  }
  if(total<1000){
    console.log(i+": "+total)
  }
  vals.push(total)
}