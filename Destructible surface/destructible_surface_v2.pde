static ArrayList<PVector>particles;
static ArrayList<PVector>shots;
static ArrayList<PVector>hits;
static int rOfColl=25;//radius of collision
static PVector mouse=new PVector(0,0);
boolean pushed=false;

void setup(){
  size(1500,500);
  particles=new ArrayList();
  for(int i=0;i<width;i+=3){
    particles.add(new PVector(i,300));
  }
  shots=new ArrayList();
  hits=new ArrayList();
}

void draw(){
  background(255);
  for(int i=1;i<particles.size();i++){
    PVector start=particles.get(i-1);
   PVector end=particles.get(i);
    line(start.x,start.y,end.x,end.y);
  }
//  for(int i=0;i<particles.size();i++){
//    ellipse(particles.get(i).x,particles.get(i).y,0.5,0.5);
//  }
  for(int i=0;i<shots.size();i++){
    ellipse(shots.get(i).x,shots.get(i).y,rOfColl,rOfColl);
  }
  fill(255,0,0);
  for(int i=0;i<hits.size();i++){
    ellipse(hits.get(i).x,hits.get(i).y,5,5);
  }
  updateShots();
  if(pushed)
  fillGaps();
}

void updateShots(){
  for(int i=0;i<shots.size();i++){
    PVector tmp=new PVector(shots.get(i).x,shots.get(i).y+1);
    shots.remove(i);
    shots.add(i,tmp);
    push(tmp,i);
  }
}

boolean push(PVector shot,int k){
  for(int i=0;i<particles.size();i++){
    PVector point=particles.get(i);
    float dist=dist(shot.x,shot.y,point.x,point.y);    
    if(dist<=rOfColl/4){
       for(int j=0;j<particles.size();j++){
        PVector point2=particles.get(j);
        float dist2=dist(shot.x,shot.y,point2.x,point2.y);
        if(dist2<=rOfColl){
          hits.add(new PVector(shot.x,shot.y));
          pushed=true;
          particles.remove(j);
          PVector direc=new PVector(point2.x-shot.x,point2.y-shot.y);
          particles.add(j,movePoint(point2,direc,dist2));
        }
      }
      shots.remove(k);
      cleanUp();
      break;

    }
  }
  if(pushed){
  return true;
  }
  return false;
}

PVector movePoint(PVector p,PVector direc,float dist){
  float factor=(rOfColl-dist)/dist;
  PVector tmp=new PVector(int(factor*direc.x),int(factor*direc.y));
  return new PVector(p.x+tmp.x,p.y+tmp.y);
}

void mouseClicked(){
  shots.add(new PVector(mouseX,mouseY));
  mouse=new PVector(mouseX,mouseY);
}

void fillGaps(){
  int length=particles.size();
  for(int i=0;i<length-1;i++){
    PVector a = particles.get(i);
    PVector b = particles.get(i+1);
    if(dist(a.x,a.y,b.x,b.y) >= rOfColl/2){
      PVector newP=new PVector((a.x+b.x)/2,(a.y+b.y)/2);
      particles.add(i+1,newP); 
    }
  }
  pushed=false;
}

void cleanUp(){
  for(int i=0;i<particles.size();i++){
    for(int j=i+1;j<particles.size();){
      if(particles.get(j).x==particles.get(i).x && particles.get(j).y==particles.get(i).y){
        for(int k=i+1;k<=j;k++)
          particles.remove(k);
      }
      else{
        j++;
      }
    }
  }
}
