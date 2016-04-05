InputManager im;
Coll cl;

void setup()
{
  size(800,600);
  im = new InputManager();
  cl = new Coll(400,300,40);
  im.add(cl);
  smooth();
}


void draw()
{
  background(255);
  cl.display();
  im.display();
}