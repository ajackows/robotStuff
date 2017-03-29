import javax.media.opengl.*;
import processing.opengl.*;
import processing.opengl.*;
import processing.serial.*;
import javax.swing.JPanel;
import java.awt.*;

int IgnoreYAW = 0;

Serial COMport;                              // The serial port
PFont font24,font18,font9;
PrintWriter LogOutput,GeoOutput;

// Sensor Data
float Roll,Pitch,Yaw;
float q0, q1, q2, q3;
float AccX,AccY,AccZ;
float GyrX,GyrY,GyrZ;
float MagX,MagY,MagZ;
float Press,AltM,Temp;
float SOG,COG,Lat,Lon,Alt,Climb;
float met;
float met_tick = 0;
int sec, min, hr;
String met_string;
int numFiles;
int GPSfix=-9999;
String State, Substate;
boolean Armed;
String DisplayString ="---";
String serialString ="---";
String FileName;
String GoogleMapURL = "";
boolean firstMap = false;

PImage map;
float mapLat, mapLon;
int zoom = 12;

long Data_timer=0; 
int LiveData=0;

int offset = -1;

// Command Button Variables
boolean launch = false, meco = false, first_sep = false, sec_ign = false, apogee = false, chute = false, landed = false, close_file = false, arm_button = false, disarm_button = false, zoomIn = false, zoomOut = false;
boolean arm_pressed, disarm_pressed;
int commandsUsed = 0;
  
void setup(){
   
  // Setup Display
  size(1500,550, OPENGL);
  //ortho(-width/2,width/2,-height/2,height/2,-1000,1000);  //Added to avoid aircraft view distorsion because aircraft model not centered in field of vien screen Bejo 2009-11-
  noStroke();
  smooth();
  font9 = loadFont("SansSerif-9.vlw"); 
  font18 = loadFont("SansSerif-18.vlw"); 
  font24 = loadFont("SansSerif-24.vlw"); 
  textFont(font24); 

  // Setup log file  use sFileNameBase plus current time and date to name file
  FileName = sFileNameBase+String.valueOf(day())+String.valueOf(month())+String.valueOf(year())+"_"+String.valueOf(hour())+String.valueOf(minute());
  LogOutput = createWriter(FileName+".txt");
  GeoOutput = createWriter(FileName+".csv");
  GeoOutput.println("Latitude,Longitude,Roll,Pitch,Yaw,Speed,Course,Altitude,Climb");

  // Setup Serial Port
  println(Serial.list());
  COMport = new Serial(this, Serial.list()[COMPORT], baudRate);
  COMport.bufferUntil('\n');
  COMport.clear();                                     // clear the serial buffer:
    
}

