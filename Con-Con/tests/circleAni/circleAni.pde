ArrayList<ParticleSystem> particleSystems;

void setup() {
  size(640, 360);
  particleSystems = new ArrayList<ParticleSystem>();
  smooth();
}

void draw() {
  background(0);
  if (particleSystems.size() > 0)
  {
    for (int i = 0;i < particleSystems.size() - 1;i++) {
      particleSystems.get(i).run();
    }
  }
}

void mousePressed()
{
  color newCol = color(random(255), random(255), random(255));
  int newR = int(random(50, 120));
  int newNum = int(random(80, 120));
  particleSystems.add(new ParticleSystem(newR, newNum, newCol));
}