#! /usr/bin/awk -f
BEGIN{
  print "give me expression"
  i=1
}
{
  expression=$0
  split(expression,numbers,/\+|\-|\*|\//)
  split(expression,a,"")
  for(j=1;j<=length(a);j++){
    if(a[j] ~ /\+|\-|\*|\//){
      operand[i]=a[j]
      i++
    }
  }
  delete a
  f=0
  for(i=1;i<=length(operand)-f;i++){
    if (operand[i] ~ /\*|\//){
      if(operand[i] ~ /\//)
        numbers[i]/=numbers[i+1]
      else
        numbers[i]*=numbers[i+1]
      for(k=i+1;k<=length(operand);k++){
        operand[k-1]=operand[k]
        numbers[k]=numbers[k+1]
      }
      f++
      i--
    }
  }
  l=length(operand)-f
  for(j=1;j<=l;j++){
    if (operand[j] ~/\+/)
      numbers[1]+=numbers[j+1]
    else
      numbers[1]-=numbers[j+1]
  }
  print numbers[1]
  exit
}