void draw(){

  background(cBackground);
  if(millis() - Data_timer > tDataErrDelay) LiveData=0;

  if(LiveData==1){
    
    update(mouseX, mouseY);
    
    offset = -1;
    arm_pressed = false;
    disarm_pressed = false;
    
    if(Armed) {
      if(launch){
        launch = false;
        offset = 0;
      } else if(meco){
        meco = false;
        offset = 1;
      } else if(first_sep){
        first_sep = false;
        offset = 2;
      } else if(sec_ign){
        sec_ign = false;
        offset = 3;
      } else if(apogee){
        apogee = false;
        offset = 4;
      } else if(chute){
        chute = false;
        offset = 5;
      } else if(landed){
        landed = false;
        offset = 6;
      }
    }
    
    if(close_file){
      close_file = false;
      offset = 7;
    } else if(arm_button) {
      arm_pressed = true;
      fill(cArm);
      arm_button = false;
      rect(0,430,125,40);
    } else if(disarm_button) {
      disarm_pressed = true;
      fill(cDisarm);
      disarm_button = false;
      rect(125,430,125,40);
    } 
    
    fill(cButton);
    
   if(offset > -1) 
      rect(offset*125,470,125,50);
        
   if(State.equals("Ground"))
      commandsUsed = 0;
    else if(State.equals("Ascent:")) {
      if(Substate.equals("First Burn"))
        commandsUsed = 1;
      else if(Substate.equals("First Sep"))
        commandsUsed = 3;
      else if(Substate.equals("Second Ign"))
        commandsUsed = 4;
      else if(Substate.equals("Second Burn"))
        commandsUsed = 4;
    } else if(State.equals("Descent:")) {
      if(Substate.equals("Drogue"))
        commandsUsed = 5;
      else if(Substate.equals("Main Chute"))
        commandsUsed = 6;
      else if(Substate.equals("Landed"))
        commandsUsed = 7;
    }
   
    if(Armed) {
      fill(cButtonBorder);
      rect(0,470,125*commandsUsed,50);
      fill(cButton);
      int i;
      for(i=0;i<commandsUsed;i++)
        rect(5+125*i,475,115,40);
        
      fill(cArm);
      rect(0,430,125,40);
    } else {
      fill(cDisarm);
      rect(125,430,125,40);
    }
            
    // Draw Lines around screen sections
    stroke(cFinelines);
    strokeWeight(1);
    strokeCap(ROUND);
    line(250,0,250,470);
    line(500,0,500,470);
    line(0,470,1000,470);
    line(0,430,250,430);
    line(0,90,250,90);
    line(0,520,1000,520);
    line(1000,0,1000,550);
    line(0,390,250,390);
    line(125,430,125,470);
    line(875,470,875,520);
    
    textFont(font18); 
    fill(cNormalText);         //text colour
    text("Close File", 895, 500);
    text("Arm", 45,455);
    text("Disarm", 155,455);
    if(Armed) {
      text("Launch", 30, 500);
      text("MECO", 160, 500);
      text("First Sep", 275, 500);
      text("2nd Ignition", 385, 500);
      text("Apogee", 530, 500);
      text("Main Chute", 638, 500);
      text("Landed", 780, 500);
      
      line(125,470,125,520);
      line(250,470,250,520);
      line(375,470,375,520);
      line(500,470,500,520);
      line(625,470,625,520);
      line(750,470,750,520);
    }
    
    
   
    if (DrawAirCraft==1)
      //drawCraft(Roll*RollTransform, Yaw*YawTransform, Pitch*PitchTransform,750, 200,250);
      drawCraft(q0, q1, q2, q3, 750, 340, 250); 
    else
      drawHUD(Roll*RollTransform, Yaw*YawTransform, Pitch*PitchTransform,750, 200,250); 

    drawAngle(Roll,600, 400, 100,"Roll",cRoll);
    drawAngle(Pitch,750, 400, 100,"Pitch",cPitch);  
    drawAngle(Yaw,900, 400, 100,"Yaw",cYaw);        

    textFont(font24);          //text font
    fill(cNormalText);         //text colour
    textAlign(LEFT,BASELINE);  //text alignment       

    text("ROLL", 10, 25);
    text(Roll, 100, 25);
    text("PITCH", 10, 50);
    text(Pitch, 100, 50);
    text("YAW", 10, 75);
    text(Yaw, 100, 75);

    text("GPS", 10, 120);
    if (GPSfix==1)
    { 
      fill(0, 240, 0);
      rect(225, 100, 20, 20);
      fill(cNormalText);         //text colour
      text("OK", 100, 120);
      text("Speed", 10, 145);
      text(SOG, 100, 145);
      text("Course", 10, 170);
      text(COG, 100, 170);
      text("Lat", 10, 195);
      text(mapLat, 100, 195);
      text("Lon", 10, 220);
      text(mapLon, 100, 220);
      text("Alt", 10, 245);
      text(Alt, 100, 245);
      text("Climb", 10, 270);
      text(Climb, 100, 270);
      
      if(met - met_tick > 5.0)
      {
        firstMap = true;
        met_tick = met;
        GoogleMapURL = String.format("http://maps.googleapis.com/maps/api/staticmap?center=%f,%f&zoom=%d&size=500x550&maptype=satellite&markers=color:yellow", mapLat, mapLon, zoom) + "%7C" + String.format("%f,%f", mapLat, mapLon) + "%7C&sensor=true";
        map = loadImage(GoogleMapURL, "png");
      }
      if(firstMap && map != null)
        image(map, 1000, 0);
        
      fill(cZoom);
      rect(1470,0,30,30);
      rect(1470,60,30,30);
      textFont(font24); 
      fill(cNormalText);
      text("+",1475,21);
      text("-",1478,82);
      text(zoom, 1469,54);
    }
    else
    {
      fill(cErrorText);         //text colour
      text("No FIX", 100, 120);
      text("No FIX", 1225, 265);
      rect(225, 100, 20, 20);
    }

    // Display Analog values
    textFont(font18); 
    fill(cNormalText);         //text colour
    // Accelerometers
    text("AccX ", 255, 25);
    text(AccX, 310, 25);
    drawBar(AccX,400, 10, 100,255,cAccXBar);
    fill(cNormalText);         //text colour
    text("AccY ", 255, 50);
    text(AccY, 310, 50);
    drawBar(AccY,400, 35, 100,255,cAccYBar);
    fill(cNormalText);         //text colour
    text("AccZ ", 255, 75);
    text(AccZ, 310, 75);
    drawBar(AccZ,400, 60, 100,255,cAccZBar);

    // Gyros
    fill(cNormalText);         //text colour
    text("GyrX ", 255, 110);
    text(GyrX, 310, 110);
    drawBar(GyrX,400, 95, 100,255,cGyrXBar);
    fill(cNormalText);         //text colour
    text("GyrY ", 255, 135);
    text(GyrY, 310, 135);
    drawBar(GyrY,400, 120, 100,255,cGyrYBar);
    fill(cNormalText);         //text colour
    text("GyrZ ", 255, 160);
    text(GyrZ, 310, 160);
    drawBar(GyrZ,400, 145, 100,255,cGyrZBar);

    //Magnetometer
    fill(cNormalText);          //text colour
    text("MagX ", 255, 195);
    text(MagX, 310, 195);
    drawBar(MagX,400, 180, 100,2500,cMagXBar);
    fill(cNormalText);         //text colour
    text("MagY ", 255, 220);
    text(MagY, 310, 220);
    drawBar(MagY,400, 205, 100,2500,cMagYBar);
    fill(cNormalText);         //text colour
    text("MagZ ", 255, 245);
    text(MagZ, 310, 245);
    drawBar(MagZ,400, 230, 100,2500,cMagZBar);
    
    //Altimeter
    fill(cNormalText);          //text colour
    text("Press", 255, 280);
    text(Press, 310, 280);
    //drawBar(Press,400, 180, 100,255,cPressBar);
    fill(cNormalText);         //text colour
    text("AltM", 255, 305);
    text(AltM, 310, 305);
    //drawBar(AltM,400, 205, 100,255,cAltMBar);
    fill(cNormalText);         //text colour
    text("Temp", 255, 330);
    text(Temp, 310, 330);
    //drawBar(Temp,400, 230, 100,255,cTempBar);
    
    //State, MET, Number of SD Files
    fill(cNormalText);          //text colour
    text("MET", 255, 365);
    text(met_string, 310, 365);
    //drawBar(Press,400, 180, 100,255,cPressBar);
    fill(cNormalText);          //text colour
    text("State", 255, 390);
    text(State, 310, 390);
    if(!State.equals("Ground"))  
      text(Substate, 310, 415);
    //drawBar(Press,400, 180, 100,255,cPressBar);
    fill(cNormalText);
    text("SD Files", 255, 440);
    text(numFiles, 330, 440);

    // Status Info
    fill(cNormalText);         //text colour
    textFont(font18); 
    if (IgnoreYAW==1) 
    { 
      fill(cNormalText);         //text colour
      text("YAW OFF", 10, 405);
    }
    fill(cNormalText);         //text colour
    if (LiveData==0) 
      fill(cErrorText);         //text colour
    if (GeoData==1) 
      text("+GEO", 50, 425);
    if (LogData==1) 
    { 
      text("LOG", 10, 425);
      textFont(font9); 
      text(FileName, 105, 425);

    }
    // Show raw serial data
    textFont(font9); 
    fill(cNormalText);         //text colour
    text(DisplayString, 10, 522, 980, 25); 
  }
  else
  {
    stroke(cFinelines);
    strokeWeight(1);
    strokeCap(ROUND);
    line(0,520,1000,520);
    line(1000,0,1000,550);
    
    // Show raw serial data
    textFont(font9); 
    fill(cNormalText);         //text colour
    text(serialString, 10, 522, 980, 25);
    
    textFont(font24);          //text font
    fill(cErrorText);         //text colour
    textAlign(CENTER,CENTER);  //text alignment       
    text("NO DATA", width/2.0, height/2.0);
  }
}

