function fraction(a){
  this.floorV = Math.floor(Math.sqrt(a))
  this.numIrattional = a;
  this.denom = a-Math.pow(this.floorV,2)
  this.numRational = this.floorV-this.denom*Math.ceil(this.floorV/this.denom)
  this.nextStep = function(){
    var a = this.denom*(this.floorV+1)+this.numRational
    this.denom = (this.numIrattional-Math.pow(this.numRational,2))/this.denom
    this.numRational = -this.numRational-this.denom*Math.floor((this.floorV-this.numRational)/this.denom)
    return(a)
  }
}
function isOdd(a){
  var hat = new fraction(a)
  var h = []
  var odd = false;
  while(true){
    var z = hat.nextStep()
    if(h[z]){
      break
    }
    h[z] = true;
    odd = !odd
  }
  return(odd)
}
var k = 0
for(var i = 2; i < 10001;i++){
  if(Math.sqrt(i)!=Math.round(Math.sqrt(i))&&isOdd(i)){
    k++
  }
}
console.log(k)
