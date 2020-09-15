//Intro to IM Assignment 1 - Kyrie Park

void setup() {
//basic background setups for the pallete
  frameRate(1);
  size(600, 600);
  background(255);
}

void draw() {
//face
  fill(255, 218, 185);
  ellipse(300, 250, 360, 400);
  
//eyebrows
  strokeWeight(7);
  arc(200, 180, 90, 30, radians(200), radians(340));
  arc(400, 180, 90, 30, radians(200), radians(340));

//eyes
  fill(250, 250, 250);
  ellipse(200, 200, 78, 40);
  ellipse(400, 200, 78, 40);

//iris(part of eye)
  fill(130, 82, 45);
  ellipse(200, 200, 50, 50);
  ellipse(400, 200, 50, 50);

//pupil
  fill(0, 0, 0);
  ellipse(200, 200, 30, 30);
  ellipse(400, 200, 30, 30);

//nose
  fill(230, 190, 160);
  noStroke();
  ellipse(300, 250, 50, 75);
  ellipse(290, 275, 30, 30);
  ellipse(310, 275, 30, 30);

//mouth
  stroke(0);
  fill(255,255,255);
  arc(300,300,140,60,radians(0),radians(180));

















  //for (int i = 0; i < height; i += 5) {
  //  if (i<500) {
  //    noFill();
  //    arc(random(170, 400), random(50, 100), 100, 130, radians(0), radians(90));
  //    arc(random(200, 430), random(50, 100), 100, 130, radians(90), radians(180));
  //    i = i + 1;
  //  } else {
  //    stop();
  //  }
  //}
}



------------------------------------------------------




