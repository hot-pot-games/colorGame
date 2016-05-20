class ParticleSystem {

  ArrayList<Particle> particles;
  int R;

  ParticleSystem(int R, int num, color col) {
    particles = new ArrayList<Particle>();        
    for (int i = 0; i < num; i++) {
      particles.add(new Particle(col, R));
    }
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }

  // A method to test if the particle system still has particles
  boolean dead() {
    if (particles.isEmpty()) {
      return true;
    } else {
      return false;
    }
  }
  
}