class Scene{
  PVector anchor;
  PVector size;
  boolean isDraw;
  
  Scene(int x, int y){
    anchor = new PVector(x*width,y*height);
    size   = new PVector(width,height);
    isDraw = true;
  }
  
  void active(){
    isDraw = true;
  }
  
  void disable(){
    isDraw = false;
  }
  
  void update(){
  
  }
  
  void draw(){
    fill(100);
    rect(anchor.x,anchor.y,size.x,size.y);
  }
}

class Scene01 extends Scene{
  Scene01(int x, int y){
    super(x,y);
  }
  
  void update(){
  
  }
  
  void draw(){
    fill(0);
    rect(anchor.x,anchor.y,size.x,size.y);
  }
}

class Scene02 extends Scene{
  Scene02(int x, int y){
    super(x,y);
  }
  
  void update(){
  
  }
  
  void draw(){
    fill(200);
    rect(anchor.x,anchor.y,size.x,size.y);
  }
}


import de.looksgood.ani.*;
ArrayList<Scene>sls;
float x = 0;
float y = 0;

void setup(){
  size(400,720);
  sls = new ArrayList<Scene>();
  sls.add(new Scene(0,0));
  sls.add(new Scene01(1,0));
  sls.add(new Scene02(0,1));
  Ani.init(this);
}

void draw(){
  background(255);
  
  translate(-x,-y);
  for(Scene s: sls)
  {
    if(s.isDraw){
      s.update();
      s.draw();
    }
  }
}


void mouseReleased() {
    // animate the variables x and y in 1.5 sec to mouse click position
    Ani.to(this, 1.5, "x", mouseX);
    Ani.to(this, 1.5, "y", mouseY);
}