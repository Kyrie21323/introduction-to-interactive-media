// digital pin 4,5,6 has a pushbuttons attached to it. Give them a name:
int pushButton1 = 6;  //button 1
int pushButton2 = 5;  //button 2
int pushButton3 = 4;  //button 3


// the setup routine runs once when you press reset:
void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
  // make the pushbuttons' pins an input:
  pinMode(pushButton1, INPUT);
  pinMode(pushButton2, INPUT);
  pinMode(pushButton3, INPUT);
  pinMode(7, OUTPUT); // light 1
  pinMode(8, OUTPUT); // light 2
  pinMode(9, OUTPUT); // light 3
}

// the loop routine runs over and over again forever:
void loop() {
  // read the inputs of the three pins:
  int buttonState1 = digitalRead(pushButton1);
  int buttonState2 = digitalRead(pushButton2);
  int buttonState3 = digitalRead(pushButton3);
  // print out the state of the three buttons:
  Serial.println(buttonState1);
  Serial.println(buttonState2);
  Serial.println(buttonState3);
  delay(1);// delay in between reads for stability// delay in between reads for stability
  // if and else statements turning on and off lights when the corresponding buttons are pressed
  if (buttonState1 == LOW) {    // for button 1 not being pressed
    digitalWrite(9, HIGH);      // light 3 is turned on
  } else {
    if (buttonState2 == LOW) {  // for button 2 not being pressed while 1 is pressed
      digitalWrite(7, HIGH);    // light 1 is turned on
    } else {                    // for button 2 being pressed while 1 is pressed
      digitalWrite(7, LOW);     // light 1 is turned off
    }
  }
  if (buttonState2 == LOW) {    // for button 2 not being pressed
    digitalWrite(8, LOW);       // light 2 is turned off
  } else {                      // for button 2 being pressed
    digitalWrite(8, HIGH);      // light 2 is turned on
    digitalWrite(9, LOW);       // light 3 is turned off
  }
  if (buttonState3 == LOW) {    // for button 3 not being pressed
    digitalWrite(7, LOW);       // light 1 is turned off
  } else {                      // for button 3 being pressed
    digitalWrite(8, HIGH);      // light 2 is turn on
  }
}
