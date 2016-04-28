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

Scene ns;
UIset     us;
UIfactory uf;

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
  
  
  backP   =loadImage("back.jpg");
  startP  =loadImage("start.png");
  endP    =loadImage("flag.png");
  
  transX = 0;
  transY = 0;
  
  ns = new SceneStartMenu();
  ns.load();
  
  us = UIset.getInstance();
  uf = new UIfactory(us);
  uf.addButton(100,80,function_type.SCENE_01);
  uf.addButton(100,180);
}


void draw(){
  translate(-transX,-transY);
  ns.display();
  
  us.checkHover(mouseX,mouseY);
  us.display();
}


void mousePressed(){
  ns.checkPress(transX+mouseX,transY+mouseY);
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