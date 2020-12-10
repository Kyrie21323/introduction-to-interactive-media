
//imports for random numbers, lists, and communication between arduino and processing
import java.util.Random;
import java.util.Arrays;
import processing.serial.*;
Serial myPort;

int increase = 0;
int decrease = 0;
int pgr = 0; //plant growth rate
int fps = 100;
int time = 1;  //For tick count
int countLeaf = 0; // counting the amount of leaf
int countBug = 0; // counting the amount of bugs
int[] leafPosx, leafPosy; // randomly choosing the position and direction of the leaf and saving it
int check = 0; //For adding on leaf positions and directions
int yellowButtonValue = 0;        // yellow button value
int redButtonValue = 0;      // red button value
int blueButtonValue = 0;       // blue button value
PImage leaf, leaf2, flowerPot, stick, defaultBack, sunBack, rain, bugKill, instructions; //setting the images being used
PImage[] leaves; // for saving all the leaf's direction
boolean gameOver = false;   //True when game is over (when the growth rate is below 0)
boolean startGame = false;  //True when user clicks start button
boolean atNonGamePage = false;  //True when user is not playing the game
boolean itRains = false; //True when user presses blue button
boolean itShines = false; //True when user presses yellow button
boolean itKills = false; //True when user presses red button

Random rand = new Random();

//information page where the instructions are shown
void infoPage() {
  background(0, 0, 0); 
  image(instructions, width/2-1056/2, 150); 
  textAlign(CENTER); 
  textSize(30); 
  fill(255, 255, 255); 
  text("How To Play", width/2, 100);
  startButton();
}

//The button that leads to the information page
void instructionButton() {
  rect(100, 650, 300, 100); 
  textSize(30); 
  fill(0, 0, 0); 
  text("How To Play", 100+300/2, 710);
}

//the button that starts the game
void startButton() {
  fill(255, 255, 255); 
  rect(850, 650, -300, 100); 
  textSize(30);
  fill(0, 0, 0); 
  text("Start!", 850-300/2, 710);
}

//the page before the game is begun
void startPage() {
  image(defaultBack, 0, -100);
  textAlign(CENTER); 
  textSize(100); 
  fill(255, 255, 255); 
  text("Grow a Plant", width/2, 100); 
  instructionButton(); 
  startButton();
}

//the page when the plant dies (Also known as the "game over" page)
void endPage() {
  frame.setSize(950, 900);
  fill(255, 255, 255); 
  rect(850, 650, -300, 100); 
  textSize(30);
  fill(0, 0, 0); 
  text("Replay!", 850-300/2, 710);
  textSize(100);
  textAlign(CENTER);
  text("Game Over", width/2, 200);
  textSize(50);
  text("Your plant has died.", width/2, 300);
}

//basic setup
void setup() {
  size(950, 900);

  leaf = loadImage("leaf1.png");
  leaf2 = loadImage("leaf2.png");
  flowerPot = loadImage("flowerpot.png");
  defaultBack = loadImage("defaultback.jpg");
  stick = loadImage("stick.png");
  instructions = loadImage("instructions.jpg");
  rain = loadImage("rain.png");
  sunBack = loadImage("sun.png");
  bugKill = loadImage("bugKill.png");
  //set the max array for the three very big because the user might grow more than a 100 leaves
  leafPosx = new int[1000];
  leafPosy = new int[1000];
  leaves = new PImage[1000];

  // List all the available serial ports
  println(Serial.list());
  //Open the second port because the second port on my computer is arduino
  myPort = new Serial(this, Serial.list()[2], 9600);
  // don't generate a serialEvent() unless you get a newline character:
  myPort.bufferUntil('\n');

  //open start page
  startPage();
}

void serialEvent(Serial myPort) {
  //get string
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {
    // split the string on the commas and convert the resulting substrings into an integer array:
    int[] buttons = int(split(inString, ","));
    // if the array has at least three elements, you know you got the whole
    // thing.  Put the numbers in the color variables:
    if (buttons.length == 3) {
      yellowButtonValue = buttons[0];
      redButtonValue = buttons[1];
      blueButtonValue = buttons[2];
    }
  }
}

