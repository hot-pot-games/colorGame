class UIfactory{
  PFont pf;
  
  UIfactory(){
    pf   = createFont("Arial",40);
  }
  
  void addButton(float xx, float yy){
    uiButton nb = new uiButton(xx,yy);
    us.add(nb);
  }
  
  void addButton(float xx, float yy,function_type val){
    uiButton nb = new uiButton(xx,yy).link(val);
    us.add(nb);
  }
}