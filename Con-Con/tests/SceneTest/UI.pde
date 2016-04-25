class uiButton{
  PVector pos;
  PVector size;
  
  uiButton(){
    
  }
  
  boolean checkIn(float mx, float my){
    if(mx>pos.x && mx<pos.x+size.x && my>pos.y && my<pos.y+size.y){
      return true;
    }
    else{
      return false;
    }
  }
  
  void display(){
    
  }
  
}

class uiSet{
  void addButton(float xx, float yy){
  
  }

}