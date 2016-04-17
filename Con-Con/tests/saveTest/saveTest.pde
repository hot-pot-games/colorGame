Table tb;

void setup(){
  tb = loadTable("level0.csv");
  int xx,yy;
  xx = 20;
  yy = 20;
  for(TableRow tbr: tb.rows()){
    int num;
    for(int i=0; i<tbr.getColumnCount(); i++){
      String[] str = tbr.getString(i).split(":");
      int choice = parseInt(str[0]);
      //print(choice+",");
      
      if(choice==4||choice==5){
        float r,g,b;
        r = parseFloat(str[1])*255;
        g = parseFloat(str[2])*255;
        b = parseFloat(str[3])*255;
        fill(r,g,b);
        rect(xx,yy,10,10);
        //println(xx+" "+yy);
      }
      else if(choice!=0){
        fill(255);
        rect(xx,yy,10,10);
        //println(xx+" "+yy);
      }
      xx+=10;
    }
    yy+=10;
    xx = 20;
    //println("\n");
  }
}

void draw(){

}


//0表示空白
//1表示安全格
//2表示终点（目前不考虑多种细菌）
//3表示奖励点/特殊事件点（目前当做空白格）
//4表示有毒格，毒格式为 4:0.2:0.2:0.2,
//5表示有活菌格，颜色格式同毒格