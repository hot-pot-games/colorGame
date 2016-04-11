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
    density = 2;
  }
  
  void display()
  {
    fill(col);
    noStroke();
    ellipse(pos.x,pos.y,mass * density,mass * density);
  }
  
  void produceSmallDrop(Drop tt, float ss){
    sds.add(new SmallDrop(this.pos.copy(),ss,col,tt));
    //mass -= ss;
    targetMass -= ss;
  }
  
  void attract(Drop that)
  {
    float rate = this.targetMass/dist(this.pos.x,this.pos.y,that.pos.x,that.pos.y);
    if(random(0,1) < rate * dropK && that.targetMass > 5){
      float ss = (random(0,5) * targetMass/(targetMass + that.targetMass));
      that.produceSmallDrop(this,ss);
      //println("produced one: weight:"+ss+" at:" + that.pos.x+" "+that.pos.y);
    }
  }
  
  void receive(SmallDrop sd)
  {
    mergeColor(sd);
    sd.kill();
  }
  
  void mergeColor(Drop sd){
    tr = (tr * targetMass + sd.tr * sd.targetMass)/(targetMass + sd.targetMass);
    tg = (tg * targetMass + sd.tg * sd.targetMass)/(targetMass + sd.targetMass);
    tb = (tb * targetMass + sd.tb * sd.targetMass)/(targetMass + sd.targetMass);
    //mass += sd.mass;
    targetMass += sd.targetMass;
  }
  
  void massLerp()
  {
    if(mass > targetMass)
      mass -= massStep;
    else if(mass < targetMass)
      mass += massStep;
  }
  
  void colorLerp()
  {
    if(r > tr)
      r -= colorStep;
    else if(r < tr)
      r += colorStep;
    if(g > tg)
      g -= colorStep;
    else if(g < tg)
      g += colorStep; 
    if(b > tb)
      b -= colorStep;
    else if(b < tb)
      b += colorStep;
      
    col = color(r * 255.0f,g * 255.0f,b * 255.0f);
  }
}