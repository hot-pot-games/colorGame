UIset     us;
UIfactory uf;

void setup(){
  size(800,600);
  us = UIset.getInstance();
  uf = new UIfactory(us);
  uf.addButton(100,80,function_type.SCENE_01);
  uf.addButton(100,180);
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