/*
 * Blink
 *
 * The basic Arduino example.  Turns on an LED on for one second,
 * then off for one second, and so on...  We use pin 13 because,
 * depending on your Arduino board, it has either a built-in LED
 * or a built-in resistor so that you need only an LED.
 *
 * http://www.arduino.cc/en/Tutorial/Blink
 */

#include "WProgram.h"
void setup();
void loop();
int ledPin = 13;                // LED connected to digital pin 13
int ledPin12 = 12;              // LED connected to digital pin 12
int ledint = 1;                      // timing number
void setup()                    // run once, when the sketch starts
{
  pinMode(ledPin, OUTPUT);      // sets the digital pin as output
  pinMode(ledPin12, OUTPUT);     // sets the digital pin as output
}

void loop()                     // run over and over again
{
  digitalWrite(ledPin, HIGH);   // sets the LED on
  digitalWrite(ledPin12, LOW);   // sets the LED off
  delay(ledint);                  // waits for a second
  digitalWrite(ledPin, LOW);    // sets the LED off
  digitalWrite(ledPin12, HIGH);    // sets the LED on
  delay(ledint);                  // waits for a second
}

int main(void)
{
	init();

	setup();
    
	for (;;)
		loop();
        
	return 0;
}

