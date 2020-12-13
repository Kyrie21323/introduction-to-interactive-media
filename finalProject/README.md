# Final Project - Grow A Plant

## The Plan I Had Before
During the class on the day we were announce our final project theme and idea, I presented a mini game similar to ttthe movie maze runner where the player is unable to see the whole map, and monsters are generated during the game. I wanted a game with two simple buttons where one meant attack and the other defend. Sounds like a very fun game, but it came to an end when I noticed that making a random maze, lettting the user see only the path he/she went through would take too much time for me. So I came up with another idea - growing a plant.

## Concept
The idea of growing a plant came from me after watching my mom getting obsessed with growing a plant. After getting this idea, I thought of how to make a game where processing and arduino can communicate. I decided to use three buttons, where one brought up sunlight, one made it rain, and the other killed a bug. And yes, there will be bugs generated while the player plays the game.

So, the over all concept of the game is simple - you just have to let it rain and also give the plant sun light to make it grow faster. But also kill the bugs because they will decrease the growth rate of the plant and later on even kill it. When a bug exists, the LED light will light up so the users can catch the bug easily.

There is no winning in this game. It is an endless game where the user can grow a plant up until it has 1000 leaves (which is very unlikely to happen). On the other hand, if the plant dies due to bugs eating off the leaves, the game will end.

## Schematic
![](mediaForREADME/schematicfinal.jpeg)

## The Result
![](mediaForREADME/board1.jpeg)
![](mediaForREADME/board2.jpeg)

[This is a video of me playing the game.](https://youtu.be/6S4vNLqhVjU)

[This is a video of how the game processes with no control by the user.](https://youtu.be/UBSG5LHPg1Q)

## Problems
### Blue Button Error
The processing does not communicate with the blue button on the arduino. I am not sure what exactly the problem is because on the serial monitor on arduino, it works fine, showing all values change.
![](mediaForREADME/screenMonitor1.jpeg)
![](mediaForREADME/screenMonitor2.jpeg)
![](mediaForREADME/screenMonitor3.jpeg)
![](mediaForREADME/screenMonitor4.jpeg)
![](mediaForREADME/screenMonitor5.jpeg)

On processing, it also calls all three values, but for some reason, only the third value(the blue button's value) does not change when it is pressed.
![](mediaForREADME/processing.jpeg)

### Making Leaves


### Incrementing number of bugs
I wanted to increment the number of bugs depending on how much leaves there were. I thought of incrementing one bug when three leaves were made.
Since the draw function in processing acts as a loop and updates continuously, it was difficult for me to figure out how to increment once whenever three leaves where made.
I've tried numerous if statements, but the best I could get was this:

'''
if (countLeaf / 3 > 0 && countLeaf > 0 && countLeaf % 3 == 0) { //for every three leaves made, set the number of bugs as one third of the number of        leaves
        countBug = countLeaf/3;               //incrementing the number of bugs are impossible because it will increase number of bugs rapidly when the loop goes on
                                              //and the number of leaves stays at three
      }
'''
      
### Calculating Plant Growth Rate


## Solutions
### Blue Button Error
Still not solved... the button used to work, but since i've changed some code for the pgr, it doesn't work. Professor Shiloh suggested that it might be a wire problem, but since arduino gets a correct value when the button is pressed, I think its a problem something that I cannot think of.

### Making Leaves

### Incrementing number of bugs

### Calculating Plant Growth Rate
