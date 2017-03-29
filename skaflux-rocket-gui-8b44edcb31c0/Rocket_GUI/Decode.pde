void serialEvent(Serial COMport) {
  serialString = COMport.readStringUntil('\n');   // read all incoming data until you get a newline: 
  if (serialString != null){
    DisplayString = DecodeData(serialString);
    if (DisplayString.length()>1){ //check we have data returned
      Data_timer=millis(); //Restarting timer...  
      LiveData=1;  
      if (LogData==1) LogOutput.println(DisplayString);
      if (GeoData==1) GeoOutput.println(Lat+","+Lon+","+Roll+","+Pitch+","+Yaw+","+SOG+","+COG+","+Alt+","+Climb);
    }
  }
}
String DecodeData(String DataString) 
{
  int index;
  String data;
  String temp = "";
  
  int StartIdx = DataString.indexOf("!");
  int EndIdx = DataString.indexOf("*");
  if(StartIdx>-1 && EndIdx>StartIdx && DataString.length() > 145)
  {
    data = DataString;
    
    for(index = StartIdx+1; index<data.length() && data.charAt(index) != ','; index++)
    {
      temp += data.charAt(index);
    }
    data = data.substring(index + 1);
    q0 = parseFloat(temp);
    temp = "";
    
    for(index = 0; index<data.length() && data.charAt(index) != ','; index++)
    {
      temp += data.charAt(index);
    }
    data = data.substring(index + 1);
    q1 = parseFloat(temp);
    temp = "";
    
    for(index = 0; index<data.length() && data.charAt(index) != ','; index++)
    {
      temp += data.charAt(index);
    }
    data = data.substring(index + 1);
    q2 = parseFloat(temp);
    temp = "";
    
    for(index = 0; index<data.length() && data.charAt(index) != ','; index++)
    {
      temp += data.charAt(index);
    }
    data = data.substring(index + 1);
    q3 = parseFloat(temp);
    temp = "";

    float gx = 2 * (q1*q3 - q0*q2);
    float gy = 2 * (q0*q1 + q2*q3);
    float gz = q0*q0 - q1*q1 - q2*q2 + q3*q3;
    Yaw = degrees(atan2(2 * q1 * q2 - 2 * q0 * q3, 2 * q0*q0 + 2 * q1 * q1 - 1));
    Pitch = degrees(atan(gx / sqrt(gy*gy + gz*gz)));
    Roll = degrees(atan2(gy , sqrt(gx*gx + gz*gz)));
    
    for(index = 0; index<data.length() && data.charAt(index) != ','; index++)
    {
      temp += data.charAt(index);
    }
    data = data.substring(index + 1);
    AccX = parseFloat(temp);
    temp = "";
    
    for(index = 0; index<data.length() && data.charAt(index) != ','; index++)
    {
      temp += data.charAt(index);
    }
    data = data.substring(index + 1);
    AccY = parseFloat(temp);
    temp = "";
    
    for(index = 0; index<data.length() && data.charAt(index) != ','; index++)
    {
      temp += data.charAt(index);
    }
    data = data.substring(index + 1);
    AccZ = parseFloat(temp);
    temp = "";
    
    for(index = 0; index<data.length() && data.charAt(index) != ','; index++)
    {
      temp += data.charAt(index);
    }
    data = data.substring(index + 1);
    GyrX = parseFloat(temp);
    temp = "";
    
    for(index = 0; index<data.length() && data.charAt(index) != ','; index++)
    {
      temp += data.charAt(index);
    }
    data = data.substring(index + 1);
    GyrY = parseFloat(temp);
    temp = "";
    
    for(index = 0; index<data.length() && data.charAt(index) != ','; index++)
    {
      temp += data.charAt(index);
    }
    data = data.substring(index + 1);
    GyrZ = parseFloat(temp);
    temp = "";
    
    for(index = 0; index<data.length() && data.charAt(index) != ','; index++)
    {
      temp += data.charAt(index);
    }
    data = data.substring(index + 1);
    MagX = parseFloat(temp);
    temp = "";
    
    for(index = 0; index<data.length() && data.charAt(index) != ','; index++)
    {
      temp += data.charAt(index);
    }
    data = data.substring(index + 1);
    MagY = parseFloat(temp);
    temp = "";
    
    for(index = 0; index<data.length() && data.charAt(index) != ','; index++)
    {
      temp += data.charAt(index);
    }
    data = data.substring(index + 1);
    MagZ = parseFloat(temp);
    temp = "";
    
    for(index = 0; index<data.length() && data.charAt(index) != ','; index++)
    {
      temp += data.charAt(index);
    }
    data = data.substring(index + 1);
    Press = parseFloat(temp);
    temp = "";
    
    for(index = 0; index<data.length() && data.charAt(index) != ','; index++)
    {
      temp += data.charAt(index);
    }
    data = data.substring(index + 1);
    AltM = parseFloat(temp);
    AltM = AltM * 3.28;
    temp = "";
    
    for(index = 0; index<data.length() && data.charAt(index) != ','; index++)
    {
      temp += data.charAt(index);
    }
    data = data.substring(index + 1);
    Temp = parseFloat(temp);
    temp = "";
    
    for(index = 0; index<data.length() && data.charAt(index) != ','; index++)
    {
      temp += data.charAt(index);
    }
    data = data.substring(index + 1);
    Lat = parseFloat(temp);
    mapLat = (int)(Lat/100) + (Lat - 100*(int)(Lat/100))/60;     // Convert to degrees
    temp = "";
    
    for(index = 0; index<data.length() && data.charAt(index) != ','; index++)
    {
      temp += data.charAt(index);
    }
    data = data.substring(index + 1);
    Lon = parseFloat(temp);
    mapLon = (int)(Lon/100) + (Lon - 100*(int)(Lon/100))/60;     // Convert to degrees
    temp = "";
    
    for(index = 0; index<data.length() && data.charAt(index) != ','; index++)
    {
      temp += data.charAt(index);
    }
    data = data.substring(index + 1);
    Alt = parseFloat(temp);
    temp = "";
    
    
    for(index = 0; index<data.length() && data.charAt(index) != ','; index++)
    {
      temp += data.charAt(index);
    }
    data = data.substring(index + 1);
    COG = parseFloat(temp);
    temp = "";
    
    for(index = 0; index<data.length() && data.charAt(index) != ','; index++)
    {
      temp += data.charAt(index);
    }
    data = data.substring(index + 1);
    SOG = parseFloat(temp);
    SOG *= 1.15077945;          // Convert knots to mph
    temp = "";
    
    for(index = 0; index<data.length() && data.charAt(index) != ','; index++)
    {
      temp += data.charAt(index);
    }
    data = data.substring(index + 1);
    if (temp.equals("A"))
      GPSfix = 1;
    else
      GPSfix = 0;
    temp = "";
    
    for(index = 0; index<data.length() && data.charAt(index) != ','; index++)
    {
      temp += data.charAt(index);
    }
    data = data.substring(index + 1);
    met = parseFloat(temp);
    hr = (int)(met/3600);
    min = (int)((met%3600)/60);
    sec = (int)((met%3600)%60);
    met_string = String.format("%02d:%02d:%02d", hr, min, sec);
    temp = "";
    
    for(index = 0; index<data.length() && data.charAt(index) != ','; index++)
    {
      temp += data.charAt(index);
    }
    data = data.substring(index + 1);
    if(temp.equals("0"))
      Armed = false;
    else if(temp.equals("1"))
      Armed = true;
    temp = "";
    
    for(index = 0; index<data.length() && data.charAt(index) != ','; index++)
    {
      temp += data.charAt(index);
    }
    data = data.substring(index + 1);
    if(temp.equals("0"))
      State = "Ground";
    else if(temp.equals("1"))
      State = "Ascent:";
    else
      State = "Descent:"; 
    temp = "";
    
    for(index = 0; index<data.length() && data.charAt(index) != ','; index++)
    {
      temp += data.charAt(index);
    }
    if(State.equals("Ascent:")) {
      if(temp.equals("0"))
        Substate = "First Burn";
      else if(temp.equals("1"))
        Substate = "First Sep";
      else if(temp.equals("2"))
        Substate = "Second Ign";
      else if(temp.equals("3"))
        Substate = "Second Burn";
      else if(temp.equals("4"))
        Substate = "Abort";
    }
    else if(State.equals("Descent:")) {
      if(temp.equals("0"))
        Substate = "Drogue";
      else if(temp.equals("1"))
        Substate = "Main Chute";
      else if(temp.equals("2")) 
        Substate = "Landed";
    }
    else
      Substate = "None";
      
    data = data.substring(index + 1);  
    temp = "";  
      
    for(index = 0; index<data.length() && data.charAt(index) != '*'; index++)
    {
      temp += data.charAt(index);
    }
    numFiles = parseInt(temp);
    
    return(DataString.substring(StartIdx,EndIdx+1));
  }
  return("");
}

float Find_Float(String theString,String theTarget)
{
  int targetIdx = theString.indexOf(theTarget)+theTarget.length();
  int CommaIdx = theString.indexOf(",",targetIdx);
  if (CommaIdx <0) CommaIdx = theString.indexOf("*",targetIdx);
  if(targetIdx>-1 && CommaIdx>targetIdx)
    return (parseFloat(theString.substring(targetIdx,CommaIdx)));
  else
    return(-9999);
}

int Find_Int(String theString,String theTarget)
{
  int targetIdx = theString.indexOf(theTarget)+theTarget.length();
  int CommaIdx = theString.indexOf(",",targetIdx);
  if (CommaIdx<0) CommaIdx = theString.indexOf("*",targetIdx);
  if(targetIdx>-1 && CommaIdx>targetIdx)
    return (parseInt(theString.substring(targetIdx,CommaIdx)));
  else
    return(-9999);
}

int Find_Char(String theString,String theTarget)
{
  int return_val = 0;
  if(theString.indexOf(theTarget) == -1){
    return_val = 0;
  }
  else {
    return_val = 1;
  }
  return return_val;
}









