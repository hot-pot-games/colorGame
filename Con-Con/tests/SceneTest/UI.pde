class uic{
  PFont sysFont;
  ArrayList<uiButton>uis;
  
  boolean  hasSele;
  uiButton seleB;
  
  float default_w;
  float default_h;
  
  uic(){
    sysFont   = createFont("Arial",40);
    uis       = new ArrayList<uiButton>();
    default_w = 80;
    default_h = 30;
    hasSele   = false;
    seleB     = null;
  }
  
 
  void addButton(float xx, float yy, float ww, float hh){
    uis.add(new uiButton(xx,yy,ww,hh));
  }
  
  void addButton(float xx, float yy, String str, int val){
    uis.add(new uiButton(xx,yy,default_w,default_h,str).link(val));
  }
  
  void addButton(float xx, float yy, int val){
    uis.add(new uiButton(xx,yy,default_w,default_h).link(val));
  }
  
  uiButton getHoverButton(float mx, float my){
    uiButton u = null;
    for(uiButton uib: uis){
      if(uib.isIn(mx,my)){
        
        u = uib;
        uib.isHover = true;
      }
      else{
        uib.isHover = false;
      }
    }
    return u;
  }
  
  
  void checkHover(float mx, float my){
    uiButton uib = getHoverButton(mx,my);
    if(uib!=null){
      seleB   = uib;
      hasSele = true;
    }
    else{
      seleB   = null;
      hasSele = false;
    }
  }
  
  void checkPress(float mx, float my){
    checkHover(mx,my);
    if(hasSele){
      seleB.event();
    }
  }
  
  void display(){
    for(uiButton uib: uis){
      if(hasSele && uib == seleB){
        continue;
      }
      uib.display();
    }
    if(hasSele){
      seleB.display();
    }
  }
}

class uiButton{
  PVector pos;
  PVector size;
  String  str;
  boolean isHover;
  int     value;
  
  uiButton(PVector ppos, PVector psize, String pstr){
    pos     = ppos.copy();
    size    = psize.copy();
    str     = pstr;
    isHover = false;
    value   = EVENT_NONE;
  }
  
  uiButton(float xx, float yy, float ww, float hh,String pstr){
    pos  = new PVector(xx,yy);
    size = new PVector(ww,hh);
    str  = pstr;
    value   = EVENT_NONE;
  }
  
  uiButton(float xx, float yy, float ww, float hh){
    pos  = new PVector(xx,yy);
    size = new PVector(ww,hh);
    str  = "butt";
    value   = EVENT_NONE;
  }
  
  uiButton link(int val){
    value = val;
    return this;
  }
  
  boolean isIn(float mx, float my){
    if(mx>pos.x && mx<pos.x+size.x && my>pos.y && my<pos.y+size.y){
      return true;
    }
    else{
      return false;
    }
  }
  
  void display(){
    pushMatrix();
    if(!isHover)
    {
      fill(255);
    }
    else
    {
      fill(100);
    }
    noStroke();
    translate(pos.x,pos.y);
    rect(0,0,size.x,size.y);
    fill(0);
    textFont(ic.sysFont,24);
    textAlign(CENTER);
    text(str,size.x/2,size.y/1.2);
    popMatrix();
  }
  
  void event(){
    doEvent(value);
  }
}