import de.looksgood.ani.*;
import controlP5.*;

ControlP5 cp5;
boolean isR;
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
  cp5 = new ControlP5(this);

  isR = false;



  // create a new button with name 'buttonA'
  cp5.addButton("Scene01_")
    .setValue(0)
    .setPosition(100, 100)
    .setSize(200, 19)
    ;

  cp5.addButton("Scene02_")
    .setValue(0)
    .setPosition(width+100, 100)
    .setSize(200, 19)
    ;

  isR = true;
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
  popMatrix();
}


void mouseReleased() {
}

public void Scene01_(int theValue) {
  if (isR)
  {
    Ani.to(this, 0.9, "x", width, Ani.CUBIC_IN_OUT);
    Ani.to(this, 0.9, "y", 0, Ani.CUBIC_IN_OUT);
  }
}

public void Scene02_(int theValue) {
  if (isR)
  {
    Ani.to(this, 0.9, "x", 0, Ani.CUBIC_IN_OUT);
    Ani.to(this, 0.9, "y", -height, Ani.CUBIC_IN_OUT);
  }
}