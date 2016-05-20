abstract class Scene{
  PVector anchor;
  PVector size;
  
  abstract Scene load();
  abstract void  reset();
  abstract void  update();
  abstract void  display();
  abstract void  update_unlock();
  abstract void  display_unlock();
  
  abstract void  checkHover(float mx, float my);
  abstract void  checkPress(float mx, float my);
  abstract void  checkRelease(float mx, float my);
}

class SceneStartMenu extends Scene
{
  SceneStartMenu(int x, int y){
    anchor = new PVector(x*width,y*height);
    size   = new PVector(width,height);
  }
  
  
  Scene load(){
    return this;
  }
  
  void reset(){
  
  }
  
  void update(){
  
  }
  
  void display(){
    
    pushMatrix();
    translate(anchor.x,anchor.y);
    fill(255);
    noStroke();
    rect(0,0,size.x,size.y);
    popMatrix();
  }
  
  void update_unlock(){
  
  }
  
  void display_unlock(){
  
  }
  
  void checkHover(float mx, float my){
  
  }
  
  void checkPress(float mx, float my){
  }
  
  void checkRelease(float mx, float my){
  
  }

}


class SceneGameView extends Scene
{
  LevelManager lm;
  Medium med;
  
  SceneGameView(int x, int y){
    anchor = new PVector(x*width,y*height);
    size   = new PVector(width,height);
  }
  
  
  SceneGameView load(){
    med     = new Medium(new PVector(105.25,182),100,0.7);
    lm      = new LevelManager(med);
    
    lm.loadLevel(0);
    return this;
  }
  
  void reset(){
  
  }
  
  void update(){
  
  }
  
  void display(){
    pushMatrix();
    translate(anchor.x,anchor.y);
    fill(#0B091C);
    noStroke();
    rect(0,0,size.x,size.y);
    med.display();
    popMatrix();
  }
  
  void update_unlock(){
  
  }
  
  void display_unlock(){
  
  }
  
  void checkHover(float mx, float my){
  
  }
  
  void checkPress(float mx, float my){
    //println("in");
    if(mouseButton==LEFT)
    {
      med.touch(mx-anchor.x,my-anchor.y);
    }
  }
  
  void checkRelease(float mx, float my){
  
  }
  
}


class SceneAbout extends Scene
{
  SceneAbout(int x, int y){
    anchor = new PVector(x*width,y*height);
    size   = new PVector(width,height);
  }
  
  
  Scene load(){
    return this;
  }
  
  void reset(){
  
  }
  
  void update(){
  
  }
  
  void display(){
    
    pushMatrix();
    translate(anchor.x,anchor.y);
    fill(255);
    noStroke();
    rect(0,0,size.x,size.y);
    popMatrix();
  }
  
  void update_unlock(){
  
  }
  
  void display_unlock(){
  
  }
  
  void checkHover(float mx, float my){
  
  }
  
  void checkPress(float mx, float my){
  }
  
  void checkRelease(float mx, float my){
  
  }

}

class SceneStore extends Scene
{
  SceneStore(int x, int y){
    anchor = new PVector(x*width,y*height);
    size   = new PVector(width,height);
  }
  
  
  Scene load(){
    return this;
  }
  
  void reset(){
  
  }
  
  void update(){
  
  }
  
  void display(){
    
    pushMatrix();
    translate(anchor.x,anchor.y);
    fill(255);
    noStroke();
    rect(0,0,size.x,size.y);
    popMatrix();
  }
  
  void update_unlock(){
  
  }
  
  void display_unlock(){
  
  }
  
  void checkHover(float mx, float my){
  
  }
  
  void checkPress(float mx, float my){
  }
  
  void checkRelease(float mx, float my){
  
  }

}

class SceneOption extends Scene
{
  SceneOption(int x, int y){
    anchor = new PVector(x*width,y*height);
    size   = new PVector(width,height);
  }
  
  
  Scene load(){
    return this;
  }
  
  void reset(){
  
  }
  
  void update(){
  
  }
  
  void display(){
    
    pushMatrix();
    translate(anchor.x,anchor.y);
    fill(255);
    noStroke();
    rect(0,0,size.x,size.y);
    popMatrix();
  }
  
  void update_unlock(){
  
  }
  
  void display_unlock(){
  
  }
  
  void checkHover(float mx, float my){
  
  }
  
  void checkPress(float mx, float my){
  }
  
  void checkRelease(float mx, float my){
  
  }

}