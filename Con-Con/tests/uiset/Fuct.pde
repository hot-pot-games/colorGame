final int EVENT_NONE = 11000;
final int EVENT_ONE  = 11001;
final int EVENT_TWO  = 11002;

void doEvent(int value){
  switch(value){
    case EVENT_ONE:  ev01(); break;
    case EVENT_TWO:  ev02(); break;
  }

}

void ev01(){
  println("event 01 triggered!");
}

void ev02(){
  println("event 02 triggered!");
}