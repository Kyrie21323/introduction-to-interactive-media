//A data visualization for two point shoots and three point shoots
//made, attempted, and the percentage for making shoots based on 
//Kyrie Irving's each season played.
//Kyrie KunWoo Park Due October 6th
//Source of data
//=>https://www.basketball-reference.com/players/i/irvinky01.html

//Set a global list of strings to get the data from .csv file
//One for the header, and one for the data only
String[] header;
String[] all;

//Basic setup for the canvas, which includes size and background color.
//Also call the .csv file and save it into the variable 'all', and split
//the whole .csv file for only the first row and save it into another list named 'header'
void setup() {
  background(255);
  size(1200, 800);
  all = loadStrings("irvingStats.csv");
  header = split(all[0], ',');
}

void draw() {
  stroke(0);
  fill(0, 0, 0);
  //align text to the center for the title.
  textAlign(CENTER);
  //print title
  text("Kyrie Irving Shooting Percentage Stats For Each Season", width/2, 15);
  //draw one of kyrie irving's season including 3 point shots made,
  //attempted, and the percentage of shots made. Then same for the 2 point shootings.
  //Put all in a for loop, until all of the seasons are drawn.
  for (int i = 1; i<10; i++) {
    //Initialize a string list to input which seasons are played by Kyrie Irving
    //Initialize two other lists, where one is for the number of shots made
    //and attempted(int), and one for the percentage of shots created(float).
    int[] stats;
    float[] percentage;
    String[] seasons;
    //call the 'all' list and save the data into each lists with i incrementing by one,
    //so it will input the data for each row in order.
    percentage = float(split(all[i], ','));
    stats = int(split(all[i], ','));
    seasons = split(all[i], ',');
    
    //initialize integers and float variables to contain the exact number of shots made,
    //attempted, and percentage of shots made according to the data file imported(.csv)).
    int threePMade = stats[1];
    int threePAttempts = stats[2];
    float threePer = percentage[3];
    int twoPMade = stats[4];
    int twoPAttempts = stats[5];
    float twoPer = percentage[6];
    String oneSeason = seasons[0];
    
    //set the text align back to 0, so it would draw from the left most.
    textAlign(0);
    //Since I am drawing one season each, with i incrementing by one in a for loop,
    //every time one season is drawn,
    //I decided to translate the next season's data visualization in order to
    //give distinction between the one before and after.
    translate(0, 50);
    //fill the rectangulars of shots created with gray to show that it attempted.
    fill(200, 200, 200);
    //The width of the rectangle would be the number of shots made
    rect(130, 0, threePAttempts, 25);
    //fill the rectangulars of shot attempted with green, so that it will show the shots
    //were made. For the part where the rectangle of shots made does not cover
    //the rectangle of shots attempted, it will stay gray to show how much was missed.
    fill(0, 255, 60);
    rect(130, 0, threePMade, 25);
    //change the color to black since texts needs to be dark and easy to read.
    fill(0, 0, 0);
    //print texts and the value of shots made, attempted, and also the percentage
    //of shots made.
    text("Season " + (i) + "       3 Point", 5, 15);
    text(str(threePMade), 135, 15);
    text(str(threePAttempts), threePAttempts + 135, 15);
    text(threePer + "%", threePMade + 135, 15);
    
    //translate to the height of the rectangles so that the bars from the graph
    //won't overlap.
    //Drawing the rectangles and values for 2 point shots are used with the same logic
    //from above.
    translate(0, 25);
    fill(200, 200, 200);
    rect(130, 0, twoPAttempts, 25);
    fill(0, 255, 60);
    rect(130, 0, twoPMade, 25);
    fill(0, 0, 0);
    text(oneSeason + "       2 Point", 5, 15); 
    text(str(twoPMade), 135, 15);
    text(str(twoPAttempts), twoPAttempts + 135, 15);
    text(twoPer + "%", twoPMade + 135, 15);
  }
  //end drawing after all of the datas for each seasons are visualized.
  noLoop();
}
