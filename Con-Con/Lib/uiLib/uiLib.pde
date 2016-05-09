UIset     us;
UIfactory uf;

void setup(){
  size(800,600);
  us = UIset.getInstance();
  uf = new UIfactory(us);
  uf.addButton(140,80,button_type.COLOR_ELLIPSE_BUTT,function_type.SCENE_01);
  uf.addButton(100,130,button_type.COLOR_RECT_BUTT,function_type.SCENE_02);
}

void draw(){
  background(255);
  us.checkHover(mouseX,mouseY);
  us.display();
}

void mousePressed(){
  us.checkPress(mouseX,mouseY);
}

void mouseReleased(){
  us.checkRelease();
}