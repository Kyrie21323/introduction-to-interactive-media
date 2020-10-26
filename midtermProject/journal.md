# Journal for Midterm Project: Make A Game - Screen Snake!
## Plan
### Preliminary Description
I have been planning my midterm project to be a well-known game "Screen Snake"
Screen snake is a single player game where the player uses the direction keys on the key board to move the snake on the screen. There will be randomly generated pieces of the snake's body on the screen, and when the snake eats the piece, the snake gets longer and another piece of the body will be generated randomly.

### Planned Steps
1. Call images for the snake's head and body.

2. Set the whole draw function into a while loop -> Let the user continue the game when dead by pressing the enter key, and end the loop when user clicks the quit button on the canvas.

3. Make a three functions to make the starting page of the game.
   1. Draw shapes to design the starting page (Haven't come up with an idea yet, but probably will draw a snake).
   2. Make buttons that start the game and show informations of how to play (Each button for one function).
   3. If the button for showing information is clicked, show a text of instructions and also images to support the user to understand the directions.

4. Make a function that makes the ending page of the game.
   1. Get a string into the function, and if the string is equal to 'wall', show the end page with a text showing "You died because you hit the wall."
   2. If the string is equal to 'bite', the text should show 'You died because you have bitten yourself."

5. Make four functions that change the direction of the snake if the direction key is pressed.

6. Make another function that returns a sound when the location of the snake's head is overlapped with the randomly placed body pieces.

7. Make a function that runs the game
   1. Claim a global list that contains only the head picture of the snake.
   2. Via calling the four direction key functions, able the snake to change it's direction.
   3. If the head touches the randomly placed body parts, expand, or append the body picture into the list, and let the function print the whole list.
   4. Also call the sound function to return a sound when the snake list is appended.
   5. If the snake's head reaches the end of the canvas, claim a string variable to 'wall', and if the location of the snake's head is exactly the same with any        other body parts that are already in the list, claim it as 'bite' and call the end page function.

8. In the draw function, call the game function and put it in a while loop, and break the loop if and only if what I said in step 2.

## Journal of Progress
### Oct. 19th (Starting Page, Start button, How to play Button)
1. I decided to use shapes for the buttons that lead to the instruction page and the game to start, and for the head, body, and the design of the starting page, I used images downloaded from Pinterest.
2. Also, instead of letting the user to press a key on the keyboard, I have decided to let them press buttons (with mouse cursors) that are visually made in the game so that the user may choose to view the instructions, play the game, or replay the game when dead. The idea of letting the user to use mouse instead of keys came from the fact that I am not able to make functions that are activated when a key is pressed yet ^^;.
3. I have been able to finish the starting page including two buttons - 'How to play', and 'Start'. The functions of the buttons worked at the end of the day, but I had a hard time using 'mouseClicked' functions and if statements with mouseX and mouseY variables since there was an error that boolean and integers cannot be compared. I don't know the exact reason why it didn't work, but I've tried different algorithms, and now it works with the coding style i have now.
4. When the mouse is clicked on top of the button visualized on the starting page, I was able to successfully change the page. By clearing the whole canvas and drawing another image, I could check that the mouseClicked function works, and tomorrow, I will be designing the instruction page as well as the how to game will work.
5. Eventhough I was able to avoid using the key pressed fuction for the starting page, I will eventually have to know how it works since screen snake is a game where the user constantly types the direction key to move the snake. Im worried how I will get thorugh this phase.

### Oct. 20th (Instruction Page, Back Button)
1. Today I have designed the instruction page, where it shows the an image, an on-screen text as well as two buttons, one named 'Back' that allows the user to go back to the starting page, and one named "Start" which allows the user to actually start the game.
2. Different from what I have planned, instead of making three different functions for my starting page, since I had to make the pages change depending on what the user clickes on, I have made three different functions that draw the buttons, and one function, mouseClicked, that draws new pages if the button is clicked. The starting page is drawn with a new function called startPage, calling the two button functions (Start and How to play), and also an image for the background and the design. This function is called in the set up page so that when the mouse is clicked and changed to another page, it will disappear.
3. Within the mouseClicked function, I have used if and else if statements to check whether the user clicked, and if clicked, which button was clicked using the mouse cursor's x and y location. When the mouse is clicked, I called the startPage function and the instructionPage function to draw the corresponding pages.
4. On the instruction page, there will be an image called from the file, which is a screen shot of the instructions on how to play, and the goal for this game.
5. There was no big technical problems that I faced today, but just simple algorithms to think for the best and concise coding. Everything function-wise worked as I planned.

### Oct. 22nd (Move Snake, Time Frame, OOP(class), )
1. Now that all the buttons work as I want them to, I had to make the page for the game to actually work. I planned to finish half of how the game will work, which is that the snake can move depending on what key the user presses, and when the snake eats a body part, it expands its body length. The parts that I will have to to tomorrow is to set up when the snake dies. ex)when it reaches the end of the canvs, or the head hits its own body.
2. First of all, when the start button is pressed, I had to make the size of the canvas change. This is because I wanted the width and height of the canvas dividable by the size of the snake's image(37X37) without a remainder. To make the board of the game 20 by 20, I have set the canvas size change to 740 by 740.
(37 * 20 = 740).
3. I chose to use object oriented programming
4. I've also decided to use global PImage arrays to append the body image to it when the snake eats the body part so that the snake can get expanded when it is printed.

