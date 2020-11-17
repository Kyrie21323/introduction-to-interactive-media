//set the pins for the button and buzzer
int redKeyPin = 5;
int blueKeyPin = 6;
int potPosition;        //value based on how much the potentiometer is turned
int buzzerPin = 10;

void setup() {
  //set the button pins as inputs
  pinMode(redKeyPin, INPUT);
  pinMode(blueKeyPin, INPUT);

  //set the buzzer pin as an output
  pinMode(buzzerPin, OUTPUT);
}

void loop() {
  //read the position of the pot
  potPosition = analogRead(A0);               //set potPosition to a number between 0 and 1023 based on how much
  //the knob is turned
  Serial.println(potPosition);                //print potPosition to monitor its value

  if (potPosition >= 0 && potPosition <= 300) {   //if the potentiometer is turned little
    if (digitalRead(redKeyPin) == LOW) {        //if the red key is pressed
      tone(buzzerPin, 262);                     //play the frequency for lower c
    }
    else if (digitalRead(blueKeyPin) == LOW) {  //if the blue key is pressed
      tone(buzzerPin, 523);                     //play the frequency for upper c
    }
    else {
      noTone(buzzerPin);                        //if neither key is pressed the buzzer is turned off
    }
  }
  else if (potPosition > 300 && potPosition <= 700) {   //if the potentiometer is turned middle
    if (digitalRead(redKeyPin) == LOW) {        //if the red key is pressed
      tone(buzzerPin, 294);                     //play the frequency for lower d
    }
    else if (digitalRead(blueKeyPin) == LOW) {  //if the blue key is pressed
      tone(buzzerPin, 587);                     //play the frequency for upper d
    }
    else {
      noTone(buzzerPin);                        //if neither key is pressed the buzzer is turned off
    }
  }
  else {
    if (digitalRead(redKeyPin) == LOW) {        //if the red key is pressed
      tone(buzzerPin, 330);                     //play the frequency for lower e
    }
    else if (digitalRead(blueKeyPin) == LOW) {  //if the blue key is pressed
      tone(buzzerPin, 659);                     //play the frequency for upper e
    }
    else {
      noTone(buzzerPin);                        //if neither key is pressed the buzzer is turned off
    }
  }
}
