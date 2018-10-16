#! /usr/bin/awk -f
BEGIN{
  srand()
  print "Hi welcome to luck game"
  print "Are you good at guessing"
}
{
  if ($0 == "yes"){
    print "ok guess a number between 0-9"
    getline number
    random=int(rand()*10)
    if (random == number){
      print "congratulations"
    }
    else{
      print "sorry wrong guess"
      print random
    }
    print "do you want to play again"
  }
  else{
    exit
  } 
}
  END{
    }
