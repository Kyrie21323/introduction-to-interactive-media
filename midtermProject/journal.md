# Journal for Midterm Project: Make A Game!
## Plan
### Preliminary Description
I have been planning my midterm project to be a well-known game "Screen Snake"
Screen snake is a single player game where the player uses the direction keys on the key board to move the snake on the screen. There will be randomly generated pieces of the snake's body on the screen, and when the snake eats the piece, the snake gets longer and another piece of the body will be generated randomly.

### Planned Steps
1. Call images for the snake's head and body.

2. Set the whole draw function into a while loop -> Let the user continue the game when dead by pressing the enter key, and end the loop when user clicks the quit button on the canvas.

3. Make a three functions to make the starting page of the game.
   -Draw shapes to design the starting page (Haven't come up with an idea yet, but probably will draw a snake).
   -Make buttons that start the game and show informations of how to play (Each button for one function).
    -If the button for showing information is clicked, show a text of instructions and also images to support the user to understand the directions.

4. Make a function that makes the ending page of the game.
   -Get a string into the function, and if the string is equal to 'wall', show the end page with a text showing "You died because you hit the wall."
    -If the string is equal to 'bite', the text should show 'You died because you have bitten yourself."

5. Make four functions that change the direction of the snake if the direction key is pressed.

6. Make another function that returns a sound when the location of the snake's head is overlapped with the randomly placed body pieces.

7. Make a function that runs the game
   ->Claim a global list that contains only the head picture of the snake.
   ->Via calling the four direction key functions, able the snake to change it's direction.
   ->If the head touches the randomly placed body parts, expand, or append the body picture into the list, and let the function print the whole list.
   ->Also call the sound function to return a sound when the snake list is appended.
   ->If the snake's head reaches the end of the canvas, claim a string variable to 'wall', and if the location of the snake's head is exactly the same with any        other body parts that are already in the list, claim it as 'bite' and call the end page function.

8. In the draw function, call the game function and put it in a while loop, and break the loop if and only if what I said in step 2.

## Journal on Progress
### Oct. 19th
