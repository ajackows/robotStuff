
//Serial setup
int COMPORT = 0;
int baudRate = 9600;

//Filenames
String sFileNameBase = "./logs/IMULog";

//timer setup
int tDataErrDelay = 2000;  // number of milli seconds of no data before we raise an error

// Logging Preferences
int LogData = 0;
int GeoData = 0;

// Euler transforms (make -1 to invert rotation sense)
int RollTransform = -1;
int PitchTransform = -1;
int YawTransform = -1;

// Draw Aircraft = 1 or Draw HUD = 0 like instruments
int DrawAirCraft = 1;

//Green Screen Colours
//text Colours
color cBackground = #000000;
color cNormalText = #ffffff;
color cErrorText = #ff0000;
color cButton = #da000f;
color cButtonBorder = #8b000a;
color cArm = #ff0000;
color cDisarm = #11FF11;
color cZoom = #000000;
//Line Colours
color cFinelines = #888888;
//Gauge Colours
color cRoll = #FF1111;
color cPitch = #11FF11;
color cYaw = #1111FF;
//Graph Colours
color cAccXBar = #1111FF;
color cAccYBar = #11FF11;
color cAccZBar = #FF1111;
color cGyrXBar = #1111FF;
color cGyrYBar = #11FF11;
color cGyrZBar = #FF1111;
color cMagXBar = #1111FF;
color cMagYBar = #11FF11;
color cMagZBar = #FF1111;
// Craft Colours
color cBody = #da000f;
color cWings = #F00000;
color cFin = #00F000;
color cLines = #141414;

/* 
//Original colours
//text Colours
color cBackground = #ffffff;
color cNormalText = #006999;
color cErrorText = #ff0000;
//Line Colours
color cFinelines = #323232;
//Gauge Colours
color cRoll = #FF1111;
color cPitch = #11FF11;
color cYaw = #1111FF;
//Graph Colours
color cAccXBar = #1111FF;
color cAccYBar = #11FF11;
color cAccZBar = #FF1111;
color cGyrXBar = #1111FF;
color cGyrYBar = #11FF11;
color cGyrZBar = #FF1111;
// Craft Colours
color cBody = #6495ed;
color cWings = #F00000;
color cFin = #C8C800;
color cTail = #00F000;
color cLines = #141414;
*/
