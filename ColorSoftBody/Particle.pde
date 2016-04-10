color lockColor = #F07368;
color freeColor = #68F072;
float massScale = 1f;
float hookK = 0.02f;

class Particle extends Mover
{
  //以下变量继承自超类Mover
  //PVector pos;
  //PVector speed;
  //PVector force;

  //float   mass;
  //boolean isLocked;
  Particle xp,xn,yp,yn; //四方形连接的Particle
  Chunk parent;
  PVector size;
  

  Particle(PVector ppos, float pmass, Chunk par) {
    super();
    super.mass     = pmass;
    super.pos      = ppos.copy();
    this.size      = new PVector(mass*massScale, mass*massScale);
    this.parent    = par;
  }
  
  boolean isIn(int mx, int my){
    
    if(dist(mx,my,pos.x,pos.y)<size.x/2){
      return true;
    }
    else{
      return false;
    }
  }
  
  PVector getHookForce(Particle p){
    PVector pf;
    pf = new PVector(0,0);
    PVector force;
    force = new PVector(p.pos.x-pos.x,p.pos.y-pos.y);
    float d = force.mag();
    force.normalize();
    if(d>intervalBetweenParticls){
      d = d - intervalBetweenParticls;
    }
    else{
      d = intervalBetweenParticls-d;
      force.mult(-1);
    }
    
    pf = force.mult(d*hookK);
    
    return pf;
  }

  void update() {
    if(isLocked){
      return;
    }
    
    PVector f;
    f = new PVector(0,0);
    if(xn!=null){
      f.add(getHookForce(xn));
    }
    if(yn!=null){
      f.add(getHookForce(yn));
    }
    if(xp!=null){
      f.add(getHookForce(xp));
    }
    if(yp!=null){
      f.add(getHookForce(yp));
    }
    
    this.force.add(f);
    
    this.speed.add(force);
    float d = speed.mag();
    d = constrain(d,-15.0,15.0);
    speed.normalize();
    speed.mult(d);
    
    this.pos.add(speed);
    this.force.mult(0);
    
    this.speed.mult(0.95);
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
  
  void drawHover(){
    stroke(0);
    strokeWeight(2);
    fill(100,200);
    ellipse(pos.x, pos.y, size.x, size.y);
  }
  
  void drawDragged(){
    stroke(0);
    strokeWeight(2);
    fill(#22892A);
    ellipse(pos.x, pos.y, size.x, size.y);
  }
  
  
  void applyForce(PVector fo){
    this.force.add(fo);
  }
  
  
  void setMates(Particle xxp, Particle xxn, Particle yyp, Particle yyn){
    this.xp = xxp;
    this.xn = xxn;
    this.yp = yyp;
    this.yn = yyn;
  }
  
  void lock(){
    this.force.mult(0);
    this.speed.mult(0);
    isLocked = true;
  }
  
  void unLock(){
    isLocked = false;
  }
  
}