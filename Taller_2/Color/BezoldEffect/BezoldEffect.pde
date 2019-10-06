//https://en.wikipedia.org/wiki/Bezold_effect
//Tomado de: https://www.openprocessing.org/sketch/478895

void setup(){
  size(800,600);
}

void draw(){
if (mousePressed){
  background(255,0,0);

}else{
  noStroke();
  fill(255,255,255);
  rect(0,0,width/2,width);
  fill(0,0,0);
  rect(width/2,0,width/2,width);
    for(int i=9;i<=height;i=i+20){
    strokeWeight(9);
    stroke(255,0,0);
    line(0,i,width,i);
  }
}
}
