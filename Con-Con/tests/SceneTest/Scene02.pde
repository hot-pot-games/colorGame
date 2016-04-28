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