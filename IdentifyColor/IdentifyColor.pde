final int RUNNING = 2;
final int WIN = 3;

Panel panel;
int gameState;
int    timer;
int    maxTime;
int    temp;
String lv;
String time;
boolean pressSpace;

void setup()
{
  size(800, 900);
  colorMode(HSB, 360, 100, 100);
  gameState = RUNNING;
  panel = new Panel(100, 200, 600, color(0, 0, 0));
  lv = "Lv:" + panel.level;
  temp = 0;
  maxTime = 15*1000;
  timer = millis();
  time = "Time:" + (maxTime - (millis() - timer))/1000f;
  pressSpace = false;
}

void draw()
{
  background(150);
  //update
  if (millis() - timer > maxTime)
    gameState = GAME_OVER;

  //display
  panel.display();
  fill(color(360, 100, 100));
  textSize(30);
  lv = "Lv:" + panel.level;
  text(lv, 550, 120, 580, 150);
  time = "Time:" + (maxTime - (millis() - timer))/1000f;
  if(gameState == GAME_OVER){
    time = "Time:" + 0;
  }
  text(time, 150, 120, 220, 150);

  if (gameState == GAME_OVER)
  {
    timer = millis() - maxTime;
    panel.deleteCells();
    fill(color(360, 100, 100));
    textSize(100);
    textAlign(CENTER,CENTER);
    text("GAME OVER",400,500);
    textSize(20);
    textAlign(CENTER,CENTER);
    text("press v to restart",400,600);
    textAlign(LEFT);
  }
  
  if (gameState == WIN)
  {
    panel.deleteCells();
    fill(color(360, 100, 100));
    textSize(100);
    textAlign(CENTER,CENTER);
    text("YOU WIN",400,500);
    textSize(20);
    textAlign(CENTER,CENTER);
    text("press c to continue",400,600);
    textAlign(LEFT);
  }
}

void mousePressed()
{
  if (panel.clicked(mouseX, mouseY))
  {
    if(panel.level < 25)
      panel.updateLevel();
    else
      gameState = WIN;  
      
    if(panel.rowNumbers < 20)
      panel.updateRowNumber();
    if(panel.difficulty > 2)
      panel.updateDifficulty();
    panel.deleteCells();
    panel.initialize();
    timer = millis();
  } 
  else if (panel.isInside(mouseX, mouseY))
  {
    gameState = GAME_OVER;
    //println("wrong");
  }
}

void keyPressed()
{
  if(key == ' ' && !pressSpace)
  {
    pressSpace = !pressSpace;
    temp = millis() - timer;
    noLoop();
  }
  else if(key == ' ' && pressSpace)
  {
    pressSpace = !pressSpace;
    timer = millis() - temp;
    loop();
  }
  
  if(key == 'v' && gameState == GAME_OVER)
  {
    gameState = RUNNING;
    temp = 0;
    timer = millis();
    time = "Time:" + (maxTime - (millis() - timer))/1000f;
    pressSpace = false;
    panel.restart();
  }
}