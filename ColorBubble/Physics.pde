class Physics
{
  ArrayList<Bubble>balls;
  
  float friction = -0.9;
  float spring = 0.05;
  float friction_move = 0.998;
  
  Physics(){
    balls = new ArrayList<Bubble>();
  }
  
  void add(Bubble bl){
    balls.add(bl);
  }
  
  void display(){
    for(int i=0; i<balls.size(); i++)
    {
      Bubble bl;
      bl = balls.get(i);
      //bl.speed.mult(friction_move);
      if (bl.pos.x + bl.radius/2> width) {
        bl.pos.x = width - bl.radius/2;
        bl.speed.x *= friction; 
      }
      else if (bl.pos.x - bl.radius/2 < 0) {
        bl.pos.x = bl.radius/2;
        bl.speed.x *= friction; 
      }
      if (bl.pos.y + bl.radius/2 > height) {
        bl.pos.y = height - bl.radius/2;
        bl.speed.y *= friction; 
      } 
      else if (bl.pos.y - bl.radius/2 < 0) {
        bl.pos.y = bl.radius/2;
        bl.speed.y *= friction; 
      }
      collide(i);
    }
  }
  
  void collide(int id) {
    for (int i = id + 1; i < balls.size(); i++) {
      Bubble b = balls.get(i);
      Bubble a = balls.get(id);
      float dx = b.pos.x - a.pos.x;
      float dy = b.pos.y - a.pos.y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = b.radius/2 + a.radius/2;
      if (distance < minDist) { 
        float angle = atan2(dy, dx);
        float targetX = a.pos.x + cos(angle) * minDist;
        float targetY = a.pos.y + sin(angle) * minDist;
        float ax = (targetX - b.pos.x) * spring;
        float ay = (targetY - b.pos.y) * spring;
        a.speed.x -= ax;
        a.speed.y -= ay;
        b.speed.x += ax;
        b.speed.y += ay;
        a.updateExtra(0.2f);
        b.updateExtra(0.2f);
      }
    }   
  }
  
}