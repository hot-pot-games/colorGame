Chunk ck;

void setup()
{
  size(1280,720);
  ck = new Chunk(new PVector(300,200));
  ck.add(new Particle(new PVector(300,200),20));
}

void draw()
{
  background(255);
  ck.display();
}