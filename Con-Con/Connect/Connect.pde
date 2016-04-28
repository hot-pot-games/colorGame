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
LevelManager lm;
Medium med;
PImage backP;
PImage startP;
PImage endP;

float transX,transY;


void setup(){
  //ConChan c = new ConChan(new Color(0.2,0.6,0.8));
  //Cell cl = new Cell(0,0);
  //cl.poison(new Color(0.8,0.6,0));
  //cl.live(c);
  lm      = new LevelManager();
  //med     = new Medium(new PVector(width/2,height/2),100,1);
  med     = new Medium(new PVector(105.25,182),100,0.7);
  backP   =loadImage("back.jpg");
  startP  =loadImage("start.png");
  endP    =loadImage("flag.png");
  
  transX = 0;
  transY = 0;
  
  lm.loadLevel(0);
}


void draw(){
  background(220);
  translate(-transX,-transY);
  med.display();
}


void mousePressed(){
  if(mouseButton==LEFT)
  {
    med.touch(transX+mouseX,transY+mouseY);
  }
}



void mouseDragged()
{
  //med.drag();
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

void keyPressed(){
  println(med.pos+" "+med.scale);
}