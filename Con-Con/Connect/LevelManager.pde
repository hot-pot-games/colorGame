final int LEVEL_TOTAL = 1;

class LevelManager {
  Medium med;

  LevelManager(Medium pmed) {
    med = pmed;
  }

  void loadLevel(int num) {
    if (num>=LEVEL_TOTAL) 
    {
      println("ERROR: loadLevel()使用了过大的关卡号");
    }
    Table ct, st;
    ct = loadTable("level"+num+"_cell.csv");
    st = loadTable("level"+num+"_sys.csv");
    if (ct==null) 
    {
      println("ERROR: 关卡文件“levle"+num+"_cell.csv”没有找到");
      return;
    }
    if (st==null) 
    {
      println("ERROR: 关卡文件“levle"+num+"_cell.csv”没有找到");
      return;
    }

    int xc, yc;
    xc = ct.getRowCount();
    yc = ct.getColumnCount();


    Cell[][] cs;
    cs = new Cell[xc][];
    for (int m=0; m<xc; m++) {
      cs[m] = new Cell[yc];
      for (int n=0; n<yc; n++) {
        cs[m][n] = null;
      }
    }


    for (int i=0; i<xc; i++) 
    {
      TableRow clr = ct.getRow(i);
      for (int j=0; j<yc; j++) 
      {
        String[] str = clr.getString(j).split(":");
        int choice = parseInt(str[0]);

        if (choice==2) {
          float r, g, b;
          r = parseFloat(str[1]);
          g = parseFloat(str[2]);
          b = parseFloat(str[3]);
          Cell tc;
          tc = new Cell(j, i);
          cs[i][j] = tc;
          med.add(tc);
          tc.poison(new Color(r, g, b));
        } else if (choice==1) 
        {
          Cell tc;
          tc = new Cell(j, i);
          cs[i][j] = tc;
          med.add(tc);
        }
      }
    }

    for (TableRow tr : st.rows()) {
      String[] str = tr.getString(0).split(":");
      int choice = parseInt(str[0]);

      if (choice==1) 
      {
        int xn, yn;
        float r, g, b;
        xn = parseInt(str[1]);
        yn = parseInt(str[2]);
        r  = parseFloat(str[3]);
        g  = parseFloat(str[4]);
        b  = parseFloat(str[5]);

        if (cs[xn][yn]==null) {
          println("ERROR： levelx_sys.csv读取错误");
        } 
        else
        {
          cs[xn][yn].live(new ConChan(new Color(r, g, b)));
          StartCell sc = new StartCell(cs[xn][yn]);
          med.cells.remove(cs[xn][yn]);
          med.add(sc);
          cs[xn][yn] = sc;
        }
      } 
      else if (choice==2) 
      {
        int xn, yn;
        xn = parseInt(str[1]);
        yn = parseInt(str[2]);
        if (cs[xn][yn]==null) {
          println("ERROR： levelx_sys.csv读取错误");
        } 
        else
        {
          EndCell sc = new EndCell(cs[xn][yn]);
          med.cells.remove(cs[xn][yn]);
          med.add(sc);
          cs[xn][yn] = sc;
        }
      }
    }
    
    for (int m=0; m<xc; m++) {
      for (int n=0; n<yc; n++) {
        if(cs[m][n]==null){
          continue;
        }
        if(m>0){
          cs[m][n].makeFriends(UP_FRIEND,cs[m-1][n]);
        }
        
        if(m<xc-1){
          cs[m][n].makeFriends(DOWN_FRIEND,cs[m+1][n]);
        }
        
        if(n>0){
          cs[m][n].makeFriends(LEFT_FRIEND,cs[m][n-1]);
        }
        
        if(n<yc-1){
          cs[m][n].makeFriends(RIGHT_FRIEND,cs[m][n+1]);
        }
        
        
        //print((cs[m][n].nym==null)+" pos :"+cs[m][n].pos.x+" "+cs[m][n].pos.y);
        //if(cs[m][n].nym!=null){
        //  println(" nym pos :"+cs[m][n].nym.pos.x+" "+cs[m][n].nym.pos.y);
        //}
        //else{
        //  println();
        //}
      }
    }
    
  }
}

//levelxx_cell.csv说明
//0表示空白
//1表示安全格
//2表示有毒格（格式为2:0.2:0.2:0.2,）

//levelxx_sys.csv说明
//1表示有活菌的色滴（格式为1:0:0:0.3:0.5:0.5表示坐标以及颜色）
//2表示终点