void setup() {
//basic background setups for the pallete
  frameRate(1);
  size(600, 600);
  background(255);
}

void draw() {
//head
  ellipse(300, 250, 360, 400);
  
//eye
  fill(250, 250, 250);
  ellipse(200, 200, 78, 40);
  ellipse(400, 200, 78, 40);

//iris(part of eye), and its random color
  fill(random(0, 255), random(0, 255), random(0, 255));
  ellipse(200, 200, 50, 50);
  ellipse(400, 200, 50, 50);

//pupil
  fill(0, 0, 0);
  ellipse(200, 200, 30, 30);
  ellipse(400, 200, 30, 30);

//nose and its random color
  fill(random(0, 255), random(0, 255), random(0, 255));
  triangle(300, 200, 260, 270, 340, 270);

//mouth and its random color
  fill(random(0, 255), random(0, 255), random(0, 255));
  rect(225, 300, 150, 50);

// For natural hair, I thought that a finite loop that will make adequate amount of random arcs would help.
// Therefore i used 'for' and 'if' loops. I've set the loop to go on until there are 200 arcs(or hairs) made.
  for (int i = 0; i < height; i += 5) {
    if (i<200) {
      noFill();
      arc(random(170, 400), random(50, 100), 100, 130, radians(0), radians(90));
      arc(random(200, 430), random(50, 100), 100, 130, radians(90), radians(180));
      i = i + 1;
// I incremented the value of i by 1 every time one hair was placed so that the loop is able to count the number of hairs placed.
// When 200 randomly placed hairs are made, I made the program to stop using 'else' so it would not process further and make more hair.
    } else {
      stop();
    }
  }
}

