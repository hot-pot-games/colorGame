//枚举类型 function_enum
public enum function_type{
  NONE,SCENE_01,SCENE_02,SCENE_03,SCENE_04,SCENE_05,
  COLOR_BUT_01,TOOL_BUT_01;
}

void doEvent(function_type value){
  switch(value){
    case NONE:     println("none function");break;
    case SCENE_01: changeToGameView(); break;
    case SCENE_02: changeToStartMenu();break;
    case SCENE_03: changeToAbout(); break;
    case SCENE_04: changeToOption(); break;
    case SCENE_05: changeToStore(); break;
    default: println("ERROR：使用了未初始化的枚举值（function_enum）"); break;
  }
}


void doEvent(function_type value, int extraValue){
  switch(value){
    case COLOR_BUT_01: changeColorTo(extraValue); break;
    case TOOL_BUT_01:  changeToolTo(extraValue); break;
    default: println("ERROR：使用了未初始化的枚举值（function_enum）"); break;
  }
}


void changeColorTo(int cnum){
  sg.med.seleColorIndex = cnum;
  
  println(cnum);
}

void changeToolTo(int tnum){
  switch(tnum){
    case 0: 
      sg.med.seleTool = color_tool.DROP_TOOL;
    break;
    
    case 1: 
      sg.med.seleTool = color_tool.CUT_TOOL;
    break;
  
  }
  println(tnum);
}

void changeToGameView(){
  println("scene01 function");
  sc.moveToScene(ss.get(1));
}

void changeToStartMenu(){
  println("scene02 function");
  sc.moveToScene(ss.get(0));
}

void changeToAbout(){
  println("scene03 function");
  sc.moveToScene(ss.get(2));
}

void changeToOption(){
  println("scene04 function");
  sc.moveToScene(ss.get(3));
}

void changeToStore(){
  println("scene05 function");
  sc.moveToScene(ss.get(4));
}


class SceneClock{
  int startTime;
  int waitTime;
  boolean isOver;
  Scene   toLerp;
  
  SceneClock(){
    isOver = true;
  }
  
  void moveToScene(Scene ns){
    isLockScene = false;
    isOver = false;
    float time = 0.9;
    toLerp = ns;
    PVector pos;
    pos = ns.anchor.copy();
    println(pos);
    startTime = millis();
    waitTime  = (int)(time*1000);
    move(time,pos);
  }
  
  void update(){
    if(!isOver){
      if(millis()>startTime+waitTime){
        isOver = false;
        seleScene = toLerp;
        isLockScene = true;
      }
    }
  }
}

void move(float time, PVector pos){
  Ani.to(this, time, "transX", pos.x, Ani.CUBIC_IN_OUT);
  Ani.to(this, time, "transY", pos.y, Ani.CUBIC_IN_OUT);
}