// https://www.illusionsindex.org/ir/necker-cube
// https://htmlcolorcodes.com/es/

void setup(){
  background(255);
  size(600, 600);      
}


void draw(){  
  stroke(161,26,203);
  strokeWeight(5);
  line(242, 225, 492, 225);
  line(242, 475, 492, 475);
  line(242, 225, 242, 475);
  line(492, 225, 492, 475);
  
  stroke(223,179,236);
  strokeWeight(5);
  line(117, 100, 367, 100);
  line(117, 350, 367, 350);
  line(117, 100, 117, 350);
  line(367, 100, 367, 350);
  
  stroke(161,26,203);
  strokeWeight(5);
  line(117, 100, 242, 225);
  line(367, 100, 492, 225);
  line(117, 350, 242, 475);
  line(367, 350, 492, 475);
}
