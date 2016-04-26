UIset     us;
UIfactory uf;

void setup(){
  size(800,600);
  us = UIset.getInstance();
  uf = new UIfactory();
  uf.addButton(100,80);
}

void draw(){
  background(100);
  us.display();
}

void mousePressed(){

}

void mouseReleased(){

}