var primes = [2,3,5,7];
var number = 7;
function calculate(amount){
  for (var i2 = 0; i2 < amount; i2++){
    var prime = true;
    number+=4;
    for(var i = 2; Math.pow(primes[i],2) < number+1; i++){
      if(number%primes[i]==0){
        prime = false;
        break
      }
    }
    if(prime == true){
      primes.push(number);
    }
    number+=2;
    prime = true;
    for(i = 2; Math.pow(primes[i],2) < number+1; i++){
      if(number%primes[i]==0){
        prime = false;
        break
      }
    }
    if(prime == true){
      primes.push(number);
    }
  }
}
calculate(100000)
  function isPrime(num){
  var prime = true;
  for(var i = 0; Math.pow(primes[i],2) < num+1; i++){
    if(num%primes[i]==0){
      prime = false;
      break
    }
  }
  return(prime)
}
var equations = [[4,-2],[4,0],[4,2],[4,4]]
nums = [[0,1]]
function works(num){
  total = nums[num-1][1]
  primesFound = nums[num-1][0]
  for(var i = 0; i < 4; i++){
    if(isPrime(num*num*equations[i][0]+num*equations[i][1]+1)){
      primesFound++;
    }
    total++;
  }
  if(nums.length==num){
    nums.push([primesFound,total])
  }
  if(total/10>primesFound){
    return(true)
  } else{
    return(false)
  }
}
for(var i = 1; !works(i);i++){
}
console.log(i*2+1)