//when the mouse is clicked, it checks the location of the mouse cursor and if the cusor was either on the how to play button or start button, 
//the game changes the screen to the corresponding page.
void mouseClicked() {
  float mousex = mouseX; 
  float mousey = mouseY; 
  if (100 <= mousex && mousex <= 400 && 650 <= mousey && mousey <= 750) {  //Display info page change to yellow button
    infoPage();
    frame.setSize(1400, 850);
  }
  if (550 <= mousex && mousex <=850 && 650 <= mousey && mousey <= 750) {  //Load game / start the game change to blue button
    clear();
    frame.setSize(950, 900);
    //Since the game starts, change the startGame boolean to true, and reset all values because this start button can also act as a replay button.
    gameOver = false;
    startGame = true;  //True when user clicks start button
    reset();
    //atNonGamePage = false;  //True when user is not playing the game
  }
}

void reset() {
  pgr = 0; //plant growth rate
  fps = 10;
  time = 1;  //For tick count
  countLeaf = 0; // counting the amount of leaf
  countBug = 0; // counting the amount of bugs
  check = 0; //For adding on leadPos
  increase = 0;
  decrease = 0;
}

//choose the leaf's random position, and direction and save it to the arrays
void chooseLeaf() {
  int temp = rand.nextInt(500);             //random position of leaf
  int choose = rand.nextInt(2);             //random direction of leaf
  if (choose == 0) {                        //if leaf direction is right
    leaves[check] = leaf;                   //save right headed image of leaf
    leafPosx[check] = width/2;              //save the position of x of the image
    leafPosy[check] = temp;                 //save the position of y of the image
  } else if ( choose == 1) {                //if leaf direction is left
    leaves[check] = leaf2;                  //save left headed image of leaf
    leafPosx[check] = width/2-320;          //save the position of x of the image
    leafPosy[check] = temp;                 //save the position of y of the image
  }
  check += 1;                               //increment check to save the position and direction for the next leaf
}

//print out the leaves saved on each arrays
void makeLeaf() {
  for (int count = 0; count < countLeaf; count ++) {
    image(leaves[count], leafPosx[count], leafPosy[count]);
  }
}

void checkBooleans() {
  if (yellowButtonValue == 1) {
    itShines = true;
  } else {
    itShines = false;
  }
  if (redButtonValue == 1) {
    itKills = true;
  } else {
    itKills = false;
  }
  if (blueButtonValue == 1) {
    itRains = true;
  } else {
    itRains = false;
  }
}

void draw() {
  time = ++time % ((60/fps)+1);
  if (time == (60/fps)) {
    if (startGame && !gameOver) {                               //game will start when both booleans match
      increase += 10;
      print(increase, decrease, pgr, countLeaf, countBug, "\n");
      pgr = increase - decrease;                                //increment growth rate for plant
      image(defaultBack, 0, -100);                              //print the default background
      if (countLeaf / 3 > 0 && countLeaf > 0 && countLeaf % 3 == 0) {
        countBug = 1;
      }
      if (countBug >= 1) {
        decrease += countBug*50;
        myPort.write("H");
      }else {
        myPort.write("L");
      }
      if (countBug == 0) {
        decrease = 0;
      }
      if (pgr <= 0 && countLeaf < 0) {
        myPort.write("L");
        gameOver = true;
      }
      if (pgr < 0 && pgr / 200 < countLeaf) {
        countLeaf -= 1;
      }
      if (increase / 200 > 0 && increase % 200 == 0) {
        countLeaf += 1;
        chooseLeaf();
      }
      checkBooleans();
      if (itShines == true) {
        image(sunBack, width/2 - 400, 100);
        increase += 30;
      }
      if (itKills == true) {
        image(bugKill, width/2 - 300, 50);
        if (countBug > 0) {
          countBug -= 1;
        }
      }
      if (itRains == true) {
        image(rain, width/2 - 400, 100);
        increase += 20;
      }
      image(flowerPot, width/2-160, 650);                       //print flower pot
      image(stick, width/2-207.5, 0);                           //print stick
      makeLeaf();
    } else if (startGame && gameOver) {
      endPage();
    }
  }
}
