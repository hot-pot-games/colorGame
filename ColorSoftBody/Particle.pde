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
  Particle xp,xn,yp,yn; //四方形连接的Particle
  
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
  
  void setMates(Particle xxp, Particle xxn, Particle yyp, Particle yyn){
    this.xp = xxp;
    this.xn = xxn;
    this.yp = yyp;
    this.yn = yyn;
  }
}