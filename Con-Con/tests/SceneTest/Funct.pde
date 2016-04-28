final int EVENT_NONE   = 11000;
final int EVENT_ONE    = 11001;
final int EVENT_TWO    = 11002;
final int EVENT_THERE  = 11003;
final int EVENT_FOUR   = 11004;

void doEvent(int value) {
  switch(value) {
  case EVENT_ONE:  
    Scene01_(); 
    break;
  case EVENT_TWO:  
    Scene02_(); 
    break;

  case EVENT_THERE:  
    Scene03_(); 
    break;

  case EVENT_FOUR:  
    Scene04_(); 
    break;
  }
}

public void Scene01_() {
  Ani.to(this, 0.9, "x", width, Ani.CUBIC_IN_OUT);
  Ani.to(this, 0.9, "y", 0, Ani.CUBIC_IN_OUT);
}

public void Scene02_() {
  Ani.to(this, 0.9, "x", width, Ani.CUBIC_IN_OUT);
  Ani.to(this, 0.9, "y", height, Ani.CUBIC_IN_OUT);
}

public void Scene03_() {
  Ani.to(this, 0.9, "x", 0, Ani.CUBIC_IN_OUT);
  Ani.to(this, 0.9, "y", height, Ani.CUBIC_IN_OUT);
}

public void Scene04_() {
  Ani.to(this, 0.9, "x", 0, Ani.CUBIC_IN_OUT);
  Ani.to(this, 0.9, "y", 0, Ani.CUBIC_IN_OUT);
}