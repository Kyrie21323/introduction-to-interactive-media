
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
  Serial.print(digitalRead(yellowButton));
  Serial.print(",");
  Serial.print(digitalRead(redButton));
  Serial.print(",");
  Serial.println(digitalRead(blueButton));
//  Serial.println(digitalRead(redPin));
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
