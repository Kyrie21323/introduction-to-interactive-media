int randomColor() {
  return color(random(0, 255), random(0, 255), random(0, 255));
}

class randomStroke {
  int move = 50;
  randomStroke() {
  }

  void makePattern() {
    for (int i = 0; i<height/50; i++) {
      for (int z = 0; z<width/50; z++) {
        int dice = int(random(0, 9));
        stroke(randomColor());
        strokeWeight(5);
        if (dice == 0) {
          line(0+move*z, 25+move*i, 50+move*z, 25+move*i);
        } else if (dice==1) {
          line(25+move*z, 0+move*i, 25+move*z, 50+move*i);
        } else if (dice==2) {
          line(0+move*z, 0+move*i, 50+move*z, 50+move*i);
        } else if (dice==3) {
          line(50+move*z, 0+move*i, 0+move*z, 50+move*i);
        } else if (dice==4) {
          noFill();
          arc(50+move*z, 50+move*i, 100, 100, radians(180), radians(270));
        } else if (dice==5) {
          noFill();
          arc(0+move*z, 0+move*i, 100, 100, radians(0), radians(90));
        } else if (dice==6) {
          noFill();
          arc(0+move*z, 50+move*i, 100, 100, radians(270), radians(360));
        } else if (dice==7) {
          noFill();
          arc(50+move*z, 0+move*i, 100, 100, radians(90), radians(180));
        }
      }
    }
  }
}

randomStroke MyArt = new randomStroke();

void setup() {
  frameRate(1);
  size(700, 700);
}

void draw() {
  background(255);
  MyArt.makePattern();
}
