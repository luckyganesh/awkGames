#! /usr/bin/awk -f
BEGIN{
  print "Welcome to the game"
  print "Enter name of player1"
  getline player[1]
  print "Enter name of player2"
  getline player[2]
  print player[1] " enter your symbol"
  getline symbol[1]
  print player[2] " enter your symbol"
  getline symbol[2]
  while(symbol[2]==symbol[1]){
    print "sorry "player[1] " already given that symbol"
    print "give another symbol"
    getline symbol[2]
  }
  split(" , , , , , , , , ",board,",");
  print "it is ready,start playing guys"
  printing(board)
  move=1
  turn=1
  print player[turn]" its your turn"
}

{
  place=$0
}

($0 > 9 || $0 < 1) {
  print "try again"
  next
}

(board[place] != " "){
  print "sorry wrong move"
  print "give another place that you want"
  next
}

(board[place] == " "){
  board[place]=symbol[turn]
  printing(board)
  checking(board,symbol,turn)
}

(win==1){
  print player[turn]" won the match"
  exit
}

(move == 9 && win ==0){
  print "Draw match"
  exit
}

(move%2 == 0){
  turn=1
}

(move%2 == 1){
  turn=2
}

{
  move++
  print player[turn]" its your turn"
}

END{
  }
function printing(board){
  print " --- --- --- "
  print "| "board[1] " | " board[2] " | " board[3] " |"
  print " --- --- --- "
  print "| "board[4] " | " board[5] " | " board[6] " |"
  print " --- --- --- "
  print "| "board[7] " | " board[8] " | " board[9] " |"
  print " --- --- --- "
}
function checking(board,symbol,turn){
  win=0
  if(board[1]==symbol[turn]){
    if(board[2]==symbol[turn] && board[3]==symbol[turn]){
        win=1
    }
    if(board[5]==symbol[turn] && board[9]==symbol[turn]){
        win=1
    }
    if(board[4]==symbol[turn] && board[7]==symbol[turn]){
        win=1
    }
  }
  if(board[5]==symbol[turn]){
    if(board[7]==symbol[turn] && board[3]==symbol[turn]){
      win=1
    }
    if(board[4]==symbol[turn] && board[6]==symbol[turn]){
      win=1
    }
    if(board[8]==symbol[turn] && board[2]==symbol[turn]){
      win=1
    }
  }
  if(board[9]==symbol[turn]){
    if(board[6]==symbol[turn] && board[3]==symbol[turn]){
      win=1
    }
    if(board[8]==symbol[turn] && board[7]==symbol[turn]){
      win=1
    }
  }
  return win
}
