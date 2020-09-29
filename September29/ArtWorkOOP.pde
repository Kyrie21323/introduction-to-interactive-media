//Create class that makes random strokes throughout the pallete.
class randomStroke {
  int move = 50;
  int colors = 0;
  randomStroke() {
  }
  //Create three objects that returns a color for the strokes.
  //First one is simple black
  int basicColor() {
    return color(0, 0, 0);
  }
  //The second one returns a full-ranged random color
  int randomColor1() {
    return color(random(0, 255), random(0, 255), random(0, 255));
  }
  //The third on returns either blue, yellow or red, which was inspired from Mondrian
  int randomColor2() {
    int dice = int(random(0, 3));
    if (dice==0) {
      colors = color(221, 1, 0);
    } else if (dice==1) {
      colors = color(43, 80, 149);
    } else {
      colors = color(250, 201, 1);
    }
    return colors;
  }
  //Then we make a method that will randomly draw strokes.
  void makePattern() {
    //I used for loops twice than functions as drawing random strokes on the horizontal line, 
    //and then move one space below to fill the next horizontal line.
    for (int i = 0; i<height/50; i++) {
      for (int z = 0; z<width/50; z++) {
        int dice = int(random(0, 8));
        stroke(randomColor1());
        strokeWeight(5);
        if (dice == 0) {
          line(0+move*z, 25+move*i, 50+move*z, 25+move*i);
        } else if (dice == 1) {
          line(25+move*z, 0+move*i, 25+move*z, 50+move*i);
        } else if (dice == 2) {
          line(0+move*z, 0+move*i, 50+move*z, 50+move*i);
        } else if (dice == 3) {
          line(50+move*z, 0+move*i, 0+move*z, 50+move*i);
        } else if (dice == 4) {
          noFill();
          arc(50+move*z, 50+move*i, 100, 100, radians(180), radians(270));
        } else if (dice == 5) {
          noFill();
          arc(0+move*z, 0+move*i, 100, 100, radians(0), radians(90));
        } else if (dice == 6) {
          noFill();
          arc(0+move*z, 50+move*i, 100, 100, radians(270), radians(360));
        } else if (dice == 7) {
          noFill();
          arc(50+move*z, 0+move*i, 100, 100, radians(90), radians(180));
        }
      }
    }
  }
}

//Call class
randomStroke MyArt = new randomStroke();

void setup() {
  frameRate(1);
  size(700, 700);
}

void draw() {
  //reset background every time, and call the randomly made patterns and draw it.
  background(255);
  MyArt.makePattern();
}
