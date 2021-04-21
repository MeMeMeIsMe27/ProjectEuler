var t = 0;
var m = 1
for(var i = 1;i<22;i++){
  for(var i2 = m; i2<10; i2++){
    if(Math.pow(i2,i)>=Math.pow(10,i-1)){
      t++;
    } else{
      m = i2+1
    }
  }
}
console.log(t)
