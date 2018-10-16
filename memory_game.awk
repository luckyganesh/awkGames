#! /usr/bin/awk -f
BEGIN{
  print "Hi,welcome to memory game"
  score=0
  operation[1]="+"
  operation[2]="-"
  operation[3]="*"
  operation[4]="/"
  print "are you good at maths yes/no"
};
{
  if($0 == "yes"){
    srand()
    operation_performing=int(rand()*4) + 1
    number1=int(rand()*100 )
    number2=int(rand()*100)+1
    print number1 operation[operation_performing] number2"="
    getline result
    original_result=generateresult(number1,number2,operation[operation_performing]);
    #print original_result
    #print result
    if(result == original_result){
      print "congratulations"
      score+=10
    }else{
      print original_result
      print score
      score=0
      print "you lost"
    }
    print "do you want to continue"
  }else{
    print score
    exit;
  }
}
function generateresult(number1,number2,operation){
  result1=0
  if(operation=="+")
    result1=number1+number2
  if(operation=="-")
    result1=number1-number2
  if(operation=="*")
    result1=number1*number2
  if(operation=="/")
    result1=number1/number2
  return result1
}
