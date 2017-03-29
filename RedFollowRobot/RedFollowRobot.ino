//pins
#define FRONT_IR A2
#define MID_IR A1
#define RIGHT_IR A0

#define MOTORL 22
#define MOTORR 23

uint16_t red = -1;
int Ltimeout = 0;

void motorL(int m)
{
  analogWrite(MOTORL, m);
}
void motorR(int m)
{
  analogWrite(MOTORR, m);
}

void left()
{
  Serial.println("Left");
  
  motorL(195);
  motorR(180);

}

void right()
{
  Serial.println("Right");

  motorL(250);
  motorR(5);
}

void straight()
{
  Serial.println("Straight");
  

  motorL(250);
  motorR(180);
}

void mstop()
{
  Serial.println("Stop");
  motorL(185);
  motorR(190);
}

void look()
{
  //spin right 
  Serial.println("Looking");
}

void procLoc()
{
  if(red > 233 && red < 359)
  {
    straight();
  }
  else if(red < 233 && red > -1)
  {
    left();
  }else if(red > 359 &&  red < 700)
  {
    right();
  }else
  {
    delay(5);
    
    Ltimeout ++;
    if(Ltimeout >= 300)
    {
      mstop();
      if(Ltimeout >= 600)
      {
        look();
      }
    }
  }
    red = -1;
}

void setup()
{
  Serial.begin(115200);
  //Serial.baud(9600);
  //set I/O pins
  pinMode(13,OUTPUT);
  pinMode(MOTORR, OUTPUT);
  pinMode(MOTORL, OUTPUT);
  pinMode(FRONT_IR, INPUT);
  pinMode(MID_IR, INPUT);
  pinMode(RIGHT_IR, INPUT);


  
  digitalWrite(13,HIGH); 
  

  //LEFT
  //Stop 190
  //Forward 200- 250
  //Reverse 20 - 180
  
  //RIGHT
  //Stop 190
  //Reverse 200- 250
  //Forward 20 - 180


/*
  for(int i = 0 ; i <255; i++)
  {
     analogWrite(MOTORL,i);
     Serial.println(i);
     delay (300);
  }
  
  analogWrite(MOTORL,190);
  digitalWrite(13,LOW);
  
  Serial.println("test");
  for(int i = 0 ; i <255; i++)
  {
     analogWrite(MOTORR,i);
     Serial.println(i);
     delay (300);
  }
  analogWrite(MOTORR, 185);

  delay(1000);
  */

}

void loop()
{
  
  if(Serial.available() > 0)
  {
    if(Serial.read() == 'G')
    {
      digitalWrite(13,HIGH);
      //sees red
      Ltimeout = 0;
      
      uint8_t low;
      uint8_t high;
      high = Serial.read();
      low = Serial.read();
      red  = (high << 8) | low;
      
      //Serial.println("Red Detected: ");  
      //Serial.println(red);
  
      Serial.print("RED FOUND: ");
      //Serial.print(low);
      //Serial.print("\t");
      //Serial.print(high);
      //Serial.print("\t");
      Serial.write(red);
    }else if(Serial.read() == 'N')
    {
      Serial.println("NO RED");
    }

    

    
  } else{
    Serial.println("NO COM");
    digitalWrite(13,LOW);
    red = -1;
  }
  procLoc();
  
  
}

