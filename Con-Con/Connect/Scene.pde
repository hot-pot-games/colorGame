abstract class Scene{
  PVector anchor;
  
  abstract void load();
  abstract void reset();
  abstract void update();
  abstract void display();
  abstract void update_unlock();
  abstract void display_unlock();
  
  abstract void checkHover(float mx, float my);
  abstract void checkPress(float mx, float my);
  abstract void checkRelease(float mx, float my);
  
  abstract void    hide();
  abstract void    noHide();
  abstract boolean isHide();
}

class SceneStartMenu extends Scene
{
  LevelManager lm;
  Medium med;
  
  
  void load(){
    med     = new Medium(new PVector(105.25,182),100,0.7);
    lm      = new LevelManager(med);
    
    lm.loadLevel(0);
  }
  
  void reset(){
  
  }
  
  void update(){
  
  }
  
  void display(){
    background(#0B091C);
    med.display();
  }
  
  void update_unlock(){
  
  }
  
  void display_unlock(){
  
  }
  
  void checkHover(float mx, float my){
  
  }
  
  void checkPress(float mx, float my){
    if(mouseButton==LEFT)
    {
      med.touch(transX+mouseX,transY+mouseY);
    }
  }
  
  void checkRelease(float mx, float my){
  
  }
  
  void hide(){
  
  }
  
  void noHide(){
  
  }
  
  boolean isHide(){
    return false;
  }


}