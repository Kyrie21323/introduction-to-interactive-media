//Image manipulation, due October 13th
//Kyrie Park
//With an image on the background, when mouse clicked, randomly choose a piece of the image(which is transparent),
//and when mouse pressed, hold the randomly chosen piece of the image.
//Inspired by puzzles, where we match the piece of an image to its place.
//Source of data "https://processing.org/examples/transparency.html"
PImage[] pieces = new PImage[12];
float offsetx = 0;
float offsety = 0;
float easing = 0.05;
int rand;

void setup() {
  size(564, 752);
  photo = loadImage("ShepardFairy.jpg");
  background(0, 0, 0);
}

void mouseClicked() {
  rand = int(random(11));
}


void draw() {
  PImage imageParts;
  image(photo, 0, 0);
  for (int col = 0; col <= 3; col++) {
    for (int row = 0; row <= 2; row++) {
      imageParts = photo.get(0+(row*188), 0+(col*188), 188, 188);
      pieces[3*col+row] = imageParts;
    }
  }

  if (mousePressed == true) {
    float dx = (mouseX-pieces[rand].width/2) - offsetx;
    offsetx += dx * easing;
    float dy = (mouseY-pieces[rand].height/2) - offsety;
    offsety += dy * easing;
    tint(255, 127);
    image(pieces[rand], offsetx, offsety);
  }
}
