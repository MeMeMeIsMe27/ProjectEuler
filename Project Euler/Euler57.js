function GCF(a,b){
  while(a != 0 && b != 0){
    var c;
    if(a > b){
      a %= b
      if(a == 0){
        return(b)
      }
    } else {
      b %= a
      if(b == 0){
        return(a)
      }
    }
  }
}
function fraction(a,b){
  a = BigInt(a)
  b = BigInt(b)
  divideBy = GCF(a,b)
  a/=divideBy
  b/=divideBy
  this.numerator=a
  this.denominator=b
  this.addInt = function(num){
    num = BigInt(num)
    return(new fraction(this.numerator+num*this.denominator,this.denominator))
  }
  this.divideBy = function(num){
    var newNume = num.denominator*this.numerator
    var newDeno = num.numerator*this.denominator
    divideBy = GCF(newNume,newDeno)
    newNume/=divideBy
    newDeno/=divideBy
    return(new fraction(newNume,newDeno))
  }
}
function works(num){
  var total = value[num].addInt(1)
  if(total.numerator.toString().length>total.denominator.toString().length){
    return(true)
  } else {
    return(false)
  }
}
value = [0,new fraction(1,2)]
for (var i = 1; i < 1001; i++){
  value.push(new fraction(1,1).divideBy(value[i].addInt(2)))
}
var total = 0;
for(var i = 1; i<1001;i++){
  if(works(i)){
    total++
    console.log(value[i])
  }
}
console.log(total)
