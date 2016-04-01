Chunk ck;
Chunk ck2;
boolean hasTwo;
ArrayList<Pixer> py;

void setup(){
  size(800,600);
  ck = new Chunk(new PVector(400,300),50);
  ck2 = new Chunk(new PVector(500,500),50);
  py = new ArrayList<Pixer>();
  py.add(new Pixer());
  hasTwo = false;
}

void draw(){
  //println(frameRate);
  background(255);
  ck.display();
  ck.checkMouse();
  if(hasTwo)
  {
    ck2.display();
    ck2.checkMouse();
  }
  for(Pixer pi: py){
    
    if(!pi.isDead){
      PVector force = ck.attract(pi);
      pi.applyForce(force);
      ck.meet(pi);
      if(hasTwo)
      {
        PVector force2 = ck2.attract(pi);
        pi.applyForce(force2);
        ck2.meet(pi);
      }
    }
    pi.update();
    pi.display();
  }
  
  for(Pixer pi: py){
    if(pi.fullyDead()){
      py.remove(pi);
      break;
    }
  }
}

void keyPressed(){
  if(key == ' '){
    py.add(new Pixer());
  }
  if(key == 'q'){
    isShowTail = !isShowTail;
    for(Pixer pi: py){
      pi.ppos = new ArrayList<PVector>();
    }
  }
  if(key == 'p' && ck.mass>10){
    py.add(new Pixer());
    ck.mass-=1;
    ck2.mass-=1;
  }
  if(key == 'o'){
    ck.mass = 50;
    ck2.mass = 50;
  }
  if(key == 'w'){
    hasTwo = !hasTwo;
  }
}