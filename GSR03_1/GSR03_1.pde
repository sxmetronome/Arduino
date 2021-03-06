/*
Galvanic Skin Response meter
Chris Kairalla
 */
#define smooth 20     //2 smooths the last two nums, 3 smooths the last 3...
int oldReading = 0;    // variable to hold the old analog value
int analogValueSmooth = 0;
int thresh = 10;
int smoothArray[smooth];
//set baud rate
int baud = 19200;
boolean bluetooth = false;
void setup()
{
  Serial.begin(baud);	// opens serial port, sets data rate to 19200 bps
  if (bluetooth){
  Serial.print("+++");
  Serial.print(13, BYTE);//print cr
  Serial.print("                                       ATSN,cdkBluetooth");
  Serial.print(13, BYTE);//print cr
                  }
}

void loop() {
    addToArray();
    int smoothReading = findAverage();
    if (smoothReading > -1){
      int diff = smoothReading - oldReading;
     //the op amp inverts, so we're flipping the numbers
     Serial.print(1023-smoothReading);
     Serial.print(44, BYTE); //print comma
    }
    oldReading = smoothReading;
}

void addToArray(){
      for (int i = smooth-1; i >= 1; i--){
        smoothArray[i] = smoothArray[i-1]; //shift every num up one slot
      }
   smoothArray[0] = analogRead(5);  //add latest reading into slot 5
}

//finds the average of all the values in the array
int findAverage(){
  int average = 0;
  for (int i = 0; i < smooth; i++){
    average += smoothArray[i];
  }
  average = average / smooth;
  return average;
}