### Oct. 23rd
### Oct. 25th (Ending Page, Restart Button)
1. Now that my game processes well as I want it to be, I need to design the ending page, where it should show that the user's snake has died, how it died, and show a replay button to allow the user to play once more.
2. I have changed the canvas size back to the big one, 1400 by 850 so that the user can notice significantly that the game is over.
3. Since the start button and the replay button shall function the same, I decided to use the same shape, but print a differen on-screen text to write replay instead of start. Next, I have written the on-screen text of 'Game Over' and the reason why the snake dies. I checked the position of the snake's head, and
if the snake was dead because the position of the head was outside the cavas, I set the value of the string variable 'dead' to "You died!\nThe snake's head hit the edge of the screen!". Else, I set 'dead' as "You died!\nThe snake has bitten its own body!".
4. The end page will show up if and only if the snake dies, which has to happen when the game is started, and then snake is dies. Therefore I changed the boolean 'gameOver' to true when the snake dies. In the draw function, via if statement, I will check if both startGame and gameOver is true to print out the end page.
5. Replay button functions the same as the start button - it will start the game - but it will start from the moment the snake has died. This is because the data has not be reset. So I have reset all the datas which include the following:
  1. snakeSize = 1;
  2. currentDirection[0] = 0;
  3. currentDirection[1] = -1;
  4. snakeList[0] = new snakeBlock();
  5. gameOver = false;
  6. startGame = true;  //True when user clicks start button
  7. atNonGamePage = false;  //True when user is not playing the game
  8. applePresent = false;
6. By resetting all data everytime the user clicked the replay button, I abled the user to play the game again from the beginning.
7. The only problem that I had was how to show the restart button. At first, I thought and planned to make a while loop within the draw function, which didn't work out. Then I was able to think of making a boolean variable and change it to true whenever the snake is dead, that will allow the draw function to activate the end page via checking the boolean with if statement.
8. Except for little mistakes such as forgetting the semi-colon or missed spell codings, I was able to finish my project easily.

### Oct. 26th
1. Now I'm only left with the sound effects. Using the thechniques we learned from class, I downloaded the sound files, imported it, and downloaded soundeffects from internet so that it can be used in my program.
2. I have set two sound effects, one for the button pressed sound, and one for the snake's eating sound. Since my coding was perfectly done and organized, all I had to do was to make the sound effects within the functions that should go along with the sound.
3. For example, I made the program make a sound where the program checks if the button was and is clicked. So every time the button is clicked, it makes a simple sound. Same goes for when the snake eats the body piece. When the snake's head's position is equal to the randomly generated piece, it not only updates the wholeSnake list, but also make a sound.
4. Since most of the coding was organized and prepared, it wasn't hard for me to plug in the sound effects when a function was activated.
5. Done for my midterm project!
