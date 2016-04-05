class Physics
{
  ArrayList<Coll>balls;
  
  float friction = -0.9;
  float spring = 0.05;
  float friction_move = 0.998;
  
  Physics(){
    balls = new ArrayList<Coll>();
  }
  
  void add(Coll cl){
    balls.add(cl);
  }
  
  void display(){
    for(int i=0; i<balls.size(); i++)
    {
      Coll cl;
      cl = balls.get(i);
      //cl.speed.mult(friction_move);
      if (cl.pos.x + cl.size.x/2 > width) {
        cl.pos.x = width - cl.size.x/2;
        cl.speed.x *= friction; 
      }
      else if (cl.pos.x - cl.size.x/2 < 0) {
        cl.pos.x = cl.size.x/2;
        cl.speed.x *= friction; 
      }
      if (cl.pos.y + cl.size.x/2 > height) {
        cl.pos.y = height - cl.size.x/2;
        cl.speed.y *= friction; 
      } 
      else if (cl.pos.y - cl.size.x/2 < 0) {
        cl.pos.y = cl.size.x/2;
        cl.speed.y *= friction; 
      }
      collide(i);
    }
  }
  
  void collide(int id) {
    for (int i = id + 1; i < balls.size(); i++) {
      Coll b = balls.get(i);
      Coll a = balls.get(id);
      float dx = b.pos.x - a.pos.x;
      float dy = b.pos.y - a.pos.y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = b.size.x/2 + a.size.x/2;
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
      }
    }   
  }
  
}