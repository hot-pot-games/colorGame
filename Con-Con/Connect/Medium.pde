final float MAX_SCALE = 1.5f;
final float MIN_SCALE = 0.2f;
public enum color_tool{
  DROP_TOOL,CUT_TOOL;
}



class Medium {
  PVector pos;
  Color[] colList;
  int     seleColorIndex;
  color_tool     seleTool;
  
  float   cellSize;
  float   scale;
  ArrayList<Cell>cells;

  Medium(PVector ppos, float pceSize, float pscale) {
    this.pos      = ppos.copy();
    this.cellSize = pceSize;
    this.scale    = pscale;
    this.cells    = new ArrayList<Cell>();
    this.colList  = new Color[3];
    this.colList[0]  = new Color(0.2,0.4,0.8);
    this.colList[1]  = new Color(0.4,0.8,0.2);
    this.colList[2]  = new Color(0.8,0.2,0.4);
    this.seleColorIndex = 0;
    this.seleTool       = color_tool.DROP_TOOL;
  }


  void add(Cell cl) {
    cells.add(cl);
  }

  void limitPos() {
    float lit = 2*1024*scale*cellSize/100;

    if (pos.x>lit-50) {
      pos.x = lit-50;
    }

    if (pos.x<width-lit) {
      pos.x = width-lit;
    }

    if (pos.y>lit+200) {
      pos.y = lit+200;
    }

    if (pos.y<height-lit-300) {
      pos.y = height-lit-300;
    }
  }

  void drag() {
    pos.x+= mouseX-pmouseX;
    pos.y+= mouseY-pmouseY;
    limitPos();
  }

  void scaleUp() {
    if (scale>MAX_SCALE) {
      return;
    }
    float baseX = pos.x-mouseX;
    float baseY = pos.y-mouseY;
    baseX*=1.1;
    baseY*=1.1;
    scale*=1.1;
    pos.x = mouseX+baseX;
    pos.y = mouseY+baseY;
    limitPos();
  }

  void scaleDown() {
    if (scale<MIN_SCALE) {
      return;
    }
    float baseX = pos.x-mouseX;
    float baseY = pos.y-mouseY;
    baseX*=0.9;
    baseY*=0.9;
    scale*=0.9;
    pos.x = mouseX+baseX;
    pos.y = mouseY+baseY;
    limitPos();
  }
  
  void reculColor()
  {
    class ListPool{
      Cell            baseCell;
      ArrayList<Cell> clList;
      ArrayList<Cell> clPool;
      boolean         hasFail;
      
      ListPool(Cell cl){
        baseCell = cl;
        
        clList = new ArrayList<Cell>();
        clList.add(cl);
        
        clPool = cl.getLinkedFriends();
        
        hasFail = false;
      }
      
      boolean empty(){
        if(clPool.size()==0){
          return true;
        }
        else{
          return false;
        }
      }
      
      void addPoolToList(ArrayList<ListPool> lpp){
        ArrayList<Cell> np;
        np = new ArrayList<Cell>();
        
        for(Cell cl: clPool){
          //对于池中每一个Cell，确定是否在表中存在
          boolean has;
          
          has = false;
          for(Cell cll: clList){
            if(cll == cl){
              //如有，则跳过这一变量
              has = true;
              break;
            }
          }
          
          if(has){
            continue;
          }
          
          //如果表中没有这个Cell，增加他进表，增加他的池进入本体的新池
          clList.add(cl);
          for(int i=0; i<lpp.size(); i++){
            if(!lpp.get(i).hasFail && lpp.get(i).baseCell == cl){
              lpp.get(i).hasFail = true;
              break;
            }
          }
          
          for(Cell ncl: cl.getLinkedFriends()){
            np.add(ncl);
          }
        }
        //池已走过一遍
        clPool = np;
      }
    }
    
    ArrayList<ListPool>lps;
    lps = new ArrayList<ListPool>();
    for(Cell cl: cells){
      if(cl.hasC){
        lps.add(new ListPool(cl));
      }
    }
    
    
    for(ListPool lp: lps){
      if(lp.hasFail){
        continue;
      }
      
      while(!lp.empty()){
        lp.addPoolToList(lps);
        //println("running Loop");
      }
      
      //混上所有颜色
      float r,g,b;
      r = 0; 
      g = 0; 
      b = 0;
      int nn;
      nn = 0;
      
      for(Cell c: lp.clList){
        r += c.cc.col.r;
        g += c.cc.col.g;
        b += c.cc.col.b;
        
        nn++;
      }
      
      r/=nn;
      g/=nn;
      b/=nn;
      
      Color nc;
      
      nc = new Color(r,g,b);
      
      for(Cell c: lp.clList){
        c.cc.col = nc.copy();
      }
      
    }  
  
  }

  void killNotLive(){
    for(Cell cl: cells){
      if(cl.hasC && cl.isPoison){
        cl.poiKill();
      }
    }    
  }
    
  //void printM(){
  //  float ss = cellSize*scale*1;
  //  println("mx:  "+(mouseX-pos.x)/ss+" my:  "+(mouseY-pos.y)/ss);
  //}
  
  void addCC(Cell cl){
    cl.live(new ConChan(colList[seleColorIndex].copy()));
  }
  
