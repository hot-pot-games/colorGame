class InputManager {
  ArrayList<Particle>ps;

  Particle sp;
  boolean hasSele;
  boolean pMousePressed;


  InputManager() {
    ps            = new ArrayList<Particle>();
    pMousePressed = false;
    hasSele       = false;
    sp            = null;
  }

  void add(Particle p) {
    ps.add(p);
  }

  void display() {
    if (!hasSele) {
      for (Particle p : ps) {
        if (p.isIn(mouseX, mouseY)) {
          p.drawHover();
          break;
        }
      }
    } 
    else {
      PVector force;
      force = new PVector(mouseX-im.sp.X(), mouseY-im.sp.Y());

      float d;

      d = force.mag();          

      //println("mouseX: "+mouseX+"  im.sp.X():" + im.sp.parent.pos.x+ " + "+im.sp.pos.x);
      d = constrain(d, 0, 25.0);
      force.normalize();
      im.sp.applyForce(force.mult(d*forceScale));

      stroke(0);
      strokeWeight(2);
      line(sp.X(), sp.Y(), mouseX, mouseY);

      sp.drawDragged();
      stroke(0);
      strokeWeight(2);
      fill(#9D1616);
      ellipse(mouseX, mouseY, 20, 20);
    }
  }
}

void mousePressed() {
  if (!im.hasSele) {
    for (Particle p : im.ps) {
      if (p.isIn(mouseX, mouseY)) {
        im.hasSele = true;
        im.sp = p;
        break;
      }
    }
  }
}


void mouseReleased() {
  im.hasSele = false;
  im.sp      = null;
}