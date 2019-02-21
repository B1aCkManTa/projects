
class player{
  float x,y;
  PImage spriteSheet;
  PImage temp;
  PImage [][] movement;
  boolean inMotion,hasSprayer;
  int currDirection;
  float currFrame;
  final int left=0,right=1;
  
  player(){
    currFrame =0;
    currDirection = 1;
    inMotion=false;
    hasSprayer=false;
    x=width/2;
    y=height/2;
    setupSprites();
  }
  
  void setupSprites(){
    movement=new PImage[2][4];
    spriteSheet = loadImage("mario2.png");
    movement[0][3]=spriteSheet.get(-1,0,30,35);
    movement[0][2]=spriteSheet.get(24,0,29,35);
    movement[0][1]=spriteSheet.get(49,0,30,35);
    movement[0][0]=spriteSheet.get(78,0,30,35);
    movement[1][0]=spriteSheet.get(107,0,30,35);
    movement[1][1]=spriteSheet.get(135,0,30,35);
    movement[1][2]=spriteSheet.get(160,0,30,35);
    movement[1][3]=spriteSheet.get(185,0,30,35);
  }
  void drawPlayer(){
    if(inMotion)
    image(movement[currDirection][1+int(currFrame)],x,y);
    else
    image(movement[currDirection][0],x,y);
     textSize(15);

    
   // image(spriteSheet,0,0);
//    image(movement[0][0],0,0);
//    image(movement[0][1],0,50);
//    image(movement[0][2],0,100);
//    image(movement[0][3],0,150);
//    image(movement[1][0],0,200);
//    image(movement[1][1],0,250);
//    image(movement[1][2],0,300);
//    image(movement[1][3],0,350);
  }
  
  void updatePlayer(int xDelta,int yDelta){
    currFrame= (currFrame + 0.1)%2;//the 0.1 is to control the speed of the animation every frame, %2 is to make it not exceed the array of frames
    inMotion=true;
    if(xDelta==0 & yDelta==0)
    inMotion=false;
    else if(xDelta<0)
    currDirection=left;
    else if(xDelta>0d)
    currDirection=right;
    x=x+xDelta;
    y=y+yDelta;
    if(offScreen(x,y)){
      x=x-xDelta;
      y=y-yDelta;
    }
  }
  
  boolean offScreen(float x,float y){
    if(x<0 || x>width-30 || y<0 || y>height -35)
    return true;
    return false;
  }
  
  void foundSpray(float Sx,float Sy){
    float d=sqrt((x-Sx)*(x-Sx)+(y-Sy)*(y-Sy));
    if(d<=5){
      hasSprayer=true;
    }
  }
  float getx(){
    return x;
  }
  float gety(){
    return y;
  }
}