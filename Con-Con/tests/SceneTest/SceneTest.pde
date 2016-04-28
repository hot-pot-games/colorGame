import de.looksgood.ani.*;

uic ic;
ArrayList<Scene>sls;
float x = 0;
float y = 0;

void setup() {
  size(400, 720);
  sls = new ArrayList<Scene>();
  sls.add(new Scene(0, 0));
  sls.add(new Scene01(1, 0));
  sls.add(new Scene02(0, 1));
  Ani.init(this);
  ic = new uic();
  ic.addButton(100,80,"sc01",EVENT_ONE);
  ic.addButton(width+100,80,"sc02",EVENT_TWO);
  ic.addButton(width+100,height+80,"sc03",EVENT_THERE);
  ic.addButton(100,height+80,"sc04",EVENT_FOUR);

}

void draw() {
  background(255);
  pushMatrix();
  translate(-x, -y);
  for (Scene s : sls)
  {
    if (s.isDraw) {
      s.update();
      s.draw();
    }
  }
  ic.display();
  popMatrix();
}


void mouseMoved(){
  ic.checkHover(x+mouseX,y+mouseY);
}

void mousePressed(){
  ic.checkPress(x+mouseX,y+mouseY);
}