//枚举类型 function_enum
public enum function_type{
  NONE,SCENE_01,SCENE_02,SCENE_03,SCENE_04;
}

void doEvent(function_type value){
  switch(value){
    case NONE:     println("none function");break;
    case SCENE_01: changeToGameView(); break;
    case SCENE_02: changeToStartMenu();break;
    case SCENE_03: break;
    default: println("ERROR：使用了未初始化的枚举值（function_enum）"); break;
  }
}


void changeToGameView(){
  println("scene01 function");
  sc.moveToScene(ss.get(1));
}

void changeToStartMenu(){
  println("scene02 function");
  sc.moveToScene(ss.get(0));
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