// https://www.illusionsindex.org/i/kanizsa-triangle

void setup(){
  background(255);
  size(600, 600);
}

void draw(){  
  
  fill(0,0,0);
  circle(300, 60, 100);
  circle(80, 420, 100);
  circle(520, 420, 100);
  
  fill(255,255,255);
  strokeWeight(8);
  triangle(80, 170, 300, 540, 520, 170);  
  
  if(!mousePressed){
    noStroke();
    triangle(80, 420, 300, 60, 520, 420);
  } else {
    fill(0,0,0);
    triangle(80, 420, 300, 60, 520, 420);
  }
  
}
