//IM Assignment Final: Grow a plant
//Kyrie Park
//Description: 
//This is a simple game to grow a plant by giving water, sunlight and killing bugs that are randomly made during the game is run. There is not ending for this
//game, and it will only end if the plant is out of leaves which is caused due to increasing bugs. There will be three buttons, yellow, red and blue where each
//represents giving sunlight, killing bugs, and giving water.

//===================================================================================================================================

//Global variables
const int yellowButton = 13;    //yellow button
const int redButton = 12;  //red button
const int blueButton = 11;   //blue button
const int redPin = 6; // the pin that the LED is attached to
int incomingByte;      // a variable to read incoming serial data into

void setup() {
  // initialize the serial communication:
  Serial.begin(9600);
  // initialize the LED pin as an output:
  pinMode(redPin, OUTPUT);
}

void loop() {
  // print all serials in one line where each values are seperated by commas.
  // each line represents all values in each loop
  Serial.print(digitalRead(yellowButton));
  Serial.print(",");
  Serial.print(digitalRead(redButton));
  Serial.print(",");
  Serial.println(digitalRead(blueButton));
  
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
  }

}
