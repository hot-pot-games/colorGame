final int STATE_NONE  = 13000;
final int STATE_HOVER = 13001;
final int STATE_CLICK = 13002;
final int STATE_DRAG  = 13003;


class InputManager{
  ArrayList<Clickable>bts;
  Clickable nowc;
  boolean hasSele;
  int chooseState;
  
  
  InputManager(){
    this.bts = new ArrayList<Clickable>();
    this.nowc = null;
    this.hasSele = false;
    this.chooseState = STATE_NONE;
  }
  
  void add(Clickable cb){
    bts.add(cb);
  }
  
  void checkHover(){
    for(Clickable b: bts){
      if(b.hoverable){
        if(b.isIn(mouseX,mouseY)){
          if(STATE_HOVER >= chooseState){
            chooseState = STATE_HOVER;
            nowc        = b;
            hasSele     = true;
            return;
          }
        }
      }
    }
    if(chooseState!=STATE_DRAG){
      chooseState = STATE_NONE;
      nowc        = null;
      hasSele     = false;
    }
  }
  
  void display(){
    checkHover();
    if(nowc!=null){
      nowc.drawHover();
    }
    
  }
  
}