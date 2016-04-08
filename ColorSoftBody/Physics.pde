abstract class Mover{
  PVector pos;
  PVector speed;
  PVector force;

  float   mass;
  boolean isLocked;
  
  Mover() {
    this.mass     = 0;
    this.pos      = new PVector(0, 0);
    this.speed    = new PVector(0, 0);
    this.force    = new PVector(0, 0);
    this.isLocked = false;
  }
  
  abstract void display();
  abstract void update();
}




class Physics{
  
}