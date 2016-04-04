class Planet{
  color   col;
  PVector size;
  
  Planet(PVector psize, color pcol){
    this.col  = pcol;
    this.size = psize.copy();
  }
  
  void display(){
    noStroke();
    fill(col);
    ellipse(0,0,size.x,size.y);
  }
}

class Track{
  ArrayList<Planet>parts;
  float rotateSpeed;
  float rad;
  float dis;
  
  Galaxy sun;
  
  Track(Galaxy nsun, float pdis, float s){
    this.parts = new ArrayList<Planet>();
    this.rotateSpeed = s;
    this.rad = 0;
    this.sun = nsun;
    this.dis = pdis;
  }
  
  void display(){
    pushMatrix();
    translate(sun.pos.x,sun.pos.y);
    rotate(rad);
    for(int i=0; i<parts.size(); i++){
      Planet p;
      p = parts.get(i);
      pushMatrix();
      float rr;
      rr = i*1f/parts.size()*TWO_PI;
      translate(cos(rr)*dis,sin(rr)*dis);
      p.display();
      popMatrix();
    }
    popMatrix();
    rad += rotateSpeed;
  }
  
  void addR(){
    float rr;
    rr = random(5,15);
    int a,b,c;
    a = (int)random(0,255);
    b = (int)random(0,255);
    c = (int)random(0,255);
    parts.add(new Planet(new PVector(rr,rr),color(a,b,c)));
  }

}


class Galaxy{
  PVector pos;
  int mass;
  
  
  ArrayList<Track>tks;
  
  Galaxy(PVector ppos, int pmass){
    this.pos      = ppos.copy();
    this.mass     = pmass;
    this.tks    = new ArrayList<Track>();
    tks.add(new Track(this,mass*0.8,0.05));
    tks.get(0).addR();
    tks.get(0).addR();
    tks.get(0).addR();
    tks.get(0).addR();
    tks.get(0).addR();
    tks.get(0).addR();
    tks.add(new Track(this,mass*1.2,0.09f));
    tks.get(1).addR();
    tks.get(1).addR();
    tks.get(1).addR();
  }
  
  void display(){
    
    stroke(255);
    strokeWeight(4);
    fill(mass);
    ellipse(pos.x,pos.y,mass,mass);
    
    for(Track t: tks){
      t.display();
    }
  }
}