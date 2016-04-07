class SmallDrop extends Drop{
  Drop target;
  SmallDrop(PVector ppos, float pmass,color pcol,Drop tt)
  {
    super(ppos,pmass);
    super.col = pcol;
    this.target = tt;
  }
  
  void moveToTarget()
  {
    
  }
  
}