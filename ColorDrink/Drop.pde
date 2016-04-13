float dropK = 1f;
float massStep = 0.3f;
float colorStep = 0.005f;

class Drop{
  color col;
  
  float r;
  float g;
  float b;
  float tr;
  float tg;
  float tb;
  
  PVector pos;
  float mass;
  float targetMass;
  float density;
  boolean isDead;
  
  Drop(PVector ppos, float pmass)
  {
    this.pos = ppos;
    this.mass = pmass;
    this.targetMass = this.mass;
    this.r = random(0,1);
    this.g = random(0,1);
    this.b = random(0,1);
    col = color(r * 255.0f,g * 255.0f,b * 255.0f);
    this.tr = this.r;
    this.tg = this.g;
    this.tb = this.b;
    this.isDead = false;
    density = 2;
  }
  
  void kill(){
    isDead = isD;
  }
  
  void display()
  {
    fill(col);
    noStroke();
    ellipse(pos.x,pos.y,mass * density,mass * density);
  }
  
  void displayCenter(){
    fill(255);
    ellipse(pos.x,pos.y,6,6);
    fill(0);
    ellipse(pos.x,pos.y,4,4);
  }
  
  void produceSmallDrop(Drop tt, float ss){
    sds.add(new SmallDrop(this.pos.copy(),ss,col,tt));
    targetMass -= ss;
  }
  
  void attract(Drop that)
  {
    float rate = this.targetMass/dist(this.pos.x,this.pos.y,that.pos.x,that.pos.y);
    if(random(0,1) < rate * dropK && that.targetMass > 1){
      float ss = (random(0,1) * this.mass/(this.mass + that.mass));
      that.produceSmallDrop(this,ss);
      //println("produced one: weight:"+ss+" at:" + that.pos.x+" "+that.pos.y);
    }
  }
  
  void receive(Drop sd)
  {
    mergeColor(sd);
    sd.kill();
  }
  
  void mergeColor(Drop sd){
    tr = (tr * targetMass + sd.tr * sd.targetMass)/(targetMass + sd.targetMass);
    tg = (tg * targetMass + sd.tg * sd.targetMass)/(targetMass + sd.targetMass);
    tb = (tb * targetMass + sd.tb * sd.targetMass)/(targetMass + sd.targetMass);
    targetMass += sd.targetMass;
  }
  
  void massLerp()
  {
    mass = abs(mass - targetMass) < massStep ? targetMass : mass > targetMass ? mass - massStep : mass + massStep;
  }
  
  void colorLerp()
  {
    r = abs(r - tr) < colorStep ? tr : r > tr ? r - colorStep : r + colorStep;
    g = abs(g - tg) < colorStep ? tg : g > tg ? g - colorStep : g + colorStep;
    b = abs(b - tb) < colorStep ? tb : b > tb ? b - colorStep : b + colorStep;
      
    col = color(r * 255.0f,g * 255.0f,b * 255.0f);
  }
  
  boolean isAbove(Drop that){
    if(this.pos.dist(that.pos) < this.mass * this.density / 2f - that.mass * that.density / 2f)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
}