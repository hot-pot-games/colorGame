class aniState
{
  PVector pos;
  PVector size;
  float rad;
  color tintColor;
  
  aniState(PVector po, PVector sl, float ra, color tint){
    this.pos       = po.copy();
    this.size      = sl.copy();
    this.rad       = ra;
    this.tintColor = tint;
  }
  
  aniState copy(){
    return new aniState(this.pos,this.size,this.rad,this.tintColor);
  }
  
  void doAni(aniState nst, float sec){
    Ani.to(this.pos, sec, "x", nst.pos.x);
    Ani.to(this.pos, sec, "y", nst.pos.y);
    Ani.to(this.size, sec, "x", nst.size.x);
    Ani.to(this.size, sec, "y", nst.size.y);
    Ani.to(this,sec,"rad",nst.rad);
    Ani.to(this,sec,"tintColor",nst.tintColor);
  }
}


class aniAvatarImage implements Aniable
{
  aniState state;
  PImage texture;
  
  aniAvatarImage(PImage im, aniState st){
    this.state   = st;
    this.texture = im;
  }
  
  void doAni(aniState nst, float sec){
    state.doAni(nst,sec);
  }
  
  aniState getState(){
    return state;
  }
  
  void setState(aniState nst){
    state = nst.copy();
  }
  
  void draw(){
    pushMatrix();
    translate(state.pos.x+state.size.x/2,state.pos.y+state.size.y/2);
    rotate(state.rad);
    translate(-state.size.x/2,-state.size.y/2);
    tint(state.tintColor);
    image(texture,0,0,state.size.x,state.size.y);
    noTint();
    popMatrix();
  }
}


class aniAvatarColor implements Aniable
{
  aniState state;
  color    col;
  
  aniAvatarColor(aniState st, color pcol){
    this.state   = st;
    this.col     = pcol;
  }
  
   void doAni(aniState nst, float sec){
    state.doAni(nst,sec);
  }
  
  aniState getState(){
    return state;
  }
  
  void setState(aniState nst){
    state = nst.copy();
  }
  
  void draw(){
    pushMatrix();
    translate(state.pos.x+state.size.x/2,state.pos.y+state.size.y/2);
    rotate(state.rad);
    translate(-state.size.x/2,-state.size.y/2);
    tint(state.tintColor);
    fill(col);
    rect(0,0,state.size.x,state.size.y);
    noTint();
    popMatrix();
  }
}



class aniAvatarFactory{
    aniManager anm;
    
    //常量
    final color default_color = color(255);
    final float default_sizex = 80f; 
    final float default_sizey = 30f; 
    final float default_rad   = 0f;
    
    aniAvatarFactory(aniManager panm){
      this.anm = panm;
    }
    
    void addColorAvatar(float xx, float yy){
      PVector pp,ps;
      pp = new PVector(xx,yy);
      ps = new PVector(default_sizex,default_sizey);
      
      aniState default_state = new aniState(pp,ps,default_rad,default_color);
      Aniable ab = new aniAvatarColor(default_state,default_color);
      anm.add(ab);
    }

}