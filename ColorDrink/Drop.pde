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
  
  void attract(Drop anoP)
  {
    
  }
  
  void receive(SmallDrop sd)
  {
    
  }
}