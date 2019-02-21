class enemy{
 float x,y;
  PImage img;
  int life=3;
  enemy(){
    x=width/2;
    y=height/2;
    img=loadImage("sunset.png");
  }
  void drawEnemy(){
   image(img,x,y);
    // textSize(15);
  } 
}