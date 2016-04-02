class Slot extends Draginable{
  PVector size;
  
  int       index;
  //MoveBoard livingBoard;
  
  Slot(PVector ppos, PVector psize, int i){
    super.pos = ppos.copy();
    this.size = psize.copy();
    this.index = i;
  }
  
  //void livein(MoveBoard li){
  //  this.livingBoard = li;
  //}
  
  //void dock(){
  //  this.livingBoard.pos = pos.copy();
  //}
  
  boolean isIn(int mx, int my){
    return false;
  }
  
  void display(){
    fill(50);
    noStroke();
    rect(pos.x,pos.y,size.x,size.y,5);
  }
 
  
}



class Tray{
  PVector pos;
  PVector size;
  PVector gridSize;
  ArrayList<Slot>tps;
  
  float marginRate;
  
  Tray(PVector psize, int num, float mar){
    this.tps  = new ArrayList<Slot>();
    this.marginRate = mar;
    
    float len,hei;
    len = psize.x*(num+(num+4)*marginRate);
    hei = psize.y*(1+marginRate*4);
    pos  = new PVector(width/2f-len/2f,height/2f-hei/2f);
    size = new PVector(len,hei);
    gridSize = psize.copy();
    
    float sx,sy,ix,iy;
    sx = gridSize.x*1.5*marginRate;
    sy = gridSize.y*2*marginRate;
    ix = gridSize.x*(marginRate+1);
    iy = 0;
    for(int i=0; i<num; i++){
      if(i==1||i==num-1)
      {
        sx += gridSize.x*marginRate;
      }
      tps.add(new Slot(new PVector(pos.x+sx+i*ix,pos.y+sy+i*iy),gridSize.copy(),i));
      
    }
    
  }
  
  PVector get(int i){
    return tps.get(i).pos;
  }
  
  Slot getDock(int i){
    return tps.get(i);
  }
  
  //void live(int i, MoveBoard mb){
  //  tps.get(i).livein(mb);
  //}
  
  //void exchange(int a, int b){
  //  MoveBoard temp;
  //  temp = tps.get(a).livingBoard;
  //  tps.get(a).livein(tps.get(b).livingBoard);
  //  tps.get(b).livein(temp);
  //}
  
  //void dock(){
  //  for(Slot s: tps){
  //    s.dock();
  //  }
  //}
  
  //void dock(int i){
  //  tps.get(i).dock();
  //}
  
  
  void display(){
    stroke(255);
    strokeWeight(2);
    noFill();
    rect(pos.x,pos.y,size.x,size.y);
    for(Slot p: tps){
      p.display();
    }
  }

}