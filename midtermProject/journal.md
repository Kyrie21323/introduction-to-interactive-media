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
### Oct. 19th
1. I tried to find images of the snake's head and body, but instead, I decided to use shapes for both head and body, and images for the design of the starting page.
2. Also, instead of letting the user to press a key on the keyboard, I have decided to let them press buttons that are visually made in the game so that the user may choose to view the instructions, play the game, or replay the game when dead. The idea of letting the user to use mouse instead of keys came from the fact that I am not able to make functions that are activated when a key is pressed ^^;.
3. I have been able to finish the starting page including two buttons - 'How to play', and 'Start'. The functions of the buttons worked at the end of the day, but I had a hard time using 'mouseClicked' functions and if statements with mouseX and mouseY variables since there was an error that boolean and integers cannot be compared. I don't know the exact reason why it didn't work, but I've tried different algorithms, and now it works with the coding style i have now.
4. When the mouse is clicked on top of the button visualized on the starting page, I was able to successfully change the page. By clearing the whole canvas and drawing another image, I could check that the mouseClicked function works, and tomorrow, I will be designing the instruction page as well as the how to game will work.
5. Eventhough I was able to avoid using the key pressed fuction for the starting page, I will eventually have to know how it works since screen snake is a game where the user constantly types the direction key to move the snake. Im worried how I will get thorugh this phase.

### Oct. 20th
1. Today I have designed the instruction page, where it shows the on-screen text as well as two buttons, one named 'Back' that allows the user to go back to the starting page, and one named "Start" which allows the user to actually start the game.
2. Different from what I have planned, instead of making three different functions for my starting page, since I had to make the pages change depending on what the user clickes on, I have made three different functions that draw the buttons, and one function, mouseClicked, that draws new pages if the button is clicked. The starting page is drawn within the setup function, calling the two button functions (Start and How to play), and also an image for the background and the design.
