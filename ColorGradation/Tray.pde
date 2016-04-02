class Tray{
  PVector pos;
  PVector size;
  PVector gridSize;
  ArrayList<PVector>tps;
  
  float marginRate;
  
  Tray(PVector psize, int num, float mar){
    this.tps  = new ArrayList<PVector>();
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
      tps.add(new PVector(pos.x+sx+i*ix,pos.y+sy+i*iy));
      
    }
    
  }
  
  PVector get(int i){
    return tps.get(i).copy();
  }
  
  void display(){
    stroke(255);
    strokeWeight(2);
    noFill();
    rect(pos.x,pos.y,size.x,size.y);
    for(PVector p: tps){
      fill(50);
      noStroke();
      rect(p.x,p.y,gridSize.x,gridSize.y,5);
    }
  }

}