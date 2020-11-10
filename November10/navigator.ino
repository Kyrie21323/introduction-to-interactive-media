int potPosition;       //this variable will hold a value based on the position of the potentiometer
int pushButton = 4;    //button


// the setup routine runs once when you press reset:
void setup()
{
  Serial.begin(9600);       //start a serial connection with the computer

  pinMode(13, OUTPUT);      //set pin 13 as an output that can be set to HIGH or LOW
  pinMode(12, OUTPUT);      //set pin 12 as an output that can be set to HIGH or LOW
  pinMode(11, OUTPUT);      //set pin 11 as an output that can be set to HIGH or LOW

  pinMode(pushButton, INPUT);   //set pushbutton pin as input
}

void loop() {
  // read the input of the pin:
  int buttonState = digitalRead(pushButton);
  // print out the state of the button:
  Serial.println(buttonState);
  delay(1);

  //read the position of the pot
  potPosition = analogRead(A0);    //set potPosition to a number between 0 and 1023 based on how far the knob is turned
  Serial.println(potPosition);     //print the value of potPosition in the serial monitor on the computer

  //turn the LED on based on the pot value when the button is pressed
  if (buttonState == HIGH) {
    if (potPosition >= 0 && potPosition <= 300) {
      digitalWrite(13, HIGH);           // Turn on the LED1
      digitalWrite(12, LOW);            // Turn off the LED2
      digitalWrite(11, LOW);            // Turn off the LED3
    }
    else if (potPosition > 300 && potPosition <= 700) {
      digitalWrite(13, LOW);            // Turn off the LED1
      digitalWrite(12, HIGH);           // Turn on the LED2
      digitalWrite(11, LOW);            // Turn off the LED3
    }
    else {
      digitalWrite(13, LOW);            // Turn off the LED1
      digitalWrite(12, LOW);            // Turn off the LED2
      digitalWrite(11, HIGH);           // Turn on the LED3
    }
  }
  else if (buttonState == LOW) {
    if (potPosition >= 0 && potPosition <= 300) {
      digitalWrite(13, LOW);            // Turn off the LED1
      digitalWrite(12, LOW);            // Turn off the LED2
      digitalWrite(11, HIGH);           // Turn on the LED3
    }
    else if (potPosition > 300 && potPosition <= 700) {
      digitalWrite(13, HIGH);           // Turn on the LED1
      digitalWrite(12, LOW);            // Turn off the LED2
      digitalWrite(11, LOW);            // Turn off the LED3
    }
    else {
      digitalWrite(13, LOW);            // Turn off the LED1
      digitalWrite(12, HIGH);           // Turn on the LED2
      digitalWrite(11, LOW);            // Turn off the LED3
    }
  }
}
