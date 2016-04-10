float intervalBetweenParticls = 30f;
InputManager im;

Chunk ck;

void setup()
{
  size(1280,720);
  im = new InputManager();
  ck = new Chunk(new PVector(640,360));
  ck.loadShape(bp_man,intervalBetweenParticls);
}

void draw()
{
  background(255);
  ck.update();
  ck.display();
  im.display();
}