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
![](media/leaf1.png)
![](media/leaf2.png)

I needed two different direction headed leaves because I wanted the plant to grow on both sides.

Since I wanted the start button to act as a replay button also, on the mouseClicked function, I added some more features. I reset all the global variables through a function called reset(), and also made new booleans such as gameOver and startGame which will be true when the game is over and user clicks start button respectively. I've also set the gameOver to false and startGame as true whenever the user clicks the start or replay button.

Now I think Im all set for the basic frame of the game.

#### Day 2 (12/8)


#### Day 3 (12/9)
#### Day 4 (12/10)
#### Day 5 (12/11)
