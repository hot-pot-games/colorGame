float intervalBetweenParticls = 30f;

Chunk ck;

void setup()
{
  size(1280,720);
  ck = new Chunk(new PVector(300,200));
  ck.loadShape(bp_man,intervalBetweenParticls);
}

void draw()
{
  background(255);
  ck.display();
}