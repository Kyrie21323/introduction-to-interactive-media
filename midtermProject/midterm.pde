//IM Midterm Project
//Kyrie Park
//Description: Screen snake is a single player game where the player uses the direction keys on the key board to move the
//             snake on the screen. There will be randomly generated pieces of the snake's body on the screen, and when the snake
//             eats the piece, the snake gets longer and another piece of the body will be generated randomly.
//             The snake dies when the snake either hits the end of the canvas(wall or barrier), or bites its own body.
//             I have played this mini-game since I was in elementary school, and this game was the first thing that 
//             popped into my head when the topic for the midterm was announced. I had fun and reminisced the
//             good times of my child hood while doing this project.
//============================================================================================================================
//============================================================================================================================
//Imports
import processing.sound.*;         //For making effect sounds when buttons are clicked and when snakes reaches a body part.

//============================================================================================================================
//============================================================================================================================

SoundFile eatingSound;
SoundFile buttonClicked;

int fps = 10;
int boardSize = 20;
int snakeSize = 1;
int time = 0;  //For tick count

int[] currentDirection = {0, -1};
snakeBlock[] snakeList = new snakeBlock[boardSize*boardSize];
PImage head, body, start, instructions, back;
PImage[] wholeSnake = new PImage[boardSize*boardSize];

boolean gameOver = false;
boolean startGame = false;  //True when user clicks start button
boolean atNonGamePage = false;  //True when user is not playing the game
boolean applePresent = false; //True when an apple is present in the game

int[] headPos = new int[2];
int[] blockPos = new int[2];
int[] applePos = new int[2];

//============================================================================================================================
//============================================================================================================================
//Class

public class snakeBlock {
  private int pX;
  private int pY;

  public snakeBlock() {
    pX = 9;
    pY = 10;
  }

  public snakeBlock(int pX, int pY) {
    this.pX = pX;
    this.pY = pY;
  }

  public void moveBlock(int pX, int pY) {
    this.pX = pX;
    this.pY = pY;
  }

  public int[] getCoord() {
    int[] pos = new int[2];
    pos[0] = pX;
    pos[1] = pY;
    return pos;
  }
}
//============================================================================================================================
//============================================================================================================================
//Setup

void setup() {
  size(1400, 850);
  head = loadImage("snake.jpg");
  start = loadImage("start.jpg");
  instructions = loadImage("instructions.jpg");
  back = loadImage("back2.jpg");
  eatingSound = new SoundFile(this, "eating.mp3");
  buttonClicked = new SoundFile(this, "buttons.mp3");
  surface.setResizable(true);
  startPage();
}

//============================================================================================================================
//============================================================================================================================
//Functions
void startPage() {
  atNonGamePage = true;
  for (int i=0; i <= height/150; i++) {
    for (int j=0; j <= width/150; j++) {
      image(back, j*150, i*150);
    }
  }
  image(start, width/2-564/2, height/2-705/2); 
  textAlign(CENTER); 
  textSize(100); 
  fill(255, 255, 255); 
  text("Screen Snake!", width/2, 100); 
  instructionButton(); 
  startButton();
  fill(0, 0, 0); 
  text("Start!", 1300-300/2, 710);
}

void endPage() {
  String dead;
  if (snakeList[0].getCoord()[0] < 0 || snakeList[0].getCoord()[0] > boardSize-1 || snakeList[0].getCoord()[1] < 0 || snakeList[0].getCoord()[1] > boardSize-1) {
    dead = "You died!\nThe snake's head hit the edge of the screen!";
  } else {
    dead = "You died!\nThe snake has bitten its own body!";
  }
  frame.setSize(1400,850);
  startButton();
  fill(0, 0, 0); 
  text("Replay", 1300-300/2, 710);
  fill(255, 255, 255); 
  textSize(100);
  textAlign(CENTER);
  text("Game Over", width/2 , 200);
  textSize(50);
  text(dead, width/2, 300);
}

void instructionButton() {
  rect(100, 650, 300, 100); 
  textSize(30); 
  fill(0, 0, 0); 
  text("How To Play", 100+300/2, 710); 
  //image(instructions, CENTER, CENTER);
}

void startButton() {
  fill(255, 255, 255); 
  rect(1300, 650, -300, 100); 
  textSize(30);
}

void backButton() {
  fill(255, 255, 255); 
  rect(550, 650, 300, 100); 
  textSize(30); 
  fill(0, 0, 0); 
  text("Back", 700, 710);
}

void infoPage() {
  background(0, 0, 0); 
  image(instructions, width/2-1056/2, 150); 
  textAlign(CENTER); 
  textSize(30); 
  fill(255, 255, 255); 
  text("How To Play", width/2, 100);
  backButton(); 
  startButton();
  fill(0, 0, 0); 
  text("Start!", 1300-300/2, 710);
}

void generateApple(snakeBlock[] sb) {
  int[] tempPos = new int[2];
  boolean check = false;
  while (!check) {
    applePos[0] = int(random(0, boardSize));
    applePos[1] = int(random(0, boardSize));
    for (int i=0; i<snakeSize; i++) {
      tempPos = sb[i].getCoord();
      if (applePos[0] == tempPos[0] && applePos[1] == tempPos[1])  break;
      if (i==snakeSize-1)  check = true;
    }
  }

  applePresent = true;
}

void gotApple(int[] p) {
  if (snakeList[0].getCoord()[0] == p[0] && snakeList[0].getCoord()[1] == p[1]) {
    snakeList[snakeSize] = new snakeBlock(snakeList[snakeSize-1].getCoord()[0], snakeList[snakeSize-1].getCoord()[1]);
    snakeSize++;    
    applePresent = false;
    eatingSound.play();
  }
}

void snakeCheck(snakeBlock[] sb, int size) {
  if (sb[0].getCoord()[0] < 0 || sb[0].getCoord()[0] > boardSize-1 || sb[0].getCoord()[1] < 0 || sb[0].getCoord()[1] > boardSize-1) {
    gameOver = true;
  }
  for (int i=1; i<size; i++) {
    if (sb[0].getCoord()[0] == sb[i].getCoord()[0] && sb[0].getCoord()[1] == sb[i].getCoord()[1]) {
      gameOver = true;
      break;
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      currentDirection[0] = 1;
      currentDirection[1] = 0;
    } else if (keyCode == LEFT) {
      currentDirection[0] = -1;
      currentDirection[1] = 0;
    } else if (keyCode == UP) {
      currentDirection[0] = 0;
      currentDirection[1] = -1;
    } else if (keyCode == DOWN) {
      currentDirection[0] = 0;
      currentDirection[1] = 1;
    }
  }
}

void mouseClicked() {
  buttonClicked.play();
  float mousex = mouseX; 
  float mousey = mouseY; 
  if (100 <= mousex && mousex <= 400 && 650 <= mousey && mousey <= 750) {  //Display info page
    infoPage(); 
    frame.setSize(1400, 850);
  }
  if (550 <= mousex && mousex <= 850 && 650 <= mousey && mousey <= 750) {  //Back button Home button
    startPage(); 
    frame.setSize(1400, 850);
  }
  if (1000 <= mousex && mousex <= 1300 && 650 <= mousey && mousey <= 750) {  //Load game / start the game
    clear();
    frame.setSize(37*boardSize, 37*boardSize);
    snakeSize = 1;
    currentDirection[0] = 0;
    currentDirection[1] = -1;
    snakeList[0] = new snakeBlock();
    gameOver = false;
    startGame = true;  //True when user clicks start button
    atNonGamePage = false;  //True when user is not playing the game
    applePresent = false;
  }
}

//============================================================================================================================
//============================================================================================================================
//Draw

void draw() {
  time = ++time % ((60/fps)+1);

  if (time == (60/fps)) {
    if (startGame && !gameOver) {
      clear();

      headPos = snakeList[0].getCoord();

      if (!applePresent) {
        generateApple(snakeList);
      } else {
        fill(0, 255, 0);
        image(head, applePos[0]*37, applePos[1]*37);
      }

      for (int i=snakeSize-1; i>0; i--) {
        blockPos = snakeList[i-1].getCoord();
        snakeList[i].moveBlock(blockPos[0], blockPos[1]);
      }

      gotApple(applePos);

      for (int i=0; i<snakeSize; i++) {
        wholeSnake[i] = head;
      }
      snakeList[0].moveBlock(headPos[0]+currentDirection[0], headPos[1]+currentDirection[1]);

      snakeCheck(snakeList, snakeSize);

      if (!gameOver) {
        for (int i=0; i<snakeSize; i++) {
          blockPos = snakeList[i].getCoord();
          image(wholeSnake[i], blockPos[0]*37, blockPos[1]*37);
        }
      }
    } else if (startGame && gameOver) {
      endPage();
    }
  }
}
