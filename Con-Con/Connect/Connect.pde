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

Medium med;

void setup(){
  ConChan c = new ConChan(new Color(0.2,0.6,0.8));
  Cell cl = new Cell(0,0);
  cl.poison(new Color(0.8,0.6,0));
  cl.live(c);
  med = new Medium(new PVector(width/2-10,height/2-10),100,1);
  med.add(cl);
}


void draw(){
  background(255);
  med.display();
}


void mouseDragged(){
  med.drag();
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if(e>0){
    med.scaleDown();
  }
  else{
    med.scaleUp();
  }
}