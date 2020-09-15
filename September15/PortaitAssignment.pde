//Intro to IM Assignment 1 - Kyrie Park

void setup() {
  //basic setup for background
  size(600, 600);
  background(255, 255, 153);
}

void draw() {
  stroke(1);
  //neck
  fill(230, 190, 160);
  rect(250, 400, 100, 50);

  //face
  fill(255, 218, 185);
  ellipse(300, 230, 330, 370);

  //eyebrow
  strokeWeight(7);
  arc(220, 180, 90, 30, radians(200), radians(340));
  arc(380, 180, 90, 30, radians(200), radians(340));

  //eyes
  noStroke();
  strokeWeight(1);
  fill(250, 250, 250);
  ellipse(220, 200, 78, 40);
  ellipse(380, 200, 78, 40);

  //iris
  fill(130, 82, 45);
  ellipse(220, 200, 35, 35);
  ellipse(380, 200, 35, 35);

  //pupil
  fill(0, 0, 0);
  ellipse(220, 200, 17, 17);
  ellipse(380, 200, 17, 17);

  //nose
  fill(230, 190, 160);
  noStroke();
  ellipse(300, 250, 50, 75);
  ellipse(290, 275, 30, 30);
  ellipse(310, 275, 30, 30);

  //mouth
  stroke(0);
  fill(255, 255, 255);
  arc(300, 300, 140, 60, radians(0), radians(180));

  //ear
  fill(230, 190, 160);
  arc(145, 230, 40, 80, radians(90), radians(270));
  arc(145, 230, 20, 40, radians(90), radians(270));

  //body
  noStroke();
  fill(211, 211, 211);
  rect(150, 450, 300, 300);

  //shoulder
  arc(150, 600, 270, 300, radians(180), radians(270));
  arc(450, 600, 270, 300, radians(270), radians(360));

  //hair
  fill(10, 10, 10);
  arc(300, 130, 280, 180, radians(180), radians(360));
  noFill();
  stroke(1);
  for (int i = 0; i < height; i += 5) {
    if (i<500) {
      arc(random(150, 400), 130, random(50,100), random(80, 120), radians(0), radians(90));
      arc(random(200, 480), 130, random(50,100), random(80, 120), radians(90), radians(180));
    } else {
      stop();
    }
  }
}
