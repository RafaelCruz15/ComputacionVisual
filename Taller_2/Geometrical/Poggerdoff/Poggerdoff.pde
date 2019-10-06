// https://en.wikipedia.org/wiki/Poggendorff_illusion
// https://www.openprocessing.org/sketch/140480 

void setup(){
  size(400,600);
  strokeWeight(5);
}

int value = 150;
void draw(){
background(255);
if (mousePressed){
  line(50,20, 200 ,300);
  pushStyle();
    stroke(255,0,0);
    line(200,300,340,560);
  popStyle();
  pushStyle();
    stroke(0,0,255);
    line(230,300,370,560);
  popStyle();
  pushStyle();
    noStroke();
    fill(150,110);
    rect(150,20,100,540);
  popStyle();

}else {
  line(50,20, 200 ,300);
  pushStyle();
    stroke(255,0,0);
    line(200,300,340,560);
  popStyle();
  pushStyle();
    stroke(0,0,255);
    line(230,300,370,560);
  popStyle();
  pushStyle();
    noStroke();
    fill(150);
    rect(150,20,100,540);
  popStyle();
}

}
