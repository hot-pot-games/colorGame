import fisica.*;

FWorld world;

float xPos = 0;

void setup()
{
  size(400,400);
  smooth();
  
  Fisica.init(this);
  
  world = new FWorld();
  world.setGravity(0,300);
  
  FPoly l = new FPoly();
  l.vertex(0,height - 20);
  l.vertex(width,height - 20);
  l.vertex(width,height);
  l.vertex(0,height);
  l.setStatic(true);
  l.setFill(0);
  l.setFriction(0);
  world.add(l);
}

void draw()
{
  background(255);
  
  if ((frameCount % 40) == 1) {
    FBlob b = new FBlob();
    float s = random(30, 40);
    float space = (width - s);
    xPos = (xPos + random(s, space/2)) % space;
    b.setAsCircle(xPos+s/2,random(100), s, 20);
    b.setStroke(0);
    b.setStrokeWeight(2);
    b.setFill(80, 120, 200);
    b.setFriction(0);
    world.add(b);
  }
  
  world.step();
  world.draw();
}