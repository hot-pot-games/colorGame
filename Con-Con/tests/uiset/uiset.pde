uic ic;

void setup(){
  size(800,600);
  ic = new uic();
  ic.addButton(100,80,"sc01",EVENT_ONE);
  ic.addButton(100,180,EVENT_TWO);
}

void draw(){
  background(0);
  ic.display();
}

void mouseMoved(){
  ic.checkHover(mouseX,mouseY);
}

void mousePressed(){
  ic.checkPress(mouseX,mouseY);
}