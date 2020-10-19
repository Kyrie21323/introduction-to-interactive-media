//A data visualization for two point shoots and three point shoots
//made, attempted, and the percentage for both shoots.
//Kyrie KunWoo Park Due October 6th
//Source of data
//=>https://www.basketball-reference.com/players/i/irvinky01.html
//The overall concept
//Your name and assignment due date
//Instructions for usage if it's interactive
//The source of your data


//Set a global list of strings to get the data from .csv file
//One for the header, and one for the data only
String[] header;
String[] all;

void setup() {
  size(1200, 800);
  all = loadStrings("irvingStats.csv");
  header = split(all[0], ',');
}

void draw() {
  //header
  String[] seasons;
  background(255);
  stroke(0);
  fill(0, 0, 0);
  textAlign(CENTER);
  text("Kyrie Irving Shooting Percentage Stats For Each Season", width/2, 15);
  for (int i = 1; i<10; i++) {
    int[] stats;
    float[] percentage;
    percentage = float(split(all[i], ','));
    stats = int(split(all[i], ','));
    seasons = split(all[i], ',');

    int threePMade = stats[1];
    int threePAttempts = stats[2];
    float threePer = percentage[3];
    int twoPMade = stats[4];
    int twoPAttempts = stats[5];
    float twoPer = percentage[6];
    String oneSeason = seasons[0];
    
    textAlign(0);
    translate(0, 50);
    fill(200, 200, 200);
    rect(130, 0, threePAttempts, 25);
    fill(0, 255, 60);
    rect(130, 0, threePMade, 25);
    fill(0, 0, 0);
    text("Season " + (i) + "       3 Point", 5, 15);
    text(str(threePMade), 135, 15);
    text(str(threePAttempts), threePAttempts + 135, 15);
    text(threePer + "%", threePMade + 135, 15);

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
  noLoop();
}