  void touch(float mx, float my){
    float ss = cellSize*scale*1;
    float xc,yc;
    xc = (mx-pos.x)/ss;
    yc = (my-pos.y)/ss;
    //println(xc+" "+yc);
    for(Cell cl:cells){
      float tx,ty;
      tx = cl.pos.x;
      ty = cl.pos.y;
      if(tx>xc-1&&tx<xc && ty>yc-1&&ty<yc)
      {
        if(seleTool == color_tool.DROP_TOOL)
        {
          if(cl.cc==null)
          {
            addCC(cl);
            reculColor();
            killNotLive();
          }
        }
        
        if(seleTool == color_tool.CUT_TOOL)
        {
          if(cl.cc!=null){
            cl.wipe();
          }
        }
        
        break;
      }
    }
  }
  

  void display() {
    pushMatrix();
    translate(pos.x, pos.y);
    scale(scale);
    scale(cellSize);
    //imageMode(CENTER);
    //image(backP, 0, 0, 100, 100);
    for (Cell cl : cells) {
      cl.display();
    }
    popMatrix();
  }
}


class Cell {
  Color col;
  PVector pos;

  float strokeSize;
  float edgeSize;

  int cellState;

  boolean isPoison;
  boolean hasC;
  ConChan cc;
  Cell    nxm, pxm, nym, pym;

  Cell(float xx, float yy) {
    this.pos  = new PVector(xx, yy);
    this.strokeSize = 0.04f;
    this.edgeSize   = 1f;
    this.col        = new Color(1, 1, 1);
    this.isPoison   = false;
    this.hasC       = false;
    this.nxm        = null;
    this.pxm        = null;
    this.nym        = null;
    this.pym        = null;
  }
  
  ArrayList<Cell> getLinkedFriends(){
    ArrayList<Cell> cll;
    cll = new ArrayList<Cell>();
   if(nxm!=null && nxm.hasC){
     cll.add(nxm);
   }
   
   if(pxm!=null && pxm.hasC){
     cll.add(pxm);
   }
   
   if(nym!=null && nym.hasC){
     cll.add(nym);
   }
   
   if(pym!=null && pym.hasC){
     cll.add(pym);
   }
    
    return cll;
  }

  void makeFriends(int index, Cell friend) {
    switch(index) {
    case LEFT_FRIEND: 
      nxm = friend;
      break;
    case RIGHT_FRIEND: 
      pxm = friend;
      break;
    case UP_FRIEND: 
      nym = friend;
      break;
    case DOWN_FRIEND: 
      pym = friend;
      break;
    }
  }

  void copyFrom(Cell that) {
    this.pos        = that.pos.copy();
    this.strokeSize = that.strokeSize;
    this.edgeSize   = that.edgeSize;
    this.col        = that.col.copy();
    this.isPoison   = that.isPoison;
    this.hasC       = that.hasC;
    this.cc         = that.cc;
  }

  void poiKill(){
    float rate;
    
    PVector v1,v2;
    v1 = new PVector(col.r,col.g,col.b);
    v2 = new PVector(cc.col.r,cc.col.g,cc.col.b);
    
    rate = v1.dist(v2);
    
    if(rate>0.3){
      wipe();  
    }
    println(rate);
    
  }

  void poison(Color pcl) {
    this.col      = pcl.copy();
    this.isPoison = true;
  }

  void live(ConChan ch) {
    this.cc   = ch;
    this.hasC = true;
  }

  void wipe() {
    this.cc   = null;
    this.hasC = false;
  }
  
  

  void drawBack() {
    strokeWeight(0);
    stroke(0);
    fill(col.col, 120);
    rect(pos.x, pos.y, edgeSize, edgeSize);
  }

  void drawCC() {
    if (hasC)
    {
      pushMatrix();
      translate(pos.x+0.5f, pos.y+0.5f);
      cc.display();
      popMatrix();
    }

  }
  
  void drawBoarder(){
    pushMatrix();
    translate(pos.x+0.5f, pos.y+0.5f);
    strokeWeight(strokeSize);
    stroke(0);
    if (nxm==null) 
    {
      line(-0.5, -0.5, -0.5, 0.5);
    }
    if (pxm==null) 
    {
      line(0.5, -0.5, 0.5, 0.5);
    }
    if (nym==null) 
    {
      line(-0.5, -0.5, 0.5, -0.5);
    }
    if (pym==null) 
    {
      line(-0.5, 0.5, 0.5, 0.5);
    }
    popMatrix();
  }

  void display() {
    drawBack();
    drawCC();
    drawBoarder();
  }
}


class StartCell extends Cell
{
  StartCell(Cell that) {
    super(0, 0);
    copyFrom(that);
  }

  void drawBack() {
    strokeWeight(0);
    stroke(0);
    fill(col.col, 120);
    rect(pos.x, pos.y, edgeSize, edgeSize);
    imageMode(CORNERS);
    image(startP, pos.x, pos.y, pos.x+1, pos.y+1);
  }
}


class EndCell extends Cell
{
  EndCell(Cell that) {
    super(0, 0);
    copyFrom(that);
  }

  void drawBack() {
    strokeWeight(0);
    stroke(0);
    fill(col.col, 120);
    rect(pos.x, pos.y, edgeSize, edgeSize);
    imageMode(CORNERS);
    image(endP, pos.x, pos.y, pos.x+1, pos.y+1);
  }
}