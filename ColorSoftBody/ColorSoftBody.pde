float intervalBetweenParticls = 30f;

Chunk ck;

void setup()
{
  size(1280,720);
  ck = new Chunk(new PVector(640,360));
  ck.loadShape(bp_man,intervalBetweenParticls);
}

void draw()
{
  background(255);
  ck.display();
}