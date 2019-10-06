//https://en.wikipedia.org/wiki/Chubb_illusion
// http://mentalfloss.com/article/54448/5-color-illusions-and-why-they-work
//https://processing.org/reference/mouseClicked_.html


void setup(){
  size(300,150);
}
int value1=0;
int value2 = 255;
void draw(){
  noStroke();
  fill(value1);
  rect(((width/4)-(100/2)),(height/2)-(100/2), 100, 100);
  
  fill(-7684124);
  rect(((width/4)-(100/2))+25,(height/2)-(100/2)+25,50,50,7);

  fill(value2);
  rect(((3*width/4)-(100/2)), (height/2)-(100/2), 100, 100);

  fill(-7684124);
  rect(((3*width/4)-(100/2))+25,(height/2)-(100/2)+25,50,50,7);
}

void mouseClicked() {
  if (value1 == 0 && value2==255) {
    value1 = -7684124;
    value2 = -7684124;
  } else {
    value1 = 0;
    value2=255;
  }
}
