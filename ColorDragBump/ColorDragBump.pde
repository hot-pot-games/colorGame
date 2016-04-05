InputManager im;
Physics      ps;
Coll cl;

float        ss = 2;

void setup()
{
  size(800,600);
  im = new InputManager();
  ps = new Physics();
  cl = new Coll(400,300,40);
  
  ps.add(cl);
  im.add(cl);
  smooth();
}


void draw()
{
  background(255);
  cl.display();
  ps.display();
  im.display();
}