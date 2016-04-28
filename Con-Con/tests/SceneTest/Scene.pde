class Scene{
  PVector anchor;
  PVector size;
  boolean isDraw;
  
  Scene(int x, int y){
    anchor = new PVector(x*width,y*height);
    size   = new PVector(width,height);
    isDraw = true;
    preSetup();
  }   
  void active(){
    isDraw = true;
  }
  
  void disable(){
    isDraw = false;
  }
  
  void preSetup(){
  
  }
  
  void setup(){
    
  }
  
  void update(){
  
  }
  
  void draw(){
    fill(20);
    rect(anchor.x,anchor.y,size.x,size.y);
  }
  
  
}