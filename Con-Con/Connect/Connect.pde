import de.looksgood.ani.*;


//显示高度；宽高比为9:16
final int HEIGHT = 720;

void settings(){
  float hh;
  float ww;
  hh = HEIGHT;
  ww = hh/16f*9;
  size((int)ww,(int)hh);
}

//全局变量

ArrayList<Scene>ss;
Scene   seleScene;
boolean isLockScene;

UIset      us;
UIfactory  uf;
SceneClock sc;

PImage backP;
PImage startP;
PImage endP;

float transX,transY;



void setup(){
  //ConChan c = new ConChan(new Color(0.2,0.6,0.8));
  //Cell cl = new Cell(0,0);
  //cl.poison(new Color(0.8,0.6,0));
  //cl.live(c);
  //lm      = new LevelManager();
  //med     = new Medium(new PVector(width/2,height/2),100,1);
  Ani.init(this);
  sc = new SceneClock();
  
  backP   =loadImage("back.jpg");
  startP  =loadImage("start.png");
  endP    =loadImage("flag.png");
  
  transX = 0;
  transY = 0;
  
  ss = new ArrayList<Scene>();
  ss.add(new SceneStartMenu(0,0).load());
  ss.add(new SceneGameView(1,0).load());
  
  isLockScene = true;
  seleScene   = ss.get(0);
  
  //构建按钮
  us = UIset.getInstance();
  uf = new UIfactory(us);
  uf.addButton(width/2-40,height*0.6,function_type.SCENE_01);
  uf.addButton(width+width*0.1,height*0.05,function_type.SCENE_02);
}


void draw(){
  sc.update();
  
  translate(-transX,-transY);
  
  if(!isLockScene)
  {
    for(Scene s: ss){
      s.display();
    }
  }
  else{
    seleScene.display();
  }
  
  us.checkHover(transX+mouseX,transY+mouseY);
  us.display();

}


void mousePressed(){
  if(isLockScene)
  {
    //println(seleScene.anchor.x);
    seleScene.checkPress(transX+mouseX,transY+mouseY);
  }
  us.checkPress(transX+mouseX,transY+mouseY);
}



void mouseDragged()
{
  //med.drag();
}

void mouseReleased(){
  us.checkRelease();
}



//void mouseWheel(MouseEvent event) {
//  float e = event.getCount();
//  if(e>0){
//    med.scaleDown();
//  }
//  else{
//    med.scaleUp();
//  }
//}

//void keyPressed(){
//  println(med.pos+" "+med.scale);
//}