class enemy {
  final int size=51;
  final int shotDelay=100;
  PVector pos;
  PVector speed;
  PImage img;
  int timer;
  int life;
  enemy(int l) {
    img=loadImage("space nemy.png");
    pos=new PVector(random(size/2, width-size/2), random(size/2, height/3));
    speed=new PVector(random(-5,5),random(-5,5));
    life=l;
  }
  enemy(int x, int y,int l) {
    pos=new PVector(x, y);
    img=loadImage("space nemy.png");
    life=l;
  }
  void show() {
    updateTimer();
    image(img, pos.x, pos.y, size, size);
  }
  private void updateTimer()
  {
    if (timer != 0 && timer!=shotDelay)
      timer++;
    else
      timer=0;
  }
  void move(){
    float r=random(0,1);
    if(r<0.4){
      speed.rotate(random(-0.5,0.5));
    }
    if(r>0.97){
      speed.rotate(random(-1,1));
    }
    pos.x+=speed.x;
    pos.y+=speed.y;
    
    if(offScreen()){
      pos.x-=speed.x;
      pos.y-=speed.y;
      speed.rotate(random(-2,2));
    }
  }
  boolean offScreen(){
    if( pos.x < (size/2) || pos.x > width-(size/2) || pos.y<(size/2) || pos.y > height-(size/2))
    return true;
    return false;
  }
}