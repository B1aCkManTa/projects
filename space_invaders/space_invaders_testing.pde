int speed=3;
boolean[]keys=new boolean[128];
ArrayList<bullet> bullets=new ArrayList<bullet>();
player p;
PImage backG;
int BTimeOut=0;
int Btime=15;

void setup(){
  p=new player();
  size(700,700);
  frameRate(60);
  backG=loadImage("chicken invaders 5.jpg");
}

void draw(){
  image(backG,0,0);
  fill(255,0,0);
  BTimeOut--;
  move();
  p.drawPlayer();
  drawBullets();
}

void move(){
  int xDelta=0;
  int yDelta=0;
  if(keys['a'])//a left
  xDelta-=speed;
  if(keys['d'])//d right
  xDelta+=speed;
  if(keys['w'])//w up
  yDelta-=speed;
  if(keys['s'])//s down
  yDelta+=speed;
  if(keys[' '] && BTimeOut<=0)
  fire();
  p.updatePlayer(xDelta,yDelta);
}

void keyPressed(){
  if(key=='a' || key=='d' || key=='w' || key=='s' ||key==' ')
  keys[key]=true;
}

void keyReleased(){
  if(key=='a' || key=='d' || key=='w' || key=='s' ||key==' ')
  keys[key]=false;
}

void fire(){
  bullets.add(new bullet(p.x+12,p.y));
  BTimeOut=Btime;
}

void drawBullets(){
 for(int i=0;i<bullets.size();){
   bullets.get(i).drawBullet();
   bullets.get(i).moveBullet();
   if(bullets.get(i).y>=0){
     i++;
   }
   else{
     bullets.remove(i);
   }
 }
}