import de.looksgood.ani.*;
aniManager       anim;
aniAvatarFactory anf;

void setup(){
  size(800,600);
  Ani.init(this);
  
  anim = aniManager.getInstance();
  anf = new aniAvatarFactory(anim);
  
  anf.addColorAvatar(400,300);
  anf.addColorAvatar(0,0);
}

void draw(){
  background(0);
  anim.display();
}

void keyPressed(){
  aniState n = anim.get(1).getState().copy();
  anim.get(0).doAni(n,1);
}