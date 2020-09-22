int randomColor() {
  return color(random(0, 255), random(0, 255), random(0, 255));
}

void setup() {
  size(1000, 1000);
  background(255, 180, 180);

  for (int i =0; i<50; i++) {
    float flowerSize = random(0, 100);
    float pedalSize = random(0, 100);
    strokeWeight(pedalSize);
    float flowerLocationX = random(150, 800);
    float flowerLocationY = random(150, 800);
    stroke(randomColor());
    for (int z=0; z<10; z++) {
      line(flowerLocationX, flowerLocationY, flowerLocationX+flowerSize*cos(radians(36*z))
        , flowerLocationY+flowerSize*sin(radians(36*z)));
    }
    fill(randomColor());
    ellipse(flowerLocationX, flowerLocationY, flowerSize*0.8, flowerSize*0.8);
  }
}
