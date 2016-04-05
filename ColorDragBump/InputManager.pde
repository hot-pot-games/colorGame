final int STATE_NONE  = 13000;
final int STATE_HOVER = 13001;
final int STATE_CLICK = 13002;
final int STATE_DRAG  = 13003;

abstract class Clickable{
  boolean hoverable = false;
  boolean clickable = false;
  boolean draggable = false;
  PVector pos = null;
  
  void freeze()
  {
    hoverable = false;
    clickable = false;
    draggable = false;
  }
  abstract boolean isIn(int mx, int my);
  abstract void display();
  abstract void addForce(PVector force);
  void drawHover(){println("Error: use drawHover without override the past function");};
  void drawClick(){println("Error: use drawClick without override the past function");};
  void drawDrag(){println("Error: use drawDrag without override the past function");};
  void clickEvent() {println("Error: use clickEvent without override the past function");}
  void releaseEvent(){println("Error: use releasEvent without override the past function");}
  
}

abstract class Draginable{
  boolean checkable = false;
  PVector pos = null;
  
  abstract boolean isIn(int mx, int my);
  abstract void display();
  void drawDragIn(){println("Error: use drawDragIn without override the past function");}
  void dragInEvent(){println("Error: use dragInEvent without override the past function");}
}


class InputManager{
  ArrayList<Clickable>bts;
  ArrayList<Draginable>dgs;
  Clickable nowc;
  boolean hasSele;
  int chooseState;
  
  boolean pmousePressed;
  PVector dragOffset;
  
  InputManager(){
    this.bts = new ArrayList<Clickable>();
    this.dgs = new ArrayList<Draginable>();
    this.nowc = null;
    this.hasSele = false;
    this.chooseState = STATE_NONE;
    this.dragOffset  = new PVector(0,0);
  }
  
  void add(Clickable cb){
    bts.add(cb);
  }
  
  void add(Draginable db){
    dgs.add(db);
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
    chooseState = STATE_NONE;
    nowc        = null;
    hasSele     = false;
  }
  
  void checkClick(){
    
    for(Clickable b: bts){
      if(b.clickable){
        if(b.isIn(mouseX,mouseY)){
          if(STATE_CLICK >= chooseState){
            dragOffset.x = b.pos.x-mouseX;
            dragOffset.y = b.pos.y-mouseY;
            chooseState = STATE_CLICK;
            nowc        = b;
            hasSele     = true;
            nowc.clickEvent();
            return;
          }
        }
      }
    }
    chooseState = STATE_NONE;
    nowc        = null;
    hasSele     = false;
  }
  
  void display(){
    if(!mousePressed)      //鼠标没有点击的情况
    {
      if(!pmousePressed)    //MouseMoved鼠标自由移动的情况（鼠标之前也没有点击）
      {
        checkHover();      //检测有没有悬浮在哪个可悬浮物体之上
      }
      else                 //MouseReleased鼠标释放的情况（鼠标之前一直在点击，现在松开了）
      {
        if(nowc!=null){
          nowc.releaseEvent();
        }
        hasSele       = false;
        nowc          = null;
        chooseState   = STATE_NONE;
      }
      pmousePressed = false;
    }
    else
    {
      if(pmousePressed)     //MouseDragged鼠标拖动的情况（鼠标一直点击着）
      {
        if(chooseState!=STATE_NONE && nowc.draggable)
        {
          PVector force;
          force = new PVector(mouseX-nowc.pos.x,mouseY-nowc.pos.y);
          float d = force.mag();                              
          d = constrain(d,5.0,25.0);
          force.normalize();
          nowc.addForce(force.mult(d*0.01f*ss));
          chooseState = STATE_DRAG;
        }
      }
      else                  //mousePressed鼠标按下的情况（鼠标之前没有按下）
      {
        checkClick();
      }
      pmousePressed = true;
    }  
    
    if(nowc!=null && hasSele){
      nowc.display();
       switch(chooseState){
         case STATE_HOVER: nowc.drawHover(); break;
         case STATE_CLICK: nowc.drawClick(); break;
         case STATE_DRAG:  {
           nowc.drawDrag();
           stroke(0,200,50);
           line(nowc.pos.x,nowc.pos.y,mouseX,mouseY);
         
         }break;
       }
    }
    
  }
  
}