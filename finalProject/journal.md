# Final Project - Grow a Plant- Journal

[Day 1](journal.md#day-1); [Day 2](journal.md#day-2); [Day 3](journal.md#day-3); [Day 4](journal.md#day-4); [Day 5](journal.md#day-5)

## The Plan I Had Before
During the class on the day we were announce our final project theme and idea, I presented a mini game similar to ttthe movie maze runner where the player is unable to see the whole map, and monsters are generated during the game. I wanted a game with two simple buttons where one meant attack and the other defend. Sounds like a very fun game, but it came to an end when I noticed that making a random maze, lettting the user see only the path he/she went through would take too much time for me. So I came up with another idea - growing a plant.

## Concept
The idea of growing a plant came from me after watching my mom getting obsessed with growing a plant. After getting this idea, I thought of how to make a game where processing and arduino can communicate. I decided to use three buttons, where one brought up sunlight, one made it rain, and the other killed a bug. And yes, there will be bugs generated while the player plays the game.

So, the over all concept of the game is simple - you just have to let it rain and also give the plant sun light to make it grow faster. But also kill the bugs because they will decrease the growth rate of the plant and later on even kill it. When a bug exists, the LED light will light up so the users can catch the bug easily.

There is no winning in this game. It is an endless game where the user can grow a plant up until it has 1000 leaves (which is very unlikely to happen). On the other hand, if the plant dies due to bugs eating off the leaves, the game will end.


#### Day 1 (12/7)
It took a long time for me to notice that the plan before (maze runner) would be too time consuming and difficult for me. Not only that, but it also took a lot of time for me to plan another project that includes communication between arduino and processing. That was when I finally got an idea watching my mother giving water to the plants she has been growing for the past few weeks. I thought of a game where the user grows a plant by giving them water and sunlight. But here was the problem - if the plant only grows, what is the point of this game?
I decided to add the 'bug' features where it would appear for every some amount of leaves. After simply designing how the game would work, I starting coding on processing. I thought that it would be easier to set up all the codes on processing and later on connect it with arduino.

After importing arrays, random, and serial, I've basically made the starting page, where the background is dark (because it needs to be contradicting to the sun), and some buttons - how to play and start buttons. From the code I have made from the mid term, I was able to set up most of the basic frame of the game.
Then I added the mouseClicked function where if the mouse cursor is on the "how to play" button when clicked, it would call the infoPage function and if the cursor was on "start" when clicked, it would start the game.

Today I made infoPage, instructionButton, startButton, startPage, endPage, and mouseClicked.
Since most of the code was from my midterm project, except for little changes such as the title and frame size, it took a little time and effort.

Later this day, I made global PImages that were used for leaves, the plant, background and more. In the setup, I set up all the images for leaf, leaf2, flowerPot, defaultBack, stick, instructions, rain, sunBack, and bugKill.

The reason why I had two images for leaves is because I was not sure how to flip an image via processing. So I had two images that are basically the same, but heading different directions. Just like below.
![](media/leaf2.png)
![](media/leaf1.png)

I needed two different direction headed leaves because I wanted the plant to grow on both sides.

Since I wanted the start button to act as a replay button also, on the mouseClicked function, I added some more features. I reset all the global variables through a function called reset(), and also made new booleans such as gameOver and startGame which will be true when the game is over and user clicks start button respectively. I've also set the gameOver to false and startGame as true whenever the user clicks the start or replay button.

Now I think Im all set for the basic frame of the game.


#### Day 2 (12/8)
For today's goal, I want to finish the basic calculation / algorithm / rules for the game. In other words, I want the game to work with out the arduino part - no sun rain or killing the bugs. 
So I wanted the plant to create three leaves after the play button was clicked, and then slowly died due to the bug and the game would be over. I had to figure out how I could make and delete leaves on the draw function.

I first started working on the draw function. I first controlled the speed of the loop with the same algorithm I used for my midterm project.
I made a variable 'time' to control the time frame. With the equation "time = ++time % ((60/fps)+1)" in the draw function, I am able to make the time increase, but will be in a loop since the modulus will be the remainder(between 0 and the biggest remainder) and reset to 0 once in a while. with the if statement after that "if (time == (60/fps))", the whole game will be updated every time the variable 'time' is equal to 60/fps. In my case, the fps was 10, so in every 10 ticks, the game will update, and will check the change in rate of plant's growth and depending on how much it increases or decreases, will make new leaves, or even delete it. (oh and I also printed the background, pot for the plant, and the stick also in the draw function).

Within the time frame I set, when the game is started (startGame is true) and the game is not over (gameOver is true) I incremented the integer variable 'increase' by 10. So for every 10 ticks, the increasing rate for the plant will be increased by 10. Then I calculated pgr(plant growth rate) which is simple the increase rate - decrease rate. Since the increase rate represents the plant's growth speed increasing(by 10 as given and the sun and rain features can be added later), while the decrease rate represents the plant's decaying speed (due to the existence of bugs) the pgr could represent whether the plant is growing (if bigger than 0) or dying (if less than 0).

First I had to increment the number of the leaves depending on how fast the 'increase' variable increases. I thought of a calculation where for every 200 'increase' increases, a leaf will be added. Below is the code I thought of:
```
      if (increase / 200 > 0 && increase % 200 == 0) {     
        countLeaf += 1;
        chooseLeaf();
      }
```
Another function I added was choosing a leaf. Since a leaf is added, I needed to make a leaf. Since I wanted the leaf to be made on a random position along the stick, I used random to get a random y value of the leaf.
But here I bumped into a problem. I was easy for me to make random leaves infinitely, but it was impossible for me to delete the ones I've made. Since i wanted the bugs to decay the plant and make the leaves disappear in the order of recently made to first made, I thought that arrays could help me. If I had arrays for three categories - direction (which would be two different images), x position of the image, and y position of the image - I would be able to append a new leaf's direction, x and y position on each array.
```
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
```
With check incremented every time a new leaf is made, I will be able to continue to make new and random leaves.
This would also allow me to print the leaves easier because all I had to do is to print an image depending on the order in each arrays.
```
void makeLeaf() {
  for (int count = 0; count < countLeaf; count ++) {
    image(leaves[count], leafPosx[count], leafPosy[count]);
  }
}
```
And if the countLeaf is decreased, I would also be able to print out less leaves because of the conditions i've set on the for loop.

None of the ideas or goals that i've expected has changes, but the problem I faced - to make leaves randomly and abling to delete it later on - took a lot of time for me to figure out a solution for it. So i'll call it a day.


#### Day 3 (12/9)
Since making the leaves worked fine yesterday, today I need to work on the bug part. I had to increase the number of bugs for every three leaves made, and also set up a calculation of decrease rate for each number or bugs.

I wanted to increment the number of bugs depending on how much leaves there were. I thought of incrementing one bug when three leaves were made.
Since the draw function in processing acts as a loop and updates continuously, it was difficult for me to figure out how to increment once whenever three leaves where made.
I've tried numerous if statements, but the best I could get was this:
```
if (countLeaf / 3 > 0 && countLeaf > 0 && countLeaf % 3 == 0) {
        
      }
```
But if I incremented the number of bugs like above, it would increment a lot due to the loop that the draw function has. There will be multiple times where the number of leaves will stay at 3, 6 or 9, and for that time the number of bugs will continue to increment. For example, if the loop goes 50 times when the number of leaves are 3, the bug numbers will be 50 and not 1.

What I noticed was that I could just set the number of bugs as one third of the number of leaves instead of incrementing, so that no matter how many loops goes through, the number of bugs will always be proportional to the number of leaves.
```
if (countLeaf / 3 > 0 && countLeaf > 0 && countLeaf % 3 == 0) { 
        countBug = countLeaf/3;
      }
```
If the countBug was more than 0, I incremented the value for 'decrease'.
```
decrease += countBug*50;
```
Because the existence of bugs have to decay the plant unless the player uses the bug spray, the speed of the plant decays must be bigger than its growing speed. Therefore I set the increase of decrease bigger (50) than the increase of increase (10) for each loop. Also if there is no bug at all, I've put decrease as 0 because the plant should not decays if a bug doesn't exist.

Now counting down the number of leaves. When the bug starts to decay the plant or in other words the decrease is bigger than increase (pgr<0), for every 200 of pgr decreasing, I decremented the number of leaves. But since the pgr could be bigger than or less than the amount of increase (which controls the number of leaves), I set the condition of if statement as below:
```
      if (pgr < 0 && pgr / 200 < countLeaf) {
        countLeaf -= 1;
      }
```
Now that I'm pretty much done with the game's basic functions, I need to move on to making the arduino board!

#### Day 4 (12/10)
After making the arduino board with three buttons and one LED(to show how much bugs there were), I was faced by another problem. I was unsure of how to sent serial to processing from arduin.o. I reached out to professor Shiloh right away and was enlightened.

First I made five constant integers three for each buttons, one for the LED, and one for a variable to read incoming serial data.

Then in the setup, I initialized the serial communication and the LED pin as an output
In the loop, I printed all three serials for each buttons and printed all three values in one line and seperated each value by commas. This is important because each line would represent the state of the three buttons in every single loop. Rather than sending values one by one, this makes communication between processing and arduino easier.
```
  Serial.print(digitalRead(yellowButton));
  Serial.print(",");
  Serial.print(digitalRead(redButton));
  Serial.print(",");
  Serial.println(digitalRead(blueButton));
```
At first I wanted the led to blink depending on the number of bugs. If more bugs exists, the LED would blink faster. However, I thought this would be too time consuming for me so I changed my plan to make the LED simply turn on when a big ever exists. Since I have already made an if statement for a bug existing, it would be easy for me to turn on and off the LED.

Below printing the serials, I set up if statements for turning on and off the LED.
```
  // see if there's incoming serial data:
  if (Serial.available() > 0) {
    // read the oldest byte in the serial buffer:
    incomingByte = Serial.read();
    // if it's a capital H (ASCII 72), turn on the LED:
    if (incomingByte == 'H') {
      digitalWrite(redPin, HIGH);
    }
    // if it's an L (ASCII 76) turn off the LED:
    if (incomingByte == 'L') {
      digitalWrite(redPin, LOW);
    }
```

Now that arduino is all set, my goal was to make the LED actually work.

Back to processing, in the draw function when the bug is more than or equal to one, I added a line that writes "H" on the port which will help me light up the LED when a bug exists. On the other hand, when there are no bugs, I wrote "L" on the port to turn the LED off.

Now I had to decide what makes the game over. It was when the pgr is negative, which means that the plant is dying, and also if there are no leaves at all.
```
 if (pgr <= 0 && countLeaf <= 0) {
        myPort.write("L");
        gameOver = true;
      }
 ```
Here, I turned off the LED because it should show that the game is over, and also changed the boolean gameOver to true which will directly send the user to the end page.
```
else if (startGame && gameOver) {       
      endPage();
    }
```
if game is over after the game has start, it sends the user to the end page, where it shows that the player has lost and gives a choice to replay.

#### Day 5 (12/11)
Back to processing, I made 6 more global variables. 3 integers for each buttons' value, and 3 boolean that will change to true when each corresponding button is pressed. Also in the setup, I listed all the available serial ports and opened the second port because the second port on my computer is arduino. Then I made the serialEvent() and made it generate only when it gets a newline character.

In the serial event, I got a string that reads the serials, and when the string is not empty, I split the string on the commas and convert the resulting substrings into an integer array.
```
int[] buttons = int(split(inString, ","));
```
If the array has at least three elements, I know I got the whole thing so I put in the values for each buttons in the order of yellow, red, and blue respectively.
```
yellowButtonValue = buttons[0];
redButtonValue = buttons[1];
blueButtonValue = buttons[2];
```