void update(int x, int y) {
  if(x>0 && x<125 && y>470 && y<520)
    launch = true;
  else if(x>125 && x<250 && y>470 && y<520)
    meco = true;
  else if(x>250 && x<375 && y>470 && y<520)
    first_sep = true;
  else if(x>375 && x<500 && y>470 && y<520)
    sec_ign = true;
  else if(x>500 && x<625 && y>470 && y<520)
    apogee = true;
  else if(x>625 && x<750 && y>470 && y<520)
    chute = true;
  else if(x>750 && x<875 && y>470 && y<520)
    landed = true;
  else if(x>875 && x<1000 && y>470 && y<520)
    close_file = true;
  else if(x>0 && x<125 && y>430 && y<470)
    arm_button = true;
  else if(x>125 && x<250 && y>430 && y<470)
    disarm_button = true;
  else if(x>1470 && x<1500 && y>0 && y<30)
    zoomIn = true;
  else if(x>1470 && x<1500 && y>60 && y<90)
    zoomOut = true;
  else
    launch = meco = first_sep = sec_ign = apogee = chute = landed = close_file = arm_button = disarm_button = zoomIn = zoomOut = false;
}

void mouseClicked() {
   if(offset == 0)
     COMport.write(76);
   else if(offset == 1)
     COMport.write(77);
   else if(offset == 2)
     COMport.write(83);
   else if(offset == 3)
     COMport.write(85);
   else if(offset == 4)
     COMport.write(65);
   else if(offset == 5)
     COMport.write(80);
   else if(offset == 6)
     COMport.write(68);
   else if(offset == 7)
     COMport.write(70);
   else if(arm_pressed)
     COMport.write(71);
   else if(disarm_pressed)
     COMport.write(78);
   else if(zoomIn && zoom < 21)
       zoom++;
   else if(zoomOut && zoom > 0)
       zoom--;
}

// Detect Key presses and act on them
void keyPressed() { 
  if (key == 'q' || key == 'Q'){ 
    LogOutput.flush(); // Write the remaining data
    LogOutput.close(); // Finish the file
    GeoOutput.flush(); // Write the remaining data
    GeoOutput.close(); // Finish the file
    exit(); // Stop the program
  }
  if (key == 'g' || key == 'G'){
    if(GeoData==1)
      GeoData = 0;
    else
      GeoData = 1;
  }
  if (key == 'l' || key == 'L'){
    if(LogData==1)
      LogData = 0;
    else
      LogData = 1;
  }
  if (key == 'y' || key == 'Y'){
    if(IgnoreYAW==1)
      IgnoreYAW = 0;
    else
      IgnoreYAW = 1;
  }
  if (key == 'c' || key == 'C')
    COMport.write(67);
}























