color lockColor = #F07368;
color freeColor = #68F072;
float massScale = 1f;

class Particle extends Mover
{
  //以下变量继承自超类Mover
  //PVector pos;
  //PVector speed;
  //PVector force;

  //float   mass;
  //boolean isLocked;
  
  PVector size;

  Particle(PVector ppos, float pmass) {
    super();
    super.mass     = pmass;
    super.pos      = ppos.copy();
    this.size      = new PVector(mass*massScale, mass*massScale);
  }

  void update() {
    if(isLocked){
      return;
    }
    this.speed.add(force);
    this.pos.add(speed);
    this.force.mult(0);
  }

  void display() {
    noStroke();
    if (isLocked) {
      fill(lockColor);
    } else {
      fill(freeColor);
    }
    ellipse(pos.x, pos.y, size.x, size.y);
  }
}