//make a method for random colors of the flowers
int randomColor() {
  return color(random(0, 255), random(0, 255), random(0, 255));
}

void setup() {
  //simple background settings
  size(1000, 1000);
  background(255, 180, 180);

  //I used 'for' loop to have 50 flowers in total
  for (int i =0; i<50; i++) {
    //any number between 0 and 150 for the size of the flower(the length of lines) was best fit for my project
    float flowerSize = random(0, 150);
    //the thickness of the pedal was best between 5 and 50
    float pedalSize = random(0, 50);
    strokeWeight(pedalSize);
    //random x and y coordinates for the center of the flower was between 150 800 so that the pedals won't get cut on the edges
    float flowerLocationX = random(150, 800);
    float flowerLocationY = random(150, 800);
    stroke(randomColor());
    //second 'for' loop to make 10 lines with the same initial point, but with different ending point.
    for (int z=0; z<10; z++) {
      //I rotated the first line with 36 degrees so that the flowers will have 10 pedals
      line(flowerLocationX, flowerLocationY, flowerLocationX+flowerSize*cos(radians(36*z))
        , flowerLocationY+flowerSize*sin(radians(36*z)));
    }
    //created the center of the flower for design
    fill(randomColor());
    ellipse(flowerLocationX, flowerLocationY, flowerSize*0.8, flowerSize*0.8);
  }
}
