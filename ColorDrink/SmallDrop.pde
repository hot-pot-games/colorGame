class SmallDrop extends Drop{
  Drop target;
  PVector speed;
  
  SmallDrop(PVector ppos, float pmass,color pcol,Drop tt)
  {
    super(ppos,pmass);
    this.col = pcol;
    this.target = tt;
    this.calSpeed(target);
  }
  
  void calSpeed(Drop t){
    int life = constrain((int)(random(6000,15000) / t.mass),100,2000);
    float xv,yv;
    xv = (t.pos.x-pos.x)/life;
    yv = (t.pos.y-pos.y)/life;
    
    this.speed = new PVector(xv,yv);
  }
  
  void moveToTarget()
  {
    this.pos.add(speed);
  }
  
  void kill(){
    isDead = true;
  }
  
  void display(){
    fill(col);
    noStroke();
    ellipse(pos.x,pos.y,mass * density*SMALL_DROP_DRAW,mass * density*SMALL_DROP_DRAW);
  }
  
  boolean isReached(){
    
    if(pos.dist(target.pos) < mass * density *SMALL_DROP_DRAW / 2f + target.mass * target.density/ 2f){
      return true;
    }
    else{
      return false;
    }
  }
  
  
}