float dropK = 1f;

class Drop{
  color col;
  
  float r;
  float g;
  float b;
  
  PVector pos;
  float mass;
  float density;
  
  Drop(PVector ppos, float pmass)
  {
    this.pos = ppos;
    this.mass = pmass;
    this.r = random(0,1);
    this.g = random(0,1);
    this.b = random(0,1);
    col = color(r * 255.0f,g * 255.0f,b * 255.0f);
    density = 10;
  }
  
  void display()
  {
    fill(col);
    noStroke();
    ellipse(pos.x,pos.y,mass * density,mass * density);
  }
  
  void produceSmallDrop(Drop tt, float ss){
    sds.add(new SmallDrop(this.pos.copy(),ss,col,tt));
    mass -= ss;
  }
  
  void attract(Drop that)
  {
    float rate = this.mass/dist(this.pos.x,this.pos.y,that.pos.x,that.pos.y);
    if(random(0,1)<rate*dropK && that.mass>5){
      float ss = (random(0,5)*mass/(mass+that.mass));
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
    r = (r*mass+sd.r*sd.mass)/(mass+sd.mass);
    g = (g*mass+sd.g*sd.mass)/(mass+sd.mass);
    b = (b*mass+sd.b*sd.mass)/(mass+sd.mass);
    mass += sd.mass;
    col = color(r * 255.0f,g * 255.0f,b * 255.0f);
  }
}