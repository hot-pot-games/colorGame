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