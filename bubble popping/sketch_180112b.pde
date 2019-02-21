int n=(int)random(1,20);
float []x=new float[n];
float []y=new float[n];
float []Xspeed=new float[n];
float []Yspeed=new float[n];
int points=0;
int remain=n;
void setup(){
  size(700,700);
  for(int i=0;i<x.length;i++){
    x[i]=random(16,width-16);
    y[i]=random(16,width-16);
    Xspeed[i]=random(1,8);
    Yspeed[i]=random(1,8);
  }
}
void draw(){
 background(0);
 println(millis());
 fill(0,0,255);
 stroke(255,0,0);
 strokeWeight(2);
 for(int i=0;i<x.length;i++){
   ellipse(x[i],y[i],30,30);
   x[i]=x[i]+Xspeed[i];
   y[i]=y[i]+Yspeed[i];
   if(x[i]>width-15 | x[i]<15){
     Xspeed[i]=-Xspeed[i];
   }
   if(y[i]>height-15 | y[i]<15){
     Yspeed[i]=-Yspeed[i];
   }
 }
 textSize(32);
 fill(255);
 text("Points: " +points ,10,25);
 if(remain==0){
   text("GAME OVER" ,250,250);
 }
}
void mousePressed(){
  for(int i=x.length-1;i>-1;i--){
    float dist=sqrt((x[i]-mouseX)*(x[i]-mouseX)+(y[i]-mouseY)*(y[i]-mouseY));
    if(dist<=15){
      x[i]=-100;
      y[i]=-100;
      int speedBonus=abs((int)Xspeed[i]);
      remain--;
      points+= speedBonus +10;
      break;
    }
  }
}
