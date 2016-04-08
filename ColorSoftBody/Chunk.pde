class Chunk extends Mover
{
  //以下变量继承自超类Mover
  //PVector pos;
  //PVector speed;
  //PVector force;

  //float   mass;
  //boolean isLocked;
  ArrayList<Particle>ps;
  
  Chunk(PVector ppos){
    super();
    super.pos  = ppos.copy();
    super.mass = 0;
    ps = new ArrayList<Particle>();
  }
  
  
  void add(Particle p){
    this.ps.add(p);
  }
  
  void update(){
    
  }
  
  void display(){
    pushMatrix();
    translate(pos.x,pos.y);
    
    for(Particle p: ps){
      p.display();
    }
    
    popMatrix();
  }
  
  void loadShape(){
  
  }
  
}