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
It was hard for me to make the leaves both on the right and on the left. More over, since my game includes a function where the leaves disappear due to the existence of bugs, I had a hard time how to get through this.


### Incrementing number of bugs
I wanted to increment the number of bugs depending on how much leaves there were. I thought of incrementing one bug when three leaves were made.
Since the draw function in processing acts as a loop and updates continuously, it was difficult for me to figure out how to increment once whenever three leaves where made.
I've tried numerous if statements, but the best I could get was this:

```
if (countLeaf / 3 > 0 && countLeaf > 0 && countLeaf % 3 == 0) { 
      }
```

But if I incremented the number of bugs like above, it would increment a lot due to the loop that the draw function has. There will be multiple times where the number of leaves will stay at 3, 6 or 9, and for that time the number of bugs will continue to increment. For example, if the loop goes 50 times when the number of leaves are 3, the bug numbers will be 50 and not 1.


## Solutions
### Blue Button Error
Still not solved... the button used to work, but since i've changed some code for the pgr, it doesn't work. Professor Shiloh suggested that it might be a wire problem, but since arduino gets a correct value when the button is pressed, I think its a problem something that I cannot think of.

### Making Leaves
The solution was easy. I just had to make an array for all the values that mattered to a single leaf - the x position, y position, and the direction of the leaf. Later when  I print the leaf, I would just use a for loop and print and image like below:

```
for (int count = 0; count < countLeaf; count ++) {
    image(leaves[count], leafPosx[count], leafPosy[count]);
  }
```

### Incrementing number of bugs
What I noticed was that I could just set the number of bugs as one third of the number of leaves instead of incrementing, so that no matter how many loops goes through, the number of bugs will always be proportional to the number of leaves.
```
if (countLeaf / 3 > 0 && countLeaf > 0 && countLeaf % 3 == 0) {
        countBug = countLeaf/3;            
      }
```

## As I finish the semester
It was a wonderful semester - although it wasn't a perfect uni life i've been expecting my whole life due to COVID-19 - I was able to learn a very interesting field and meet wonderful professors and classmates. I don't think I could have started my uni life better without this class.
